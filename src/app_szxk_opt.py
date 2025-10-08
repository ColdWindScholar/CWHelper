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
        call(['adb', 'shell', "ls /etc_ro/test.txt"])
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

