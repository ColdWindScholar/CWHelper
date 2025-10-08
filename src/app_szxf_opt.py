import os
from time import sleep

from src.utils import call
from src.utilities import edit_nv_line, file_modify, set_nv_configs
if os.name == 'nt':
    import wmi

def devcon():
    c = wmi.WMI()
    devices = c.Win32_PnPEntity()
    for device in devices:
        device_str = device.name + devices.deviceid
        if "szxfmob" in device_str or "novoconnectmo" in device_str:
            return True
    return False

def rmcheck():
    global doNotReset
    while not devcon():
        input("未检测到路由器，请检查是否已将路由器连接到此计算机。\n请按任意键重试.")
    print("忠信威路由安全卫士正在扫描恶意软件和漏洞")
    needfix = False
    _, ronv_out = call(['adb', 'shell', 'nv', 'get', "os_url"])
    _, rmc_out = call(['adb', 'shell', 'head', '-n', "1", '/bin/P2x'])
    _, mqtt_out = call(['adb', 'shell', 'head', '-n', "1", "/bin/XMqttClientApp"])
    _, sim_out = call(['adb', 'shell', 'nv', 'get', "sim_switch"])
    if [i for i in ronv_out if "signalinks" in i]:
        needfix = True
    elif [i for i in rmc_out if "#!/bin/sh" in i]:
        needfix = True
    elif [i for i in mqtt_out if "#!/bin/sh" in i]:
        needfix = True
    elif [i for i in sim_out if "1" in i]:
        needfix = True
    read_only = False
    if needfix:
        read_only = False
        print("您的路由器似乎存在木马或漏洞，正在修复")
        print("尝试修复被篡改的数据和配置")
        call(['adb', 'shell', 'rm', '/mnt/userdata/etc_rw/*'])
        call(['adb', 'shell', 'nv', 'restore'])
        call(['adb', 'shell', 'nv', 'save'])
        call(['adb', 'shell', 'mount', '-o', 'remount,rw', '/'])
        call(['adb', 'shell', "echo 'test' > /etc_ro/test.txt"])
        _, out = call(['adb', 'shell', 'ls', '/etc_ro/test.txt'], out=1, return_output=True)
        if not [i for i in out if "file" in i]:
            print("忠信威路由卫士正在查杀恶意软件")
            call(['adb', 'shell', 'rm', '/etc_ro/test.txt'])
            call(['adb', 'shell', "sed -i 's/fota.redstone.net.cn/0-blocked.by.ufitool/g' /lib/librsdlsdk.so"])
            call(['adb', 'shell', "sed -i 's/mg.adups.cn/ufitool.blk/g' /sbin/zte_ufi"])
            call(['adb', 'shell', "sed -i 's/mg.adups.cn/ufitool.blk/g' /sbin/zte_mifi"])
            call(['adb', 'shell', "rm -f /bin/P2x"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/P2x"])
            call(['adb', 'shell', "rm -f /bin/terminal_mgmt"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/terminal_mgmt"])
            call(['adb', 'shell', "rm -f /sbin/tc_tbf.sh"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /sbin/tc_tbf.sh"])
            call(['adb', 'shell', "rm -f /sbin/ip_ratelimit.sh"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /sbin/ip_ratelimit.sh"])
            call(['adb', 'shell', "rm -f /bin/XMqttClientApp"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/XMqttClientApp"])
            call(['adb', 'shell', "mv -n /bin/fota_upi /bin/fota_upi.utbak"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/fota_upi"])
            call(['adb', 'shell', "mv -n /bin/cwmpd /bin/cwmpd.utbak"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/cwmpd"])
            call(['adb', 'shell', "mv -n /bin/dmp_mgmt /bin/dmp_mgmt.utbak"])
            call(['adb', 'shell', "echo '#!/bin/sh' > /bin/dmp_mgmt"])
            call(['adb', 'shell',  "mv -f /bin/tc.bak /bin/tc"])
            call(['adb', 'shell',  "chmod 755 /bin/P2x /bin/terminal_mgmt /sbin/tc_tbf.sh /sbin/ip_ratelimit.sh"])
            call(['adb', 'shell',  "chmod 755 /bin/tc /bin/fota_upi /bin/cwmpd /bin/dmp_mgmt /bin/XMqttClientApp"])
            def out(line):
                line = edit_nv_line(line, "terminal_mgmt_enable", 0)
                line = edit_nv_line(line, "os_url", "http://baidu.com")
                line = edit_nv_line(line, "safecare_enbale", 0)
                line = edit_nv_line(line, "safecare_hostname", "")
                line = edit_nv_line(line, "safecare_mobsite", "")
                line = edit_nv_line(line, "enable_lpa", 0)
                line = edit_nv_line(line, "lpa_trigger_host", "0.1.2.3")
                line = edit_nv_line(line, "pwron_auto_check", 0)
                line = edit_nv_line(line, "fota_updateMode", 0)
                line = edit_nv_line(line, "fota_need_user_confirm_update", 1)
                line = edit_nv_line(line, "fota_need_user_confirm_download", 1)
                line = edit_nv_line(line, "root_Password", "admin")
                line = edit_nv_line(line, "tr069_enable", 0)
                line = edit_nv_line(line, "tr069_inform_enable", 0)
                line = edit_nv_line(line, "tr069_acs_url", "")
                line = edit_nv_line(line, "RateLimitEnable", 0)
                line = edit_nv_line(line, "tc_enable", 0)
                line = edit_nv_line(line, "band_select_enable", 1)
                line = edit_nv_line(line, "ussd_enable", 1)
                line = edit_nv_line(line, "vpn_enable", 1)
                line = edit_nv_line(line, "dns_manual_func_enable", 1)
                line = edit_nv_line(line, "tr069_func_enable", 1)
                line = edit_nv_line(line, "mqtt_host", "fuck.you")
                line = edit_nv_line(line, "xfwy_mqtt_host", "fuck.you")
                line = edit_nv_line(line, "xfwy_mqtt_port", 250)
                line = edit_nv_line(line, "HOST_FIELD", "'Host: NULL'")
                line = edit_nv_line(line, "URI_FIELD", "")
                line = edit_nv_line(line, "TM_SERVER_NAME", "0.1.2.3")
                line = edit_nv_line(line, "TM_SERVER_PORT", 250)
                line = edit_nv_line(line, "sim_lock_status", "unlock")
                line = edit_nv_line(line, "lock_network_status", "unlock")
                line = edit_nv_line(line, "cstm_webui_imei", 1)
                line = edit_nv_line(line, "cstm_webui_ttl", 1)
                line = edit_nv_line(line, "cstm_webui_dns", 1)
                line = edit_nv_line(line, "cstm_webui_bandselect", 1)
                line = edit_nv_line(line, "cstm_webui_simswitch", 1)
                line = edit_nv_line(line, "cstm_webui_unlocksim", 1)
                line = edit_nv_line(line, "hostName", "")
                line = edit_nv_line(line, "portNum", 404)
                line = edit_nv_line(line, "nofast_port", "")
                line = edit_nv_line(line, "fota_oem", "FUCK")
                line = edit_nv_line(line, "fota_platform", "YOU")
                line = edit_nv_line(line, "fota_dm_vendor", "SB")
                line = edit_nv_line(line, "fota_token_rs", "")
                line = edit_nv_line(line, "fota_product_secret", "")
                line = edit_nv_line(line, "fota_product_id", 0)
                line = edit_nv_line(line, "fota_token_zx", "")
                line = edit_nv_line(line, "fota_token_gs", "")
                line = edit_nv_line(line, "zunlocktimes", 99)
                return line
            file_modify(out, True, "/etc_ro/default/default_parameter_sys")
            file_modify(out, True, "/etc_ro/default/default_parameter_user")
            call(['adb', 'shell', "nv restore"])
            call(['adb', 'shell', "nv save"])
            ok = True
        else:
            read_only = True
            print("忠信威路由卫士正在修复系统漏洞")
            set_nv_configs("terminal_mgmt_enable", 0)
            set_nv_configs("os_url", "")
            set_nv_configs("safecare_enbale", 0)
            set_nv_configs("safecare_hostname", "")
            set_nv_configs("safecare_mobsite", "")
            set_nv_configs("enable_lpa", 0)
            set_nv_configs("lpa_trigger_host", "")
            set_nv_configs("pwron_auto_check", 0)
            set_nv_configs("fota_updateMode", 0)
            set_nv_configs("fota_need_user_confirm_update", 1)
            set_nv_configs("fota_need_user_confirm_download", 1)
            set_nv_configs("root_Password", "admin")
            set_nv_configs("tr069_enable", 0)
            set_nv_configs("tr069_inform_enable", 0)
            set_nv_configs("tr069_acs_url", "")
            set_nv_configs("RateLimitEnable", 0)
            set_nv_configs("tc_enable", 0)
            set_nv_configs("band_select_enable", 1)
            set_nv_configs("ussd_enable", 1)
            set_nv_configs("vpn_enable", 1)
            set_nv_configs("dns_manual_func_enable", 1)
            set_nv_configs("tr069_func_enable", 1)
            set_nv_configs("mqtt_host", "fuck.you")
            set_nv_configs("xfwy_mqtt_host", "fuck.you")
            set_nv_configs("xfwy_mqtt_port", 250)
            set_nv_configs("HOST_FIELD", "'Host: NULL'")
            set_nv_configs("URL_FIELD", "")
            set_nv_configs("TM_SERVER_NAME", "")
            set_nv_configs("TM_SERVER_PORT", 250)
            set_nv_configs("sim_lock_status", "unlock")
            set_nv_configs("lock_network_status", "unlock")
            set_nv_configs("cstm_webui_imei", 1)
            set_nv_configs("cstm_webui_ttl", 1)
            set_nv_configs("cstm_webui_dns", 1)
            set_nv_configs("cstm_webui_bandselect", 1)
            set_nv_configs("cstm_webui_simswitch", 1)
            set_nv_configs("cstm_webui_unlocksim", 1)
            set_nv_configs("hostName", "")
            set_nv_configs("portNum", 404)
            set_nv_configs("nofast_port", "")
            set_nv_configs("fota_oem", "FUCK")
            set_nv_configs("fota_platform", "YOU")
            set_nv_configs("fota_dm_vendor", "SB")
            set_nv_configs("fota_token_rs", "")
            set_nv_configs("fota_product_secret", "")
            set_nv_configs("fota_product_id", 0)
            set_nv_configs("fota_token_zx", "")
            set_nv_configs("fota_token_gs", "")
            set_nv_configs("zunlocktimes", 99)
            call(['adb', 'shell', "nv save"])
            ok = True
        if ok != True:
            print("糟糕，修复失败！")
            return 1
        else:
            print("安全加固成功！")
    else:
        print("您的路由器很健康，无需修复。")
    print("需要尝试切换当前使用的SIM卡吗？(实验性功能，不一定管用)")
    choice = print("1.更改为内置卡优先 2.更改为外卡槽优先 3.取消")
    if choice == '2':
        call(['adb', 'shell', "nv", "set", "sim_switch_running_detect=0"])
        call(['adb', 'shell', "nv", "set", "sim_auto_switch_enable=0"])
        call(['adb', 'shell', "nv", "set", "sim_detect_mode=0"])
        call(['adb', 'shell', "nv", "set", "sim_switch=0"])
        call(['adb', 'shell', "nv", "set", "alk_sim_select=1"])
        call(['adb', 'shell', "nv", "set", "alk_sim_current=1"])
        call(['adb', 'shell', "nv", "save"])
        print(" √ 已设置为使用实体卡槽")
        print("但如果恢复出厂设置，将会恢复为系统默认选项。")
        doNotReset = True
    elif choice == '1':
        call(['adb', 'shell', "nv", "set", "sim_switch_running_detect=0"])
        call(['adb', 'shell', "nv", "set", "sim_auto_switch_enable=1"])
        call(['adb', 'shell', "nv", "set", "sim_detect_mode=0"])
        call(['adb', 'shell', "nv", "set", "sim_switch=1"])
        call(['adb', 'shell', "nv", "set", "alk_sim_select=0"])
        call(['adb', 'shell', "nv", "set", "alk_sim_current=0"])
        print(" √ 已设置为使用内置ESIM")
        print("但如果恢复出厂设置，将会恢复为系统默认选项。")
        doNotReset = True
    else:
        print("已跳过切卡")
    if read_only != True:
        print("需要系统初始SIM卡设置吗？")
        choice = print("1.更改为内置卡优先 2.更改为外卡槽优先 3.取消")
        if choice == '2':
            def out(line):
                line = edit_nv_line(line, "sim_switch", 0)
                line = edit_nv_line(line, "sim_switch_bak", 0)
                line = edit_nv_line(line, "sim_default_type", 0)
                line = edit_nv_line(line, "sim_auto_switch_enable", 0)
                line = edit_nv_line(line, "sim_detect_mode", 0)
                line = edit_nv_line(line, "sim_switch_running_detect", 0)
                line = edit_nv_line(line, "alk_sim_select", 1)
                return line
            file_modify(out, True, "/etc_ro/default/default_parameter_sys")
            file_modify(out, True, "/etc_ro/default/default_parameter_user")
            print(" √ 已将系统默认SIM选项更新为实体卡槽优先")
            doNotReset = True
        elif choice == '1':
            def out(line):
                line = edit_nv_line(line, "sim_switch", 1)
                line = edit_nv_line(line, "sim_switch_bak", 1)
                line = edit_nv_line(line, "sim_default_type", 1)
                line = edit_nv_line(line, "sim_auto_switch_enable", 0) 
                line = edit_nv_line(line, "sim_detect_mode", 0)
                line = edit_nv_line(line, "sim_switch_running_detect", 0)
                line = edit_nv_line(line, "alk_sim_select", 0)
                return line
            file_modify(out, True, "/etc_ro/default/default_parameter_sys")
            file_modify(out, True, "/etc_ro/default/default_parameter_user")
            print(" √ 已将系统默认SIM选项更新为内置ESIM优先")
            doNotReset = True
        else:
            print("已跳过修改系统默认SIM选项")
        if doNotReset or read_only:
            input("如果您恢复出厂设置，本次安装的某些补丁会失效。\n因此请尽可能避免重置设备，否则需要重新进行优化。\n回车继续")
        print("操作完成，正在重启设备...")
        call(['adb', 'shell', "reboot"])
        sleep(3)
        call(['adb', 'shell', "reboot"])
        call(['adb', 'shell', "reboot"])

def start():
    while not devcon():
        input("未检测到路由器，请检查是否已将路由器连接到此计算机。\n请按任意键重试.")
    print("正在智能搜索路由器...")
    call(['adb', 'kill-server'])
    call(['adb', 'start-server'])
    call(['adb', 'devices'])
    _, shpath = call(['adb', 'devices'], out=1, return_output=True)
    if [i for i in shpath if "szxf" in i]:
        rmcheck()
    else:
        print("路由器类型不支持优化功能。")

