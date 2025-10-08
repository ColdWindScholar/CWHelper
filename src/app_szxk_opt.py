import os
from src.utils import call
from src.utilities import edit_nv_line, file_modify, set_nv_configs
if os.name == 'nt':
    import wmi

def devcon():
    c = wmi.WMI()
    devices = c.Win32_PnPEntity()
    for device in devices:
        device_str = device.name + devices.deviceid
        if "szxkmob" in device_str or "demomob" in device_str:
            return True
    return False

def rmcheck():
    while not devcon():
        input("未检测到路由器，请检查是否已将路由器连接到此计算机。\n请按任意键重试.")
    print("忠信威路由安全卫士正在扫描恶意软件和漏洞")
    _, ronv = call(['adb', 'shell', 'nv', 'get', 'os_url'], out=1, return_output=True)
    _, rmc = call(['adb', 'shell', 'ls', '/sbin/aliyun_thing'], out=1, return_output=True)
    _, sim = call(['adb', 'shell', 'nv', 'get', 'esim_login_psw_mode'], out=1, return_output=True)
    _, mark = call(['adb', 'shell', 'nv', 'get', 'product_model_prefix'], out=1, return_output=True)
    _, v3t = call(['adb', 'shell', 'head', '-n', '2', '/sbin/v3t_limit.sh'], out=1, return_output=True)
    needfix = False
    if  [i for i in ronv if 'think-will' in i]:
        needfix = True
    elif not [i for i in rmc if "file" in i]:
        needfix = True
    elif not [i for i in sim if '0' in i]:
        needfix = True
    elif not [i for i in mark if 'ufitool' in i]:
        needfix = True
    elif [i for i in v3t if 'exit' in i]:
        needfix = True
    if needfix:
        read_only = False
        print("您的路由器似乎存在木马或漏洞，正在处理")
        call(['adb', 'shell', 'mount', '-o', 'remount,rw', '/'])
        call(['adb', 'shell', "echo 'test' > /etc_ro/test.txt"])
        _, out = call(['adb', 'shell', "ls /etc_ro/test.txt"], out=1, return_output=True)
        _, mtd = call(['adb', 'shell', 'cat', '/proc/mtd'])
        if [i for i in mtd if 'yaffs' in i or 'zterw' in i]:
            is128M = True
        else:
            is128M = False
        if is128M:
            print("忠信威路由卫士正在全局优化加固")
            call(['adb', 'shell', 'rm', '/etc_ro/test.txt'])
            print("\t● 移除恶意软件")
            call(['adb', 'shell', 'mv', '/bin/zte_dm', '/bin/zte_dm.utbak'])
            call(['adb', 'shell', 'mv', '/bin/zte_mqtt_sdk', '/bin/zte_mqtt_sdk.utbak'])
            call(['adb', 'shell', 'mv', '/bin/ztedm_timer', '/bin/ztedm_timer.utbak'])
            print("\t● 修复系统漏洞")
            def mod(line):
                line = edit_nv_line(line, "need_support_sms", "yes", True)
                line = edit_nv_line(line, "os_url", "", True)
                line = edit_nv_line(line, "safecare_enbale", 0, True)
                line = edit_nv_line(line, "safecare_hostname", "", True)
                line = edit_nv_line(line, "safecare_mobsite", "", True)
                line = edit_nv_line(line, "hostName", "", True)
                line = edit_nv_line(line, "pwron_auto_check", 0, True)
                line = edit_nv_line(line, "fota_updateMode", 0, True)
                line = edit_nv_line(line, "fota_need_user_confirm_update", 1, True)
                line = edit_nv_line(line, "fota_need_user_confirm_download", 1, True)
                line = edit_nv_line(line, "fota_need_user_confirm_download", 1, True)
                line = edit_nv_line(line, "fota_dm_vendor", "ufitool", True)
                line = edit_nv_line(line, "fota_token_rs", "", True)
                line = edit_nv_line(line, "fota_token_zx", "", True)
                line = edit_nv_line(line, "fota_token_gs", "", True)
                line = edit_nv_line(line, "fota_product_id", "-1", True)
                line = edit_nv_line(line, "fota_product_secret", "", True)
                return line
            file_modify(mod, True, "/etc_ro/default/default_parameter_user")
            file_modify(mod, True, "/etc_ro/default/default_parameter_sys")
            print("\t● 净化系统设置")
            set_nv_configs("usim_active", 1, True)
            _, out = call(['adb', 'shell', 'cat', '/sbin/start_telnetd.sh'], out=1, return_output=True)
            if not [i for i in out if 'usim_active' in i]:
                call(["adb", "shell", "echo  >> /sbin/start_telnetd.sh"])
                call(["adb", "shell", "echo 'usim=$(nv get usim_active)' >> /sbin/start_telnetd.sh"])
                call(["adb", "shell","echo 'if [ \"$usim\" != \"1\" ]; then' >> /sbin/start_telnetd.sh"])
                call(["adb", "shell","echo '    nv set usim_active=1' >> /sbin/start_telnetd.sh"])
                call(["adb", "shell","echo '    nv save' >> /sbin/start_telnetd.sh"])
                call(["adb", "shell","echo 'fi' >> /sbin/start_telnetd.sh"])
                call(["adb", "shell","echo  >> /sbin/start_telnetd.sh"])
            call(['adb', 'shell', 'sed', '-i', r's/\.disabled=true/\.disabled=false/g', '/etc_ro/web/js/adm/changesim.js'])
            print("\t   卡槽已激活，请手动登录网页后台确认切卡状态。")
            call(['adb', 'shell', "rm /.ash_history;ln -s /tmp/.ash_history /.ash_history"])
            ok = True
        elif not [i for i in out if 'file' in i]:
            print("忠信威路由卫士正在全局优化加固")
            call(['adb', 'shell', 'rm', '/etc_ro/test.txt'])
            print("\t● 移除恶意软件")
            call(['adb', 'shell', 'rm', '/sbin/aliyun_thing'])
            call(['adb', 'shell', 'rm', '/sbin/aliyun_mqtt'])
            call(['adb', 'shell', 'rm', '/usr/bin/easycwmpd'])
            call(['adb', 'shell', 'rm', '/sbin/tw_seecom_app','/sbin/tw_seecom_app.utbak'])
            call(['adb', 'shell', 'rm', '/sbin/tw_update', '/sbin/tw_update.utbak'])
            call(['adb', 'shell', 'rm', '/sbin/tw_cloudc'])
            call(['adb', 'shell', 'rm', '/etc_ro/cgi-bin/tw_update_sys', '/etc_ro/cgi-bin/tw_update_sys.utbak'])
            call(['adb', 'shell', 'rm', '/sbin/tw_esim_app', '/sbin/tw_esim_app.utbak'])
            call(['adb', 'shell', 'rm', '/bin/fota_dm_rs'])
            call(['adb', 'shell', 'rm', '/bin/fota_upi'])
            call(['adb', 'shell', "echo '#!/bin/sh' > /sbin/tc_tbf.sh"])
            call(['adb', 'shell', "echo 'exit 0' >> /sbin/tc_tbf.sh"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /sbin/v3t_limit.sh"])
            call(['adb', 'shell', "echo 'exit 0' >> /sbin/v3t_limit.sh"])
            call(['adb', 'shell', "chmod 755 /sbin/tc_tbf.sh"])
            _, out = call(['adb', 'shell', 'cat', '/sbin/start_telnetd.sh'])
            if not [i for i in out if 'tw_fota_dm' in i]:
                call(['adb', 'shell', "echo  >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo 'fotadm=$(nv get tw_fota_dm)' >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo 'if [ \"$fotadm\" == \"1\" ]; then' >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo '    nv set tw_fota_dm=0' >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo '    nv save' >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo 'fi' >> /sbin/start_telnetd.sh"])
                call(['adb', 'shell', "echo  >> /sbin/start_telnetd.sh"])
            print("\t● 修复系统漏洞")
            call(['adb', 'shell', "sed -i 's/fota.redstone.net.cn/0-blocked.by.ufitool/g' /lib/librsdlsdk.so"])
            call(['adb', 'shell', "sed -i 's/.aliyuncs.com/ufitool.block/g' /lib/liblinkkit.so"])
            call(['adb', 'shell', "sed -i 's/mg.adups.cn/ufitool.blk/g' /sbin/zte_mifi"])
            call(['adb', 'shell', "mount", '-o', 'remount,rw', '/mnt/imagefs'])
            call(['adb', 'shell',"sed -i 's/update2.zte.com.cn/blocked.by.ufitool/g' /mnt/imagefs/nvrwall.bin"])
            _, out = call(['adb', 'shell', 'nv', 'get', 'sn_boardnum'])
            if [i for i in out if i.strip("\r").strip("\n")]:
                call(['adb', 'shell', 'mount', '-o', 'remount,rw', '/mnt/nvrofs'])
                call(['adb', 'shell', "dd if=/dev/zero of=/mnt/nvrofs/nvroall.bin bs=1 count=20 seek=40 conv=notrunc"])
            call(['adb', 'push', 'res/6FBEADFC', '/mnt/userdata/.uart'])
            call(['adb', 'shell', 'chmod', '755', '/mnt/userdata/.uart'])
            call(['adb', 'shell', "/mnt/userdata/.uart AT+TWRSFOTA=0"])
            call(['adb', 'shell', "/mnt/userdata/.uart AT+TWOTAMODE="])
            call(['adb', 'shell', "rm" ,"/mnt/userdata/.uart"])
            print("\t● 补全缺失配置")



