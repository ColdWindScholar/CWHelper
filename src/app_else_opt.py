from src.utilities import *

if os.name == 'nt':
    import wmi


def devcon():
    c = wmi.WMI()
    devices = c.Win32_PnPEntity()
    for device in devices:
        device_str = device.name + devices.deviceid
        if "demomob" in device_str or "alkmob" in device_str:
            return True
    return False


def rmcheck():
    doNotReset = False
    while not devcon():
        input("未检测到路由器，请检查是否已将路由器连接到此计算机。\n请按任意键重试.")

    def batch_handle(objs, func):
        objs = objs.replace('\r', '')
        for obj in objs.split('\n') if isinstance(objs, str) else objs:
            if obj:
                func(obj)

    def batch_exec(path, type_, cmd, base=None):
        if base is None:
            base = '/'
        ret, output = call(["adb", "shell", f"cd {base};find {path} -type {type_}"], out=1, return_output=True)
        batch_handle(output, lambda file: call([cmd % file]))

    print("忠信威路由安全卫士正在扫描恶意软件和漏洞")
    _, ronv = call(['adb', 'shell', 'cat', '/etc_rw/nv/main/ro'], out=1, return_output=True)
    rmc = False
    for rmc_file in ['/bin/rmc', "/bin/iccid_check", "/bin/qrzl_app"]:
        _, rmc_check = call(['adb', 'shell', 'ls', rmc_file], out=1, return_output=True)
        rmc = bool([i for i in rmc_check if "file" in i])
        if rmc:
            break
    _, shpath = call(['adb', 'shell', 'nv', 'get', 'path_sh'], out=1, return_output=True)
    needfix = False
    if [i for i in ronv if "/" in i and "%." in i] == 2:
        needfix = True
    elif [i for i in shpath if i.startswith("/sbin")] and rmc:
        needfix = True
    if not needfix:
        print("您的路由器很健康，无需修复。")
    else:
        print("您的路由器似乎存在木马或漏洞，正在修复")
        print("尝试修复被篡改的数据和配置")
        call(['adb', 'shell', 'rm', '/mnt/userdata/etc_rw/*'])
        call(['adb', 'shell', 'nv', 'set', 'wifiEnabled=1'])
        call(['adb', 'shell', 'nv', 'set', 'fl_rmc_server_disconnect_reboot=0'])
        call(['adb', 'shell', 'nv', 'set', 'fl_set_iptables_flag=0'])
        call(['adb', 'shell', 'nv', 'set', 'limitspeed=0'])
        call(['adb', 'shell', 'nv', 'set', 'fl_use_fake_batt=0'])
        call(['adb', 'shell', 'nv', 'set', 'fl_esim_slot=2'])
        call(['adb', 'shell', 'nv', 'set', 'alk_sim_select=1'])
        call(['adb', 'shell', 'nv', 'set', 'alk_sim_current=1'])
        call(['adb', 'shell', 'nv', 'save'])
        call(['adb', 'shell', 'mount', '-o', 'remount,rw', '/'])
        _, o1 = call(["adb", "shell", "echo ok>/test 2>&1"], out=1, return_output=True)
        if not [i for i in o1 if "readonly" in i.lower()]:
            call(['adb', 'shell', "rm /test"])
            print("忠信威路由卫士正在查杀恶意软件")
            call(['adb', 'shell', "echo \"#!/bin/sh\">/bin/XMqttClientApp"])
            call(['adb', 'shell', "echo \"#!/bin/sh\">/bin/rmc"])
            call(['adb', 'shell', "echo \"#!/bin/sh\">/bin/iccid_check"])
            call(['adb', 'shell', "echo \"sleep 365d\">>/bin/iccid_check"])
            call(['adb', 'shell', "echo \"#!/bin/sh\">/sbin/tc_tbf.sh"])
            call(['adb', 'shell', "chmod 755 /bin/rmc /bin/iccid_check /sbin/tc_tbf.sh /bin/XMqttClientApp"])
            call(['adb', 'shell', "echo \"forcenetcard_type=force_invalid\">/tmp/default_parameter_ro"])
            call(['adb', 'shell', "echo \"usb_modetype=debug\">>/tmp/default_parameter_ro"])
            call(['adb', 'shell', "echo \"ro_ssid_pre=\" >> /tmp/default_parameter_ro"])
            call(['adb', 'shell', "echo \"ro_key=\" >> /tmp/default_parameter_ro"])
            call(['adb', 'shell', "echo \"ro_key_len=\" >> /tmp/default_parameter_ro"])
            call(['adb', 'shell', "cat /tmp/default_parameter_ro > /etc_ro/default/default_parameter_ro"])
            call(['adb', 'shell', "rm -f /tmp/default_parameter_ro"])
            call(['adb', 'shell', "chmod 755 /etc_ro/default/default_parameter_ro"])
            call(['adb', 'shell', "sed -i 's/iptables -I/iptables -D/g' /sbin/tc_tbf.sh"])
            call(['adb', 'shell', "sed -i 's/down/up/g' /sbin/tc_tbf.sh"])
            ok = True
        else:
            print("正在安装忠信威路由卫士提供的安全补丁")
            call(['adb', 'shell', 'rm', '-rf', "/mnt/userdata/etc_rw/sh"])
            call(['adb', 'shell', 'rm', '-rf', "/mnt/userdata/shadow"])
            call(['adb', 'shell', 'rm', '-rf', "/mnt/userdata/.ut"])
            call(['adb', 'shell', 'mkdir', '-p', "/mnt/userdata/.ut/sbin/"])
            call(['adb', 'push', 'res\\2CA1491A', "/mnt/userdata/.ut/sbin/.zip.gz"])
            call(['adb', 'shell', 'gunzip', "/mnt/userdata/.ut/sbin/.zip.gz"])
            call(['adb', 'shell', 'rm', "/mnt/userdata/.ut/sbin/.zip.gz"])
            call(['adb', 'shell', 'unzip', "/mnt/userdata/.ut/sbin/.zip", "-d", "/mnt/userdata/.ut/sbin/"])
            call(['adb', 'shell', 'rm', "/mnt/userdata/.ut/sbin/.zip"])
            call(['adb', 'shell', "cat /sbin/global.sh >> /mnt/userdata/.ut/sbin/global.sh"])
            _, qrzl_app = call(["adb", "shell", "ls", "/bin/qrzl_app"], out=1, extra_path=True)
            if [i for i in qrzl_app if "file" in i]:
                call(['adb', 'shell', "cat /mnt/userdata/.ut/sbin/ro > /mnt/userdata/etc_rw/nv/main/ro"])
                call(['adb', 'shell', "cat /mnt/userdata/.ut/sbin/ro > /mnt/userdata/etc_rw/nv/backup/ro"])
            call(['adb', 'shell', 'rm', "/mnt/userdata/.ut/sbin/ro"])
            call(['adb', 'shell', "chmod 640 /mnt/userdata/etc_rw/nv/main/ro /mnt/userdata/etc_rw/nv/backup/ro"])
            call(['adb', 'shell', "echo \"nv set fl_set_iptables_flag=0\">>/mnt/userdata/.ut/sbin/tc_tbf.sh"])
            call(['adb', 'shell', "echo \"nv save\">>/mnt/userdata/.ut/sbin/tc_tbf.sh"])
            call(['adb', 'shell', "cat /sbin/fl_set_iptables.sh > /mnt/userdata/.ut/sbin/fl_set_iptables.sh"])
            call(['adb', 'shell', "chmod 755 /mnt/userdata/.ut/sbin/fl_set_iptables.sh"])
            call(['adb', 'shell', "sed -i 's/iptables -I/iptables -D/g' /mnt/userdata/.ut/sbin/fl_set_iptables.sh"])
            call(['adb', 'shell', "sed -i 's/down/up/g' /mnt/userdata/.ut/sbin/fl_set_iptables.sh"])
            call(['adb', 'shell',
                  "echo \". /mnt/userdata/.ut/sbin/fl_set_iptables.sh\">>/mnt/userdata/.ut/sbin/tc_tbf.sh"])
            call(['adb', 'shell', "echo \"echo ufitool init ok\">>/mnt/userdata/.ut/sbin/tc_tbf.sh"])
            batch_exec("/sbin", "f", 'adb shell "ln -s %s /mnt/userdata/.ut/sbin/"')
            call(["adb", "shell", "chmod", "-R", "777", "/mnt/userdata/.ut/sbin/"])
            call(["adb", "shell", "nv", "set", "path_sh=/mnt/userdata/.ut/sbin"])
            call(["adb", "shell", "nv", "save"])
            _, out = call(['adb', 'shell', 'cat', '/etc_rw/nv/main/ro'], out=1, extra_path=True)
            if [i for i in out if "/" in i and "%." in i] == 2:
                ok = False
            else:
                ok = True
                doNotReset = True
            if not ok:
                print("糟糕，修复失败！")
                return 1
            else:
                print("安全加固成功，正在重启路由器...")
                print("请耐心等待路由器重启完成；如果路由器未重启或长时间无响应，请手动重启设备。")
                call(['adb', 'shell', 'reboot'])
            if doNotReset:
                print("请您务必留意：")
                print("  本次安装的某些补丁会在恢复出厂设置后失效；")
                print("  因此请不要重置设备，否则需要重新进行优化。")


def start():
    call(['adb', 'kill-server'])
    call(['adb', 'start-server'])
    call(['adb', 'wait-for-device'])
    return rmcheck()
