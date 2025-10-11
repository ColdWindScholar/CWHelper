# hello
# !/bin/env python3
import hashlib
import io
import os
import re
import shutil
import sys
import time
from shutil import move
from time import sleep

import requests

from src.app_else_opt import start as app_else_opt_start
from src.app_remo_opt import main as app_remo_opt
from src.app_szxf_opt import start as app_szxf_opt_start
from src.app_szxk_opt import start as app_szxk_opt_start
from src.app_zxw_safe import main as app_zxw_safe_start
from src.ateer import ateer
from src.calc_pwd import calc_pwd
from src.mtdcut import main as mtdcut
from src.mtdjoin import main as mtdjoin
from src.mtdrepk import main as mtdrepk
from src.mtdunpk import main as mtdunpk
from src.sn_search import main as sn_search
from src.utilities import generate_imei
from src.utils import call, ebinner

if os.name == 'nt':
    import ctypes

    ctypes.windll.kernel32.SetConsoleTitleW("CWHelper")
else:
    sys.stdout.write("\x1b]2;CWHelper\x07")
    sys.stdout.flush()


def md5_for_large_file(file_path, chunk_size=1024 * 1024):
    md5 = hashlib.md5()
    with open(file_path, 'rb') as f:
        while True:
            data = f.read(chunk_size)
            if not data:
                break
            md5.update(data)
    return md5.hexdigest()


class Main:
    def __init__(self):
        self.local_dir = os.getcwd()
        self.split_mark = "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════"

    def check_adb_status(self):
        ret, adb_output = call(["adb", "devices"], return_output=True, out=1)
        has_device = False
        is_offline = False
        for line in adb_output:
            if re.match("[^\r\n]+", line):
                if re.match("^(\\S*?)\tdevice$", line):
                    has_device = True
                if "offline" in line:
                    is_offline = True
        print("\033[33m\033[1m设备状态：\033[0m",
              "\033[32m\033[1m已连接\033[0m" if has_device else "\033[31m\033[1m无设备\033[0m",
              "\033[32m(\033[0m\033[31m\033[1m离线\033[0m\033[32m)\033[0m" if is_offline else "")
        return has_device, is_offline

    def get_nv_value(self, param) -> str:
        ret, adb_output = call(["adb", "shell", "nv", "get", param], return_output=True, out=1)
        for line in adb_output:
            if line and not "inaccessible or not found" in line:
                return line
        return ""

    def is_serial_port_connected(self) -> bool:
        for i in range(1, 257):
            try:
                file = io.open(rf"\\.\COM{i}")
            except (FileNotFoundError, PermissionError, OSError):
                continue
            file.close()
            return True
        return False

    def check_serial(self):
        print("\033[33m\033[1m串口状态(AT等)：\033[0m",
              "\033[32m\033[1m已连接\033[0m" if self.is_serial_port_connected() else "\033[31m\033[1m无设备\033[0m")

    def is_adb_device_connected(self) -> bool:
        ret, check = call(["adb", "get-state"], return_output=True, out=1)
        if not [i for i in check if "device" == i]:
            print()
            print("\033[31m\033[1m[错误] 未检测到ADB设备，请连接设备后重试。\033[0m")
            print("\033[32m\033[1m提示:如果设备处于连接但离线模式，设备adb也是不可用。\033[0m")
            print()
            return False
        return True

    def mtd_check(self):
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print("以下为您的设备MTD挂载状态")
        ret, adb_output = call(["adb", "shell", "cat", "/proc/mtd"], return_output=True, out=1)
        if ret:
            input("查询失败，回车继续")
            return 2
        for i in adb_output:
            print(i)
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print("一般情况下,mtd4:'rootfs'")
        print(" 小部分机器是mtd4:'imagefs'")
        print("  本工具箱目前仅支持mtd4:'rootfs'的机器")
        print("   后期可能考虑添加mtd5机器支持")
        return input("回车以继续")

    def install_drive(self):
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print("请选择要安装的驱动(没安过建议全安)：")
        print()
        print(
            "\033[36m\033[1m           1.通用安卓ADB驱动      2.中兴微驱动      3.移远的ASR专用驱动       4.紫光SPD通用驱动\033[0m")
        print("\033[31m\033[1m提示:中兴驱动为秒安驱动,安装过程只会弹出cmd。如果安装成功则会直接关闭。\033[0m")
        print()
        drive_selection = input("\033[32m请输入数字并按 Enter 键: \033[0m")
        if drive_selection == "1":
            call([f"{self.local_dir}/file/drive/vivo-drive.exe"], extra_path=False)
        elif drive_selection == "2":
            call([f"{self.local_dir}/file/drive/ZXIC_Develop_Driver.exe"], extra_path=False)
            input("\033[32m按任意键开始安装补充驱动......\033[0m")
            call([f"{self.local_dir}/file/drive/zxicser.exe"], extra_path=False)
        elif drive_selection == "3":
            call([f"{self.local_dir}/file/drive/Quectel_LTE_Windows_USB_Driver.exe"], extra_path=False)
        elif drive_selection == "4":
            for num, i in enumerate(['Drivers/DriversForWin10/DriverSetup.exe', 'DriverCoding/64install.exe', 'DRIVER_R4.19.5001/DriversForWin10/DriverSetup.exe',
                                     "RDA_Driver_R2.21.5001/DriversForWin10/DPInst64.exe", "SPRD_NPI_USBDriver_1.4/64install.exe"]):
                print(f"正在安装紫光驱动 {num + 1}/5", i, f"{self.local_dir}/file/drive/SPD_Driver/{i}")
                if call([f"{self.local_dir}/file/drive/SPD_Driver/{i}"], extra_path=False):
                    print("安装失败，请使用管理员运行该工具。")

    def set_adb(self):
        # to recovery adb ,first try at command , then use ftp to push a adbd and run it via at command.
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print()
        print("\033[31m\033[1m警告!请先连接设备WIFI或网络,否则程序卡死[滑稽笑]\033[0m")
        print()
        ip_address = input("\033[32m设备WEB地址(例如 192.168.100.1): \033[0m\033[31m\033[1m")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print(
            f"\033[36m\033[1m使用小贴士:\033[0m\033[32m部分设备厂家删除adbd后端,导致开完adb后依然是无法使用状态(离线模式),详情请看助手主页设备状态")
        print(
            "\033[36m\033[1m =------\033[0m\033[35m\033[1m选择模式\033[36m\033[1m------------------------------------------------------------------------------------------------=")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =    \033[0m\033[33m1. 调试模式(ADB+AT+网络)     2. 工厂端口模式(仅AT)       3. 仅系统模式(慎用)        4. 关闭所有模式      \033[36m\033[1m =")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =    \033[0m\033[33m5. Remo专用调试模式(ADB+AT+网络)                                                                         \033[36m\033[1m =")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =--------------------------------------------------------------------------------------------------------------=\n")
        adb_selection = input("\033[32m请输入数字并按 Enter 键: \033[0m\033[31m\033[1m")
        if adb_selection == "1":
            print("\033[34m\033[1m")
            print(requests.post(f"http://{ip_address}/goform/goform_set_cmd_process",
                                data={"isTest": "false", "goformId": 'tw_telnet_config', "telnetd_enable": "1",
                                      "debug_enable": "1"}).text)
            print(requests.get(
                f"http://{ip_address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=2").text)
            print(requests.get(
                f"http://{ip_address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=1").text)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1").text)
            for user in ["coolfish666", "xscmadmin888", "MM888", "159258"]:
                print(
                    requests.get(
                        f"http://{ip_address}/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1&password={user}@Qiruizhilian20241202").text)
            print("\033[32m\033[1m\n稍后重启设备(5秒).....\033[0m\033[34m\033[1m")
            sleep(5)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=REBOOT_DEVICE").text)
            print(requests.get(f"http://{ip_address}/goform/goform_set_cmd_process?goformId=REBOOT_DEVICE").text)
        elif adb_selection == "2":
            print("\033[34m\033[1m")
            print(requests.get(
                f"http://{ip_address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=2").text)
            print("\033[32m\033[1m\n稍后重启设备(5秒).....\033[0m\033[34m\033[1m")
            sleep(5)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=REBOOT_DEVICE").text)
            print(requests.get(f"http://{ip_address}/goform/goform_set_cmd_process?goformId=REBOOT_DEVICE").text)
        elif adb_selection == "3":
            print("\033[34m\033[1m")
            print(requests.get(
                f"http://{ip_address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=3").text)
            print("\033[32m\033[1m\n稍后重启设备(5秒).....\033[0m\033[34m\033[1m")
            sleep(5)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=REBOOT_DEVICE").text)
            print(requests.get(f"http://{ip_address}/goform/goform_set_cmd_process?goformId=REBOOT_DEVICE").text)
        elif adb_selection == "4":
            print("\033[34m\033[1m")
            print(requests.post(f"http://{ip_address}/goform/goform_set_cmd_process",
                                data={"isTest": "false", "goformId": 'tw_telnet_config', "telnetd_enable": "0",
                                      "debug_enable": "0"}).text)
            print(requests.get(
                f"http://{ip_address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=0").text)
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?goformId=ID_SENDAT&at_str_data=AT%2BZMODE%3D0").text)
            print("\033[32m\033[1m\n稍后重启设备(5秒).....\033[0m\033[34m\033[1m")
            sleep(5)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=REBOOT_DEVICE").text)
            print(requests.get(f"http://{ip_address}/goform/goform_set_cmd_process?goformId=REBOOT_DEVICE").text)
        elif adb_selection == "5":
            print("\033[31m\033[1m\n\n警告:该方式来源于Remo内部人员\033[34m\033[1m")
            print(
                "\033[31m\033[1m\n\n仅适用于第四代机型以前的版本(即24年6月之前),其他版本估计会遇到错误\033[34m\033[1m")
            print("\033[32m\033[1m\n正在向系统发送请求.....\033[0m\033[34m\033[1m")
            print("\033[34m\033[1m")
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?goformId=LOGIN&password=cmVtb19zdXBlcl9hZG1pbl8yMjAx").text)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=LOGIN&password=YWRtaW4%3D").text)
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?goformId=REMO_SIM_SELECT_R1865&isTest=false&sim_option_id=3&select_sim_mode=1").text)
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?goformId=SysCtlUtal&action=System_MODE&debug_enable=1").text)
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?goformId=ID_SENDAT&at_str_data=AT%2BZMODE%3D1").text)
            print(requests.get(f"http://{ip_address}/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1").text)
            print("\033[32m\033[1m\n稍后重启设备(5秒).....\033[0m\033[34m\033[1m")
            sleep(5)
            print(requests.get(
                f"http://{ip_address}/reqproc/proc_post?isTest=false&goformId=RESTORE_FACTORY_SETTINGS").text)
        input("\033[32m\033[1m\n操作已完成，回车返回\033[0m")

    def is_readonly_to_flash(self) -> bool:
        ret, adb_output = call(["adb", "shell", "touch", "/sbin/test"], out=1, return_output=True)
        for i in adb_output:
            if "Read" in i:
                input("\033[31m\033[1m您的设备系统只读,请尝试编程器\033[0m\n回车继续")
                return False
        return True

    def ufi_nv_set(self):
        intype = self.get_nv_value("zcgmi")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        if intype.strip():
            print(f"\033[33m\033[1m设备类型: \033[34m{intype}]\033[0m")
        print(
            "\033[36m\033[1m使用小贴士:\033[0m\033[32m在去控的时候如果设备是jffs2等系统，那么工具会尝试将远控程序铲除。")
        print(
            "\033[36m\033[1m =------\033[35m\033[1m选择模式\033[36m\033[1m------------------------------------------------------------------------------------------------=")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =    \033[0m\033[33m     1. SZXF通用优化       2.ZTE本家优化(SZXK)      3.易连通用优化(ALK)       4.格行V1.3降级V1.2          \033[36m\033[1m=")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m  =                                                                      以后会陆续支持更多设备,请期待助手ota    =")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        selection = input("\033[32m请输入数字并按 Enter 键: \033[0m\033[31m\033[1m")
        print("\033[0m")
        if selection == "1":
            self.is_adb_device_connected()
            print("挂载读写")
            call(["adb", "shell", "mount", "-o", "remount,rw", "/"])
            print("关闭并篡改升级")
            for i in ["fota_updateMode=0",
                      "fota_updateIntervalDay=365",
                      "fota_platform=Punguin",
                      "fota_token_rs=0",
                      "fota_version_delta_id=",
                      "fota_version_delta_url=",
                      "fota_version_name=", "fota_upgrade_result_internal=", "fota_oem=QEJ"
                      ]:
                call(['adb', 'shell', 'nv', "set", i])
            print("篡改远控配置")
            call(['adb', 'shell', 'rm', '-rf', '/bin/terminal_mgmt'])
            call(['adb', 'shell', 'rm', '-rf', '/sbin/ip_ratelimit.sh'])
            for i in ["traffic_mgmt_enable=0", "terminal_mgmt_enable=0", "tr069_enable=0", "enable_lpa=0",
                      "lpa_trigger_host=info.punguin.cn", "os_url=http://punguin.cn/",
                      "TM_SERVER_NAME=reportinfo.punguin.cn", "HOST_FIELD=reportinfo.punguin.cn"]:
                call(['adb', 'shell', 'nv', "set", i])
            print("增强功能")
            for i in ["sim_auto_switch_enable=0", "sim_switch=1", "sim_unlock_code=az952#", "sim_default_type=1",
                      "band_select_enable=1",
                      "dns_manual_func_enable=1", "tr069_func_enable=1", "ussd_enable=1", "pdp_type=IPv4v6",
                      "zcgmi=SZXF-Punguin"]:
                call(['adb', 'shell', 'nv', "set", i])
            print("保存NV设置")
            call(['adb', 'shell', 'nv', "save"])
            print("\033[32m\033[1mnv编辑器：参数已保存\033[0m")
            print("\033[34m\033[1m正在给设备加水印\033[0m")
            call(['adb', 'shell',
                  "echo 'copyright = 此设备软件由 &copy; ColdWindScholar 修改' >> /etc_ro/web/i18n/Messages_zh-cn.properties"])
            call(['adb', 'shell',
                  "echo 'copyright = Software by: &copy; ColdWindScholar Revise' >> /etc_ro/web/i18n/Messages_en.properties"])
            call(['adb', 'shell', "nv set cr_version=SZXF-Punguin_P001-20250601 &' >> /etc/rc"])
            print("\033[32m\033[1m出现Read-only file system是正常的\033[0m")
            print("\033[31m\033[1m修改完成，恢复出厂将会丢失更改，不要恢复出厂\033[0m")
            input("回车继续")
        elif selection == "2":
            self.is_adb_device_connected()
            print("\033[34m\033[1m挂载读写...\033[0m")
            call(["adb", "shell", "mount", "-o", "remount,rw", "/"])
            print("\033[34m\033[1m检查文件系统...\033[0m")
            if not self.is_readonly_to_flash():
                return 1
            print("\033[32m\033[1m已挂载根目录为可读写，正在停止厂家服务...\033[0m")
            call(['adb', 'shell', 'killall', 'fota_Update'])
            call(['adb', 'shell', 'killall', 'fota_upi'])
            call(['adb', 'shell', 'killall', 'zte_mqtt_sdk'])
            print("\033[32m\033[1m已关闭多个进程\033[0m")
            print("\033[33m正在优化设备nv配置...\033[0m")
            for i in ["mqtt_syslog_level=0", "dm_enable=0", "mqtt_enable=0", "tc_enable=0", "tc_downlink=",
                      "tc_uplink=", "tr069_enable=0", "fota_updateMode=0", "fota_version_delta_id=",
                      "fota_version_delta_url=",
                      "fota_version_name=", "fota_upgrade_result_internal="]:
                call(["adb", 'shell', 'nv', 'set', i])
            call(["adb", 'shell', 'nv', 'save'])
            print("\033[32m\033[1mnv编辑器：参数已保存\033[0m")
            print("\033[34m\033[1m正在给设备加水印\033[0m")
            call(['adb', 'shell',
                  "echo 'copyright = 此设备软件由 &copy; ColdWindScholar 修改' >> /etc_ro/web/i18n/Messages_zh-cn.properties"])
            call(['adb', 'shell',
                  "echo 'copyright = Software by: &copy; ColdWindScholar Revise' >> /etc_ro/web/i18n/Messages_en.properties"])
            call(['adb', 'shell', "echo 'nv set cr_version=SZXK-Punguin_P049U-20250601 &' >> /etc/rc"])
            print("\033[32m\033[1m出现Read-only file system是正常的\033[0m")
            print('\033[33m正在修改设备文件\033[0m')
            call(['adb', 'push', 'file/gsmtty', '/bin'])
            call(['adb', 'shell', "chmod +x /bin/gsmtty"])
            call(['adb', 'shell', 'gsmtty', 'AT+ZCARDSWITCH=0'])
            call(['adb', 'push', 'file/hosts', '/etc/hosts'])
            call(['adb', 'shell', "chmod", "+x", "/etc/hosts"])
            call(['adb', 'shell', 'rm', '-r', '-rf', '/sbin/tc_tbf.sh'])
            call(['adb', 'push', "file/tc_tbf.sh", "/sbin/tc_tbf.sh"])
            call(['adb', 'shell', "rm", "-rf", "/sbin/start_update_app.sh"])
            call(['adb', 'shell', "rm", "-rf", "/bin/fota_Update"])
            call(['adb', 'shell', "rm", "-rf", "/bin/fota_upi"])
            call(['adb', 'shell', "echo 'killall zte_de &' >> /etc/rc"])
            call(['adb', 'shell', "echo 'killall ztede_timer &' >> /etc/rc"])
            call(['adb', 'shell', "echo 'killall zte_mqtt_sdk &' >> /etc/rc"])
            print('\033[33m清理临时文件...\033[0m')
            call(['adb', 'shell', 'rm', '-r', "-rf", "/bin/miniupnp"])
            call(['adb', 'shell', 'rm', '-r', "-rf", "/bin/gsmtty"])
            call(['adb', 'shell', 'reboot'])
            input("\033[32m\033[1m完成,请等待设备开机\033[0m\n回车继续")
        elif selection == '3':
            def get_adb_state():
                ret_code, out = call(['adb', 'get-state'], out=1, return_output=True)
                for i in out:
                    if i.strip():
                        return i.strip()
                return None

            def is_system_readonly():
                call(['adb', "shell", "mount", "-o", "remount,rw", "/"])
                ret_code, output = call(['adb', "shell", "touch /sbin/test"], out=1, return_output=True)
                for i in output:
                    if "Read" in i:
                        return True
                return False

            def handle_readonly():
                print("\033[32m\033[1m系统为只读，正在执行只读系统的专属代码...\033[0m")
                print("\033[33m\033[1m正在优化设备nv配置...\033[0m")
                for nv_set in ["dm_enable=0", "mqtt_enable=0", "tc_enable=0", "tc_downlink=", "tc_uplink=",
                               "fota_updateMode=0", "fota_version_delta_id=",
                               "fota_version_delta_url=", "fota_version_name=", "fota_upgrade_result_internal=",
                               "fl_autoswitchsim=0", "alk_sim_select=0", "path_sh=/etc_rw/sbin"]:
                    call(['adb', 'shell', 'nv', 'set', nv_set])
                call(['adb', 'shell', 'nv', 'save'])
                print("\033[32m\033[1mnv编辑器：参数已保存\033[0m")
                call(['adb', 'shell', 'mkdir', '-p', "/etc_rw/sbin"])
                call(['adb', 'shell', 'cp', '/sbin/*.sh', "/etc_rw/sbin"])
                print("\033[33m正在修改设备文件\033[0m")
                call(['adb', 'shell', "echo 'killall iccid_check' >> /etc_rw/sbin/global.sh"])
                call(['adb', 'shell', "echo 'killall mqtt_client' >> /etc_rw/sbin/global.sh"])
                call(['adb', 'shell', "echo 'killall vsim' >> /etc_rw/sbin/global.sh"])
                call(['adb', 'shell', "echo 'killall rmc' >> /etc_rw/sbin/global.sh"])
                call(['adb', 'shell', "reboot"])
                input("\033[31m修改完成，恢复出厂将会丢失更改，不要恢复出厂\033[0m\n回车以继续")

            def handle_rw():
                print("\033[32m\033[1m系统可读写，正在执行可读写系统的专属代码...\033[0m")
                print("\033[33m正在优化设备nv配置...\033[0m")
                call(['adb', 'shell', "echo 'tc_enable=0' >> /etc_ro/default/default_parameter_sys"])
                call(['adb', 'shell', "echo 'alk_sim_select=0' >> /etc_ro/default/default_parameter_user"])
                call(['adb', 'shell', "echo 'fota_updateMode=0' >> /etc_ro/default/default_parameter_user"])
                call(['adb', 'shell', 'nv', 'set', 'tc_enable=0'])
                call(['adb', 'shell', 'nv', 'setro', 'alk_server=0.1.2.3'])
                call(['adb', 'shell', 'nv', 'save'])
                print("\033[32m\033[1mnv编辑器：参数已保存\033[0m")
                print("\033[34m正在给设备加水印\033[0m")
                call(['adb', 'shell',
                      "echo 'copyright = 此设备软件由 &copy; ColdWindScholar 修改' >> /etc_ro/web/i18n/Messages_zh-cn.properties"])
                call(['adb', 'shell',
                      "echo 'copyright = Software by: &copy; ColdWindScholar Revise' >> /etc_ro/web/i18n/Messages_en.properties"])
                call(['adb', 'shell', "echo 'nv set cr_version=ALK-Punguin_P049U-20250813 &' >> /etc/rc"])
                print("\033[33m正在修改设备文件\033[0m")
                for file in ['bin/iccid_check', 'bin/mqtt_client', 'bin/vsim', 'bin/rmc', '/sbin/fl_set_iptables.sh']:
                    call(['adb', 'shell', 'rm', '-rf', file])
                input("\033[31m修改完成，操作已固化，设备可以恢复出厂\033[0m\n回车以继续")

            def check_system_rw():
                print("\033[33m正在检测设备系统是否为只读...\033[0m")
                is_readonly = is_system_readonly()
                print("\033[32m\033[1m检测结果：系统为", "只读" if is_readonly else "可读写", "。\033[0m")
                handle_readonly() if is_readonly else handle_rw()

            def main():
                state = get_adb_state()
                if not state:
                    input("\033[31m未检测到任何设备，请先开启 ADB 或连接设备。\033[0m\n回车以继续。")
                if state == "device":
                    print("\033[32m\033[1m设备已连接。\033[0m")
                    check_system_rw()
                    input("回车以继续。")
                if state == "offline":
                    print("\033[33m检测到设备状态为 offline。\033[0m")
                    choice = input('\033[36m\033[1m是否唤醒设备的 ADB？(y/n):\033[0m')
                    if choice in ['y', "Y"]:
                        print("尝试唤醒设备 ADB...")
                        ateer("at+shell=adbd")
                        if get_adb_state() == 'device':
                            print("\033[32m\033[1m设备已成功上线，ADB 正常。\033[0m")
                            check_system_rw()
                        else:
                            print("\033[31m设备仍为 offline，可能需要手动检查或重启设备。\033[0m")
                    else:
                        print("\033[33m此设备未进行任何修改。\033[0m")
                    input("回车以继续。")
                    return
                print(f"\033[33m未知设备状态:{state}\033[0m")
                input("回车以继续。")

            main()
        elif selection == '4':
            self.is_adb_device_connected()
            print("\033[34m\033[1m挂载读写...\033[0m")
            call(["adb', 'shell", "mount", "-o", "remount,rw", "/"])
            print("\033[34m\033[1m检查文件系统...\033[0m")
            if self.is_readonly_to_flash():
                return 1
            print("\n\n")
            print("\033[31m\033[1m使用须知:")
            print("目前该版本软件仅适用于格行GX009自带线快充充电宝\033[0mSN为XFWP25开头的设备")
            print(
                "\033[31m\033[1m对于商业批量改装降级本工具是禁止使用的，如您使用本工具来进行商业批量设备修改我们不会对您的操作做任何担保。")
            print(
                "对于格行官方所说的禁止修改设备，我们身为已购买设备的主人有权更改我们所有的设备(在更改设备后我们\033[0m自愿放弃所有保修\033[31m\033[1m)本工具更改全程免费，无需付费，不存在盈利行为。\033[0m")
            print("\n\n")
            input("\033[32m请输入YES以进行后续操作:\033[31m\033[1m")
            print("\033[32m\033[1m已挂载根目录为可读写，正在停止厂家服务...\033[0m")
            call(['adb', "shell", 'killall', "iccid_check"])
            call(['adb', "shell", 'killall', "goahead"])
            call(['adb', "shell", 'killall', "zte_mifi"])
            print("\033[32m\033[1m已关闭多个进程\033[0m")
            print("\033[34m正在更改系统版本\033[0m")
            call(["adb", "shell", "echo 'nv set cr_version=ALK-Punguin_P012-20250814 &' >> /etc/rc"])
            print("\033[33m正在修改设备文件\033[0m")
            call(["adb", "shell", "rm", "-rf", "/sbin/zte_mifi"])
            call(["adb", "shell", "rm", "-rf", "/bin/iccid_check"])
            call(["adb", "shell", "rm", "-rf", "/bin/goahead"])
            call(["adb", "shell", "rm", "-rf", "-r", "/etc_ro/web"])
            call(["adb", "shell", "rm", "-rf", "-r", "/etc_ro/mmi"])
            call(["adb", "shell", "rm", "-r", "-rf", "/sbin/tc_tbf.sh"])
            call(["adb", "shell", "rm", "-rf", "/sbin/start_update_app.sh"])
            print("\033[31m设备内核已被删除，请不要关机设备\033[0m\n" * 3)
            print("\033[32m正在安装新内核文件与补丁...\033[0m")
            call(["adb", "push", "file/gx009/zte_mifi", "/sbin/zte_mifi"])
            call(["adb", "push", "file/gx009/goahead", "/bin/goahead"])
            call(["adb", "push", "file/gx009/web.zip", "/tmp/web.zip"])
            call(["adb", "push", "file/gx009/mmi.zip", "/tmp/mmi.zip"])
            call(["adb", "push", "file/gsmtty", "/bin/gsmtty"])
            call(["adb", "push", "file/at_web/at_server", "/bin/at_server"])
            call(["adb", "push", "file/tc_tbf.sh", "/sbin/tc_tbf.sh"])
            print("\033[33m文件已传输完成，即将进行解压操作\033[0m")
            call(['adb', "shell", "unzip /tmp/web.zip -d /etc_ro/"])
            call(['adb', "shell", "unzip /tmp/mmi.zip -d /etc_ro/"])
            print("\033[34m正在设置文件权限...\033[0m")
            call(['adb', "shell", "chmod +x /sbin/zte_mifi"])
            call(['adb', "shell", "chmod +x /bin/goahead"])
            call(['adb', "shell", "chmod +x /etc_ro/web/*"])
            call(['adb', "shell", "chmod +x /etc_ro/mmi/*"])
            call(['adb', "shell", "chmod +x /bin/at_server"])
            call(['adb', "shell", "chmod +x /bin/gsmtty"])
            print("\033[33m设置额外运行时后端...\033[0m")
            call(["adb", "shell", "echo 'at_server &' >> /etc/rc"])
            print("\033[32m切换外置卡槽...\033[0m")
            call(['adb', 'shell', "gsmtty", "AT+ZCARDSWITCH=0"])
            print("\033[33m清理临时文件...\033[0m")
            call(["adb", "shell", "rm", "-r", "-rf", "/bin/gsmtty"])
            call(["adb", "shell", "reboot"])
            print("\033[32m\033[1m完成,请等待设备开机\033[0m")
            input("回车以继续")
        return None

    def uisoc(self):
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print("\033[33m      1.查询聚火SN\033[0m")
        print("\033[34m      2.修改设备参数\033[0m")
        print("\033[36m      3.ResearchDownload\033[0m")
        print("\033[32m      4.spd_dump\033[0m")
        print("\033[37m      5.切卡\033[0m")
        print("按下回车返回")
        choice111 = input("\033[32m请输入并按Enter键: \033[0m")
        if choice111 == "1":
            sn_search()
            input("回车继续")
        elif choice111 == "2":
            call(["explorer", "file/tool/Pandora_R22.20.1701"], extra_path=False)
        elif choice111 == "3":
            call(["explorer", "file/tool/ResearchDownload"], extra_path=False)
        elif choice111 == "4":
            call(["explorer", "file/tool/spd_dump"], extra_path=False)
        elif choice111 == "5":
            print("\033[31m\033[1m警告!请先连接设备WIFI或网络,否则程序卡死[滑稽笑]\033[0m")
            ip_address = input("\033[32m设备WEB地址(例如 192.168.100.1):\033[31m\033[1m")
            call(['explorer', f"http://{ip_address}//postesim?postesim=%7B%22esim%22:0%7D"], extra_path=False)

    def calc_switch_card_pwd(self):
        imei_data = input("输入您IMEI后六位:")
        result = calc_pwd(imei_data)
        input(f"\033[33m您的切卡密码为:\033[0m\033[32m{result or "计算失败"}\033[0m\n回车继续")

    def set_wifi(self):
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print(
            "\033[31m使用须知:\033[34m\033[1m目前版本暂不支持给您的路由器设置WiFi密码,只支持修改您的WiFi名称,支持中文")
        print("         支持小部分表情符号与大部分中文字符。如果遇到WiFi消失、WiFi无法连接等问题,请长按恢复出厂按钮。")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        your_ip = input("\033[32m设备WEB地址(例如 192.168.100.1):\033[31m\033[1m")
        print(f"\033[34m\033[1m请先在电脑上登录设备后台: http://{your_ip}/\033[0m")
        your_ssid = input("\033[32m请输入你的 SSID:\033[31m\033[1m")
        print("\033[0m")
        max_access = input("\033[32m最大接入设备数:\033[31m\033[1m")
        print("\033[0m")
        data = {
            "goformId": "SET_WIFI_SSID1_SETTINGS",
            "ssid": your_ssid,
            "broadcastSsidEnabled": "0",
            "MAX_Access_num": f"{max_access}",
            "security_mode": "OPEN",
            "cipher": "2",
            "NoForwarding": "0",
            "show_qrcode_flag": "0",
            "security_shared_mode": "NONE"
        }
        for t in ['goform/goform_set_cmd_process', 'reqproc/proc_post']:
            print(requests.post(f"http://{your_ip}/{t}", data=data).text)

        print("\033[32m如果此时WiFi断开代表设置成功")
        print("否则失败")

    def zfile_web(self):
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")

        def check_file():
            print("\033[34m]\033[1m搜寻设备...\033[0m")
            if not self.check_adb_status() == (True, False):
                input("\033[31m当前无设备连接\033[0m\n回车继续")
                return 1
            _, output = call(["adb", "shell", "touch", "/etc_ro/web/test_file"], out=1, return_output=True)
            if [i for i in output if "Read" in i]:
                print(f"\033[36m\033[1m{self.split_mark}\033[0m")
                print("\033[31m该机器为只读文件系统 (squashfs)\033[0m")
                print("\033[34m强行刷入会导致您的设备丢失后台\033[0m")
                input("回车继续")
                return 1
            else:
                print('\033[32m\033[1m该机器为可写文件系统,支持文件上传(可能是jffs2)\033[0m')
                print(f"\033[36m\033[1m{self.split_mark}\033[0m")
                return 0

        def file():
            file_path = input("\033[33m请将文件夹拖入此窗口，然后按回车键:\033[0m")
            if not os.path.exists(file_path):
                print("\033[31m无效的文件路径。\033[0m")
                return None
            if not os.path.isdir(file_path):
                return None
            return file_path

        def backup_web_folder(temp_backup_path):
            print("\033[32m正在备份设备后台WEB文件夹...\033[0m")
            return call(["adb", "pull", "/etc_ro/web", temp_backup_path])

        def move_backup_folder(temp_backup_path, backup_dir):
            folder_name = input("\033[33m请输入备份文件夹的名称:\033[31m")
            print("\033[34m")
            try:
                move(temp_backup_path, backup_dir + "/" + folder_name)
            except Exception as e:
                print(f"\033[31m移动文件失败，请检查权限。{e}\033[0m")
            else:
                print(f"\033[32m备份完成，文件已保存到:{backup_dir + "/" + folder_name}\033[0m")
            print("\033[0m")

        def backup_web():
            script_dir = self.local_dir
            temp_backup_path = script_dir + "/web_backup"
            backup_dir = script_dir + "/TQ"
            user_input = input("\033[33m\033[1m是否备份设备原后台? (y/n)\033[0m")
            if user_input in ["y", "Y"]:
                backup_result = backup_web_folder(temp_backup_path)
                if backup_result:
                    print("\033[31m备份失败，请检查设备连接及权限。\033[0m")
                else:
                    move_backup_folder(temp_backup_path, backup_dir)
            else:
                print("\033[34m已跳过备份操作\033[0m")
            print(f"\033[36m\033[1m{self.split_mark}\033[0m")

        def up_web():
            call(['adb', "shell", "rm", "-rf", "/etc_ro/web"])
            folder_path = file()
            if not folder_path:
                print("\033[31m路径不合规\033[0m")
                return 1
            call(["adb", "push", folder_path, "/etc_ro/web"])
            print("\033[32m上传完成,设备web已替换!\033[0m")
            return None

        call(["adb", "shell", "mount", "-o", "remount,rw", "/"])
        if check_file():
            return
        backup_web()
        up_web()
        input("回车继续")

    def xr_web(self):
        self.is_adb_device_connected()
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print(
            f"\033[36m\033[1m使用小贴士:\033[0m\033[32m使用本程序的设备必须是jffs2等系统，目前不支持squashfs只读压缩文件系统。")
        print(
            "\033[36m\033[1m =------\033[35m\033[1m选择写入模式\033[36m\033[1m--------------------------------------------------------------------------------------------=")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =\033[0m\033[33m     1.自定义文件        2.通用ATweb高级web                                                                   \033[36m\033[1m=")
        print(
            "\033[36m\033[1m =                                                                                                              =")
        print(
            "\033[36m\033[1m =--------------------------------------------------------------------------------------------------------------=")
        web_selection = input("\033[32m请输入数字并按 Enter 键: \033[0m")
        if web_selection == "1":
            self.zfile_web()
        elif web_selection == "2":
            print("\033[34m挂载读写...\033[0m")
            call(["adb", "shell", "mount", "-o", "remount,rw", "/"])
            print("\033[33m\033[1m传输文件(卡住就是不支持)...\033[0m")
            '''
            --os.execute("bin/adb push file/at_web/at_server /bin/at_server")
		--os.execute("bin/adb shell chmod +x ./bin/at_server")
		--os.execute("bin/adb push file/at_web/at_info.html /etc_ro/web/at_info.html")
		--os.execute("bin/adb push file/at_web/css/at.css /etc_ro/web/css/at.css")
		--os.execute("bin/adb push file/at_web/js/at.js /etc_ro/web/js/at.js")
            '''
            print("\033[35m\033[1m设置自启动...\033[0m")
            """--os.execute([[bin/adb shell "echo 'at_server &' >> /sbin/rm_dev.sh"]])
		--os.execute("start /min bin/adb shell at_server &")"""
            print("\033[32m设置成功啦！！")
            ret, adb_output = call(['adb', "shell", "nv", "get", "lan_ipaddr"], out=1, return_output=True)
            for i in adb_output:
                ip = re.match("\\d+\\.\\d+\\.\\d+\\.\\d+", i)
                if i and ip:
                    print(f"\033[36m检测到设备IP:\033[33m{ip[0]}\033[0m")
                    choice = input("\033[36m是否要在浏览器中打开 ATweb? (y/n):")
                    if choice in ["Y", 'y']:
                        input(f"http://{ip[0]}:9090/at_info.html")

    def zmtd_brusquel(self):
        def copy_to_workdir(src_path):
            shutil.copyfile(src_path, "mtd.bin")
            return "mtd.bin"

        def adb_push(local_file, device_file):
            return call(["adb", "push", local_file, device_file])

        def get_device_md5(device_file):
            _, output = call(["adb", "shell", "md5sum", device_file])
            for i in output:
                if i:
                    return i
            return None

        def compare_md5(local_md5, device_md5):
            if local_md5.lower() != device_md5.lower():
                print("\033[31mmd5校验失败，文件可能损坏，已中止刷写，请重启设备后重新开始\033[0m")
                return 1
            return 0

        def prepare_device_environment():
            call(["adb", "shell", "mount", "-t", "tmpfs", "rw,remount", "/tmp"])
            adb_push("file/busybox", "/tmp")
            call(["adb", "shell", "ln", "-s", "/tmp/busybox", "/tmp/dd"])
            call(["adb", "shell", "ln", "-s", "/tmp/busybox", "/tmp/sh"])
            call(["adb", "shell", "ln", "-s", "/tmp/busybox", "/tmp/reboot"])
            call(["adb", "shell", "chmod", "+x", "/tmp/busybox", "/tmp/reboot", "/tmp/sh", "/tmp/dd"])

        def optional_backup():
            choice = input(
                "\033[34m是否进行备份当前分区\033[36m\033[1m(\033[31m备份将耗费较长时间\033[36m\033[1m)\033[33m[需要输yes，回车跳过]\033[0m")
            if choice == 'yes':
                timestamp = time.strftime("%Y%m%d%H%M", time.localtime())
                userprofile: str = os.getenv("USERPROFILE") if os.name == 'nt' else os.getenv("HOME")
                backup_folder = os.path.join(userprofile, "Desktop/MTD分区备份")
                filename = f"MTD4备份{timestamp}.bin"
                desktop_path = os.path.join(backup_folder, filename)
                os.makedirs(backup_folder, exist_ok=True)
                with open(f"{backup_folder}/readme.txt", "w", encoding='utf-8', newline='\n') as f:
                    f.write(
                        "此文件夹由CWHelper MTD刷写器生成，您已选择将MTD文件备份。\n本工具支持多次备份并不覆盖原文件，您无需删除原文件。\n\n您可以将备份的MTD文件重新写入设备。")
                if not call(["adb", "pull", "/dev/mtd4", desktop_path]):
                    print(f"\033[32m备份完成，已保存至桌面:{desktop_path}\033[0m")
                else:
                    print("\033[31m失败！:\033[0m")
            else:
                print("\033[33m 已选择无需备份，跳过备份步骤\033[0m")

        def upload_flash_files():
            for prog in ["zte_ufi", "zte_mifi", "zte_cpe", "goahead"]:
                call(["adb", "shell", "killall", "-9", prog])
            adb_push('mtd.bin', '/tmp/mtd4.bin')
            call(["adb", "shell", "mkdir", "-p", "/mnt/userdata/temp/"])

        def write_flash_script():
            adb_push("file/flash.sh", "/mnt/userdata/temp/flash.sh")
            call(["adb", "shell", "chmod", "+x", "/mnt/userdata/temp/flash.sh"])

        def final_confirmation():
            print("\033[32m全部文件已经推送成功！\033[0m")
            print("\033[31m请确认提供的文件全部正确！这是您最后的机会！\033[0m")
            print("\033[31m输入'IAMSURE'进行下一操作\033[0m")
            while input("输入:") != "IAMSURE":
                continue

        def execute_flash():
            input("回车以开始刷机！")
            print("\033[33m正在刷机！请勿关闭设备和本工具！\033[0m")
            call(["adb", "shell", "/mnt/userdata/temp/flash.sh"])
            print("\033[32m设备刷写完成，请等待设备开机，感谢使用。\033[0m")
            print("\033[33m机器插上闪一下灯关机就是砖了，请用编程器救回！\033[0m")

        if not self.is_adb_device_connected():
            input("回车继续")
            return 1
        user_path = input("\033[33m请将要写入的文件拖入此窗口后按回车：\033[0m")
        copy_to_workdir(user_path)
        local_md5 = md5_for_large_file("mtd.bin")
        adb_push("mtd.bin", "/tmp/mtd4.bin")
        device_md5 = get_device_md5("/tmp/mtd4.bin")
        if compare_md5(local_md5, device_md5):
            input("回车继续")
            return 1
        prepare_device_environment()
        optional_backup()
        upload_flash_files()
        write_flash_script()
        final_confirmation()
        execute_flash()
        return None

    def zmtd_extract(self):
        script_dir = self.local_dir
        qt_folder = script_dir + "/TQ"
        os.makedirs(qt_folder, exist_ok=True)
        print("\033[34m\033[1m搜寻设备...\033[0m")
        call(["adb", "pull", "/dev/mtd4", "draw.tmp"])
        print("\033[32m已尝试提取\033[0m")
        new_file_name = input("请输入新的文件名（不含扩展名）：")
        new_file_name = new_file_name + ".bin"
        old_file_path = os.path.join(script_dir, 'draw.tmp')
        try:
            os.rename(old_file_path, os.path.join(qt_folder, new_file_name))
        except (OSError, IOError, PermissionError) as e:
            print(f"\033[31m重命名失败: {e}\033[0m")
        else:
            print(f"\033[32m文件已成功重命名为: {new_file_name},文件已成功移动至QT文件夹\033[0m")
        input("回车继续")

    def machine_material(self):
        print("\033[36m正在获取...\033[0m")
        if not self.is_adb_device_connected():
            input("回车继续")
            return 1
        get_nv_value = self.get_nv_value
        intype = get_nv_value("zcgmi")
        fota_platform = get_nv_value("fota_platform")
        cr_version = get_nv_value("cr_version")
        remo_web_sw_version = get_nv_value("remo_web_sw_version")
        hw_version = get_nv_value("hw_version")
        os_url = get_nv_value("os_url")
        Language = get_nv_value("Language")
        fota_oem = get_nv_value("fota_oem")
        apn_mode = get_nv_value("apn_mode")
        default_apn = get_nv_value("default_apn")
        SSID1 = get_nv_value("SSID1")
        m_SSID = get_nv_value("m_SSID")
        DMZEnable = get_nv_value("DMZEnable")
        upnpEnabled = get_nv_value("upnpEnabled")
        sntp_timezone = get_nv_value("sntp_timezone")
        wifiEnabled = get_nv_value("wifiEnabled")
        max_station_num = get_nv_value("MAX_Station_num")
        sim_unlock_code = get_nv_value("sim_unlock_code")
        remo_sim_admin_password = get_nv_value("remo_sim_admin_password")
        admin_Password = get_nv_value("admin_Password")
        dhcpDns = get_nv_value("dhcpDns")
        tr069_enable = get_nv_value("tr069_enable")
        tr069_acs_url = get_nv_value("tr069_acs_url")

        remo_sim_select = get_nv_value("remo_sim_select_display_type")
        remo_root_server_url = get_nv_value("fota_request_host")
        remo_root_server_url2 = get_nv_value("remo_fota_request_host")
        remo_root_server_url3 = get_nv_value("remo_dm_request_host")
        remo_root_server_port3 = get_nv_value("remo_dm_request_port")
        remo_root_server_path3 = get_nv_value("remo_dm_request_path")
        remo_config_server_url = get_nv_value("xinxun_iot_http_get_config_host")
        remo_config_server_path = get_nv_value("xinxun_iot_http_get_config_path")
        remo_led_server_url = get_nv_value("xinxun_iot_http_led_control_host")
        remo_led_server_path = get_nv_value("xinxun_iot_http_led_control_path")
        remo_flow_server_url = get_nv_value("xinxun_iot_http_flow_report_host")
        remo_flow_server_path = get_nv_value("xinxun_iot_http_flow_report_path")
        remo_info_server_url = get_nv_value("xinxun_iot_http_info_report_host")
        remo_info_server_path = get_nv_value("xinxun_iot_http_info_report_path")

        fota_updateMode = get_nv_value("fota_updateMode")
        fota_updateIntervalDay = get_nv_value("fota_updateIntervalDay")
        fota_version_delta_url = get_nv_value("fota_version_delta_url")
        tc_enable = get_nv_value("tc_enable")
        tc_uplink = get_nv_value("tc_uplink")
        tc_downlink = get_nv_value("tc_downlink")
        os.system("cls") if os.name == "nt" else os.system("clear")
        print("\033[36m--系统信息------------------------------------------------------------------------------\033[0m")
        if intype:
            print(f"\033[32m\033[1m设备类型:{intype}          搭载的平台:{fota_platform}\033[0m")
        else:
            print(f"\033[31m\033[1m无法获取设备类型与搭载的平台\033[0m")
        software_version = remo_web_sw_version or cr_version
        print(f"\033[33m\033[1m软件版本:{software_version or '\033[31m无法获取\033[0m'}\033[0m")
        print(f"\033[33m\033[1m硬件版本:{hw_version or 'Unknown'}\033[0m")
        print(f"\033[33m\033[1m厂家官网:{os_url or 'Unknown'}\033[0m")
        print(f"\033[33m\033[1m设备语言:{Language or 'Unknown'}             生产厂家:{fota_oem or 'Unknown'}\033[0m")
        print(
            "\033[36m--联网信息--------------------------------------------------------------------------------\033[0m")
        print(f"\033[33m\033[1mAPN模式:{apn_mode or 'Unknown'}            当前APN:{default_apn or 'Unknown'}\033[0m")
        print(f"\033[33m\033[1mdmz状态:{DMZEnable or 'Unknown'}           upnp状态:{upnpEnabled or 'Unknown'}\033[0m")
        print(f"\033[33m\033[1mdmz状态:{DMZEnable or 'Unknown'}           upnp状态:{upnpEnabled or 'Unknown'}\033[0m")
        print(
            "\033[36m--WIFI信息--------------------------------------------------------------------------------\033[0m")
        print(
            f"\033[33m\033[1mWIFI开启:{wifiEnabled or 'Unknown'}           最大连接数:{max_station_num or 'Unknown'}\033[0m")
        print(f"\033[33m\033[1m当前WIFI名称:{SSID1 or 'Unknown'}           多重WIFI名称: {m_SSID or 'Unknown'}\033[0m")
        print(
            "\033[36m--网络信息--------------------------------------------------------------------------------\033[0m")
        print(
            f"\033[33m\033[1m后台地址:{dhcpDns or 'Unknown'}           后台密码: {admin_Password or 'Unknown'}\033[0m")
        print(
            "\033[36m--密码相关--------------------------------------------------------------------------------\033[0m")
        print(
            f"\033[33m\033[1mSIM解锁码:{(sim_unlock_code or remo_sim_admin_password) or 'Unknown'}         SIM模式: {remo_sim_select or 'Unknown'}\033[0m")
        print(
            "\033[36m--远程控制--------------------------------------------------------------------------------\033[0m")
        print(
            f"\033[33m\033[1mtr069(acs)开关:{tr069_enable or 'Unknown'}           tr069地址: {tr069_acs_url or 'Unknown'}\033[0m")
        print(
            f"\033[33m\033[1m自动升级：{'关闭' if fota_updateMode == "0" else '是' if fota_updateMode else "Unknown"}           检测时间: {fota_updateIntervalDay or 'Unknown'}天\033[0m")
        print(
            f"\033[33m\033[1m限速开启:{'关闭' if tc_enable == "0" else '是' if tc_enable else "Unknown"}  上传速率: {tc_uplink or 'Unknown'} 下载速率:{tc_downlink or "Unknown"}\033[0m")
        if remo_root_server_url or remo_root_server_url2:
            print(
                f"\033[33m\033[1m主服务器: {remo_root_server_url or 'Unknown'}           备用服务器: {remo_root_server_url2 or 'Unknown'}\033[0m")
            if remo_root_server_url3:
                url3 = ""
                if remo_root_server_port3:
                    url3 = remo_root_server_url3 + ":" + remo_root_server_port3
                if remo_root_server_path3:
                    url3 = remo_root_server_path3 + "/" + remo_root_server_path3
                print(
                    f"\033[33m\033[1m主服务器: {remo_root_server_url or 'Unknown'}           备用服务器: {url3 or 'Unknown'}\033[0m")
        if remo_config_server_url and remo_config_server_path:
            print(
                f"\033[33m\033[1m配置服务器: {remo_config_server_url + "/" + remo_config_server_path or 'Unknown'}\033[0m")
        if remo_led_server_url and remo_led_server_path:
            print(
                f"\033[33m\033[1mLED控制服务器: {remo_led_server_url + "/" + remo_led_server_path or 'Unknown'}\033[0m")
        if remo_flow_server_url and remo_flow_server_path:
            print(
                f"\033[33m\033[1m流量上报服务器: {remo_flow_server_url + "/" + remo_flow_server_path or 'Unknown'}\033[0m")
        if remo_info_server_url and remo_info_server_path:
            print(
                f"\033[33m\033[1m信息上报服务器: {remo_info_server_url + "/" + remo_info_server_path or 'Unknown'}\033[0m")
        print("\033[36m-------------------------------------------------------------------------------------\033[0m")
        input("回车继续")
        return None

    def mtd_extract_mtds(self) -> int:
        os.system("cls") if os.name == "nt" else os.system("clear")
        print("本工具可以从带ADB的ZXIC设备中提取固件，非常安全可靠，不会造成任何损害。")
        print("然而，我们仍不推荐在非ZXIC机型上使用此工具，否则可能会出现某些未知的问题。")
        if not self.is_adb_device_connected():
            input("未发现设备，回车返回")
            return 1
        auto_name = f"extract_{time.strftime("%Y%m%d%H%M", time.localtime())}"
        name = input('请输入固件名称(可跳过)：')
        if not name:
            name = auto_name
        print("采集信息...")
        os.makedirs(f"{name}", exist_ok=True)
        os.makedirs(f"{name}/info", exist_ok=True)
        os.makedirs(f"{name}/mtd", exist_ok=True)

        def write_output(cmd: list, output_path: str):
            with open(output_path, "w", encoding="utf-8", newline='\n') as f:
                _, output = call(cmd, out=1, return_output=True)
                f.write("\n".join(output))

        write_output(['adb', 'shell', 'cat', '/proc/cpuinfo'], os.path.join(name, 'info', "cpuinfo.txt"))
        write_output(['adb', 'shell', 'cat', '/proc/mtd'], os.path.join(name, 'info', "mtd.txt"))
        write_output(['adb', 'shell', 'cat', '/proc/meminfo'], os.path.join(name, 'info', "meminfo.txt"))
        write_output(['adb', 'shell', 'cat', '/proc/version'], os.path.join(name, 'info', "version.txt"))
        write_output(['adb', 'shell', 'cat', '/proc/cmdline'], os.path.join(name, 'info', "cmdline.txt"))
        write_output(['adb', 'shell', 'df'], os.path.join(name, 'info', "df.txt"))
        write_output(['adb', 'shell', 'mount'], os.path.join(name, 'info', "mount.txt"))
        write_output(['adb', 'shell', 'ps'], os.path.join(name, 'info', "ps.txt"))
        write_output(['adb', 'shell', 'nv', 'show'], os.path.join(name, 'info', "nv.txt"))
        write_output(['adb', 'shell', 'ls', '-l', "/"], os.path.join(name, 'info', "ls.txt"))
        write_output(['adb', 'shell', 'ls', '-l', "/dev"], os.path.join(name, 'info', "dev.txt"))
        i = 0
        with open(os.path.join(name, f"{name}_full.bin"), "wb") as f:
            while True:
                if call(['adb', 'pull', f"/dev/mtd{i}", os.path.join(name, 'mtd', f"mtd{i}")]):
                    break
                with open(os.path.join(name, 'mtd', f"mtd{i}"), 'rb') as mtd_file:
                    f.write(mtd_file.read())
                i += 1
        with open(os.path.join(name, 'info.txt'), 'w', encoding='utf-8', newline='\n') as f:
            f.write(f'name={name}\n')
            f.write(f'extract_time={time.strftime("%Y%m%d%H%M", time.localtime())}\n')
            f.write(f'extract_time_utc={int(time.time())}\n')
        input("提取完成，回车返回")
        return 0

    def mtd_tools(self):
        os.system("cls") if os.name == "nt" else os.system("clear")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        print(
            f"\033[33m            1.编程器固件一键解包        2.一键重新打包固件      3.合并所有MTD分区       4.ADB提取固件     5.返回\033[0m")
        print(f"\033[36m\033[1m{self.split_mark}\033[0m")
        choice = input("\033[32m请输入并按Enter键: \033[0m")
        if choice == "1":
            file_path = input("\033[33m请输入文件地址并按Enter键: \033[0m")
            if not os.path.exists(file_path) or not os.path.isfile(file_path):
                input("\033[33m文件不存在！\033[0m")
                return 0
            mtdcut(file_path)
            mtdunpk()
            with open("MTDs/name.txt", 'r', encoding='utf-8') as f:
                name = f.read()
            move("MTDs", "z." + name.replace(" ", "."))
        elif choice == "2":
            project_name = input("输入项目名称:")
            if not project_name:
                return 1
            mtdrepk(project_name)
            mtdjoin(project_name)
        elif choice == "3":
            project_name = input("输入项目名称:")
            if not project_name:
                return 1
            mtdjoin(project_name)
        elif choice == "4":
            self.mtd_extract_mtds()
        elif choice == "5":
            return 1
        input("回车继续")
        return None

    def at_cmd(self):
        os.system("cls") if os.name == "nt" else os.system("clear")
        print("\n\033[35m输入\033[0m\033[34m[quit]\033[0m\033[35m即可退出\033[0m\n")
        while True:
            cmd = input("\033[32mAT>\033]0m\033[37m")
            if not cmd:
                continue
            if cmd == "quit":
                return 0
            print("\033[0m\033[33m")
            ateer(cmd, show_send=True, show_response=True)
            print("\033[0m")

    def ufi_center(self):
        while True:
            os.system("cls") if os.name == "nt" else os.system("clear")
            print(f"\033[36m\033[1m{self.split_mark}\033[0m")
            print(
                f"\033[33m  1.ELSE-设备优化    2.REMO-设备优化     3.SZXF-设备优化     4.SZXK-设备优化    5.AI优化   6.随机IMEI生成  7.返回\033[0m")
            print(f"\033[36m\033[1m{self.split_mark}\033[0m")
            choice = input("\033[32m请输入并按Enter键: \033[0m")
            if choice == '1':
                app_else_opt_start()
            elif choice == '2':
                app_remo_opt()
            elif choice == '3':
                app_szxf_opt_start()
            elif choice == '4':
                app_szxk_opt_start()
            elif choice == '5':
                app_zxw_safe_start()
            elif choice == '6':
                print(f"\033[33m生成IMEI：\033[0m\033[32m{generate_imei()}\033[0m")
            elif choice == '7':
                return 1
            input("回车继续")

    def flash_mtd4(self):
        if not self.is_adb_device_connected():
            input("未发现设备，请稍后再试！\n回车继续")
            return 1
        rom_to_flash = input("你要刷入哪一个固件:\n1.mtd4_v1_modi.bin 2.mtd4_xy_mf782_modi.bin 3.自定义")
        if rom_to_flash == '1':
            rom_path = os.path.join(self.local_dir, 'file', 'flash_mtd4', 'mtd4_v1_modi.bin')
        elif rom_to_flash == '2':
            rom_path = os.path.join(self.local_dir, 'file', 'flash_mtd4', 'mtd4_xy_mf782_modi.bin')
        elif os.path.exists(rom_to_flash):
            rom_path = rom_to_flash
        else:
            input("找不到该固件，回车返回")
            return 1
        call(['adb', 'shell', 'fota_release_space.sh'])
        call(['adb', 'shell', "echo 3 > /proc/sys/vm/drop_caches"])
        call(['adb', 'shell', "mount -t tmpfs rw,remount /tmp"])
        call(['adb', 'push', os.path.join(self.local_dir, 'file', 'busybox'), '/tmp/'])
        call(['adb', 'shell',"ln" , "-s", '/tmp/busybox', '/tmp/dd'])
        call(['adb', 'shell',"ln" , "-s", '/tmp/busybox', '/tmp/sh'])
        call(['adb', 'shell',"ln" , "-s", '/tmp/busybox', '/tmp/reboot'])
        call(['adb', "shell", 'chmox', '+x', '/tmp/sh'])
        call(['adb', "shell", 'chmox', '+x', '/tmp/dd'])
        call(['adb', "shell", 'chmox', '+x', '/tmp/reboot'])
        call(['adb', 'shell',"/tmp/dd if=/dev/mtdblock4 of=/tmp/mtd4_bak.bin"])
        call(['adb', 'pull',"/tmp/mtd4_bak.bin", f"{time.strftime('%Y%m%d%H%M')}_mtd4_bak.bin"])
        call(['adb', "shell", 'rm', '/tmp/mtd4_bak.bin'])
        call(['adb', "shell", 'killall', '-9', 'zte_ufi'])
        call(['adb', "shell", 'killall', '-9', 'goahead'])
        call(['adb', "shell", 'mkdir', '-p', '/mnt/userdata/temp'])
        call(['adb', "push", os.path.join(self.local_dir, 'file', 'flash_mtd4', 'do.sh'), '/mnt/userdata/temp/do.sh'])
        call(['adb', "shell","chmod","+x", '/mnt/userdata/temp/do.sh'])
        call(["adb", "pull", rom_path, "/mnt/userdata/temp/mtd4_to_flash.bin"])
        call(['adb', "shell", '/mnt/userdata/temp/do.sh'])
        print("刷入完成，正在重启...")
        call(['adb', "shell", '/tmp/reboot'])
        input("刷入完成，感谢使用。回车继续。")


    def print_menu(self):
        while True:
            os.system("cls") if os.name == "nt" else os.system("clear")
            self.check_adb_status()
            self.check_serial()
            print()
            print(
                "\033[33m            01.设备信息           02.设置设备adb       03.驱动安装       04.ADB终端      05.设备管理器    \033[0m")
            print(
                "\033[36m\033[1m          =------ 操作设备文件-------------------------------------------------------------------------=\033[0m")
            print(
                "\033[36m\033[1m          =                                                                                            =\033[0m")
            print(
                "\033[36m\033[1m          =\033[0m\033[33m    A.提取MTD4分区    B.刷入MTD4               C.快速MTD刷写工具      D.查看机器mtd类型     \033[0m\033[36m\033[1m=\033[0m")
            print(
                "\033[36m\033[1m          =                                                                                            =\033[0m")
            print(
                "\033[36m\033[1m          =\033[0m\033[33m    E.写入WEB         F.中兴微通杀完美去控     G.固件提取与解打包     H.切卡密码计算        \033[0m\033[36m\033[1m=\033[0m")
            print(
                "\033[36m\033[1m          =                                                                                            =\033[0m")
            print(
                "\033[36m\033[1m          =\033[0m\033[33m    I.AT命令行        J.UFI优化中心                                                         \033[0m\033[36m\033[1m=\033[0m")
            print(
                "\033[36m\033[1m          =--------------------------------------------------------------------------------------------=\033[0m")
            print("\033[36m     工具与导航栏:\033[0m")
            print(
                "\033[33m         1.串口工具         2.云小帆助手      3.1869工具      4.西瓜味asr工具(最终)   5.Orz0000工具(鸡蛋姐)\033[0m")
            print(
                "\033[33m         6.zxic设置WIFI     7.流量失踪器      \033[4;35m8.紫光专区入口\033[0m  \033[31m9.退出工具\033[0m")
            print()
            choice = input("\033[32m请输入并按Enter键: \033[0m")
            choices = {
                "A": self.zmtd_extract,
                "B": self.flash_mtd4,
                "C": self.zmtd_brusquel,
                "D": self.mtd_check,
                "E": self.xr_web,
                "F": self.ufi_nv_set,
                "H": self.calc_switch_card_pwd,
                "I": self.at_cmd,
                "J": self.ufi_center,
                "01": self.machine_material,
                "02": self.set_adb,
                "03": self.install_drive,
                "8": self.uisoc,
                "6": self.set_wifi,
            }
            choice = choice.upper()
            if choice in choices:
                choices[choice]()
            elif choice == "G":
                while True:
                    if self.mtd_tools() == 1:
                        break
            elif choice == "04":
                print("            \033[33m输入\033[31mE\033[0m\033[33m即可退出\033[0m")
                print("          检测连接的设备――adb devices                 设备终端――adb shell")
                print(
                    "     设备重启――adb reboot   拉取文件――adb pull 设备路径 电脑路径   上传文件――adb push 电脑路径 设备路径")
                call(["cmd", "/c", "start", "cmd", "/k", f"cd {ebinner}"], extra_path=False)
            elif choice == "05":
                if os.name == "nt":
                    call(["cmd", "/c", 'devmgmt.msc'], extra_path=False)
                else:
                    input("This operation only able on Windows.")
            elif choice == "1":
                call(["explorer.exe", "https://atmaster.netlify.app/#/"], extra_path=False)
            elif choice == "2":
                call(["file/tool/YXF_TOOL.exe"], extra_path=False)
            elif choice == "3":
                call(["file/tool/ZTE_PATCH_1.1.exe"], extra_path=False)
            elif choice == "4":
                call(["file/tool/Watermelon-ASR_Tools.exe"], extra_path=False)
            elif choice == "5":
                call(["file/tool/UFITOOL_MTD4.exe"], extra_path=False)
            elif choice == "7":
                call(["explorer", "https://net.arsn.cn/"], extra_path=False)
            elif choice == "EXIT" or choice == '9':
                print("\033[31m退出工具箱\033[0m")
                break
            else:
                print("\033[31m无效的选项，请重试。\033[0m")
            input("回车以继续")


if __name__ == '__main__':
    app = Main()
    app.print_menu()
