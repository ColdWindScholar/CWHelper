from libregmngr import get_pref
from src.utilities import safesh, edit_nv_line, file_modify
from src.utils import call


def is_rootfs_rw():
    safesh("mount -o remount,rw /")
    _, mounts = safesh("cat /proc/mounts")
    if [i for i in mounts if "/dev/root / ext4 rw," in i or "/dev/root / jffs2 rw," in i or "/dev/root / squashfs rw," in i]:
        return True
    return False

def set_nv_config_batch(nv_settings:dict, rw_rootfs:bool):
    if rw_rootfs:
        print("检测到可写文件系统，启用彻底编辑模式")
        def sys_modifier(line):
            for key, value in nv_settings.items():
                line = edit_nv_line(line, key, value, True)
            return line
        file_modify(sys_modifier, True, "/etc_ro/default/default_parameter_sys")
        file_modify(sys_modifier, True, "/etc_ro/default/default_parameter_user")
    print("批量设置NVRAM变量...")
    for key, value in nv_settings.items():
        safesh(f"nv set {key}={value}")
    safesh("nv save")

def perform_non_rootfs_operations():
    print("执行免修改系统分区操作...")
    safesh("mount -o remount,rw /mnt/imagefs")
    safesh("mount -o remount,rw /mnt/nvrofs")
    safesh("rm -rf /mnt/userdata/etc_rw/*")
    safesh("rm -f /mnt/userdata/etc_rw/nv/main/ro")
    safesh("rm -f /mnt/userdata/etc_rw/nv/backup/ro")
    safesh("rm -f /mnt/userdata/etc_rw/remo_esim*")
    _, outs = safesh("nv get sn_boardnum")
    if [i for i in outs if i.endswith('\r\n')]:
        safesh("dd if=/dev/zero of=/mnt/nvrofs/nvroall.bin bs=1 count=20 seek=40 conv=notrunc")

def perform_rootfs_operations():
    print("执行系统分区修改操作...")
    files_to_disable = ["/bin/XMqttClientApp", "/bin/rmc", "/bin/iccid_check", "/sbin/tc_tbf.sh", "/bin/P2x",
                        "/bin/terminal_mgmt", "/sbin/ip_ratelimit.sh", "/bin/fota_upi", "/bin/cwmpd",
                        "/bin/dmp_mgmt", "/sbin/aliyun_thing", "/sbin/aliyun_mqtt", "/usr/bin/easycwmpd",
                        "/sbin/tw_seecom_app", "/sbin/tw_update", "/sbin/tw_cloudc",
                        "/etc_ro/cgi-bin/tw_update_sys", "/bin/fota_dm_rs", "/sbin/v3t_limit.sh", "/bin/zte_dm",
                        "/bin/zte_mqtt_sdk", "/bin/ztedm_timer"]
    files_to_backup_and_disable = ["/sbin/tw_esim_app"]
    for filepath in files_to_disable:
        safesh(f"rm -f {filepath}")
        safesh(f"echo '#!/bin/sh' > {filepath}")
        safesh(f"echo 'exit 0' >> {filepath}")
        safesh(f"chmod 755 {filepath}")
    for filepath in files_to_backup_and_disable:
        safesh(f"mv -n {filepath} {filepath}.utbak")
        safesh(f"echo '#!/bin/sh' > {filepath}")
        safesh(f"echo 'exit 0' > {filepath}")
        safesh(f"chmod 755 {filepath}")
    safesh("rm -f /.ash_history;ln -s /tmp/.ash_history /.ash_history")
    safesh("sed -i 's/fota.redstone.net.cn/0-blocked.by.ufitool/g' /lib/librsdlsdk.so")
    safesh("sed -i 's/mg.adups.cn/ufitool.blk/g' /sbin/zte_ufi")
    safesh("sed -i 's/mg.adups.cn/ufitool.blk/g' /sbin/zte_mifi")
    safesh("sed -i 's/.aliyuncs.com/ufitool.block/g' /lib/liblinkkit.so")
    safesh("sed -i 's/update2.zte.com.cn/blocked.by.ufitool/g' /mnt/imagefs/nvrwall.bin")
    safesh("sed -i 's/\.disabled=true/\.disabled=false/g' /etc_ro/web/js/adm/changesim.js")
    def out(line):
        if "hasUpgrade1" in line and "autoUpgrade" in line:
            line = line.replace("hasUpgrade1", "hasWifi",1)
            line = line.replace("#autoUpgrade", "#telnetd",1)
            line = line.replace("upgrade", "telnetd",2)
        elif "network_display" in line and 'dial_setting' in line:
            line = line.replace("network_display", "hasWifi",1)
            line = line.replace("#dial_setting", "#advance3113",1)
            line = line.replace("my_router", "ESIM/SIM",1)
        elif "hasParentalControl" in line and "parental_control" in line:
            line = line.replace("hasParentalControl", "network_display",1)
        return line
    file_modify(out, True, "/etc_ro/web/tmpl/home.html")

def main():
    print("等待设备连接...")
    call(['adb', 'wait-for-device'])
    print("开始执行通用固件优化...")
    nv_settings = get_pref()
    print("步骤 1/3: 检测系统分区状态")
    rootfs_is_writable = is_rootfs_rw()
    print("步骤 2/3: 执行基础优化")
    perform_non_rootfs_operations()
    set_nv_config_batch(nv_settings, rootfs_is_writable)
    if rootfs_is_writable:
        print("步骤 2.5/3: 系统分区可写，执行深度优化")
        perform_rootfs_operations()
    else:
        print("步骤 2.5/3: 系统分区只读，跳过深度优化")
    print("步骤 3/3: 完成优化并重启设备")
    safesh('reboot')

