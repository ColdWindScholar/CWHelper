from time import sleep

from src.utilities import safesh, file_creator
from src.utils import call
import os
if os.name == 'nt':
    import wmi

def devcon():
    c = wmi.WMI()
    devices = c.Win32_PnPEntity()
    for device in devices:
        device_str = device.name + devices.deviceid
        if "VID_19D2" in device_str:
            return True
    return False

cleaner = '''
#!/bin/sh
#REMO
nv set adb_app_enable=1
nv set fota_dm_enable=
nv set fota_product_id=
nv set fota_product_secret=
nv set fota_request_host=0.1.2.3
nv set fota_request_port=38964
nv set fota_token_gs=
nv set fota_token_rs=
nv set fota_token_zx=
nv set fota_updateIntervalDay=365
nv set fota_updateMode=0
nv set huahai_enable=
nv set huahaiapp_enable=
nv set juhuo_enable=
nv set juhuoapp_enable=
nv set kpmqttagent_enable=
nv set kuyuapp_enable=
nv set last_login_time=
nv set limit_close_wifi=0
nv set RatelimitEnable=0
nv set RatelimitRules_0=
nv set RatelimitRules_1=
nv set RatelimitRules_2=
nv set RatelimitRules_3=
nv set RatelimitRules_4=
nv set RatelimitRules_5=
nv set RatelimitRules_6=
nv set RatelimitRules_7=
nv set RatelimitRules_8=
nv set RatelimitRules_9=
nv set remo_ctiot_enable=
nv set remo_dm_main_enable=0
nv set remo_dm_report_time=65535
nv set remo_dm_request_host=0.1.2.3
nv set remo_dm_request_path=/
nv set remo_dm_request_port=80
nv set remo_dm_switch=0
nv set remo_fota_request_host=0.1.2.3
nv set remo_fota_request_port=80
nv set remo_fota_se_enable=
nv set remo_fota_watchdog_enable=
nv set remo_hw_version=ufitool-compatible-device
nv set remo_interface_ratelimit=
nv set remo_interface_ratelimit_en=0
nv set remo_interface_ratelimit_ipv6=
nv set remo_iot_http_flow_report_host=0.1.2.3
nv set remo_iot_http_flow_report_port=38964
nv set remo_iot_http_get_config_host=0.1.2.3
nv set remo_iot_http_get_config_host_b1=
nv set remo_iot_http_get_config_host_b2=
nv set remo_iot_http_get_config_host_b3=
nv set remo_iot_http_get_config_host_b4=
nv set remo_iot_http_get_config_port=38964
nv set remo_iot_http_info_report_host=0.1.2.3
nv set remo_iot_http_info_report_port=38964
nv set remo_iot_http_led_control_host=0.1.2.3
nv set remo_iot_http_led_control_port=38964
nv set remo_mqtt_app_enable=
nv set remo_mqtt_dev_enable=1
nv set remo_mqtt_enable=
nv set remo_mqtt_request_host=0.1.2.3
nv set remo_mqtt_request_password=
nv set remo_mqtt_request_port=38964
nv set remo_mqtt_request_username=
nv set remo_ratelimit_level=0
nv set remo_sale_statistics_enable=
nv set remo_secdns=1.2.4.8
nv set remo_sim_admin_password=admin
nv set remo_sim_admin_username=admin
nv set remo_sim_select_display_type=1
nv set remo_super_possword_at_debug=factoryAdmin
nv set remo_support_fota_switch=1
nv set remo_support_upnp_switch=1
nv set remo_uicc_auto_switch_mode=3
nv set remo_uicc_enable=
nv set remo_uicc_reset_ctrl=0
nv set remo_uicc_sim=1
nv set remo_uicc_sim_slot_info_init=3
nv set remo_uicc_switch_mode=1
nv set remo_usblan0_status=0
nv set remo_web_at_debug_switch=1
nv set remo_web_sim_switch=1
nv set safecare_hostname=
nv set safecare_mobsite=
nv set tc_downlink=0
nv set tc_enable=0
nv set tc_local=1310720
nv set tc_uplink=0
nv set telnetd_enable=y
nv set 'remo_web_sw_version=ufitool-Legacy-2471: '$(nv get remo_sw_version)
nv save
#SZXF
nv set mqtt_host=0.1.2.3
nv set enable_lpa=0
nv set lpa_trigger_host=0.1.2.3
nv set safecare_enable=0
nv set safecare_hostname=0.1.2.3
nv set safecare_mobsite=0.1.2.3
nv set terminal_mgmt_enable=0
nv set nofast_port=
nv set HOST_FIELD='Host: NULL'
nv set TM_SERVER_NAME=0.1.2.3
nv save
#Meta
echo "#!/bin/sh" >/mnt/userdata/bin/remo_mqtt_dev
echo "#!/bin/sh" >/mnt/userdata/bin/remo_fota
chmod 755 /mnt/userdata/bin/*
rm /mnt/userdata/etc_rw/nv/main/ro
rm /mnt/userdata/etc_rw/nv/backup/ro
rm /mnt/userdata/etc_rw/remo_esim*
rm /tmp/cleaner.sh
'''
def main():
    while not devcon():
        input("未检测到任何REMO路由器，请检查是否已将路由器连接到此计算机。\n回车继续")
    else:
        print("已检测到路由器，正在评估其可用性...")
    call(['adb', 'wait-for-device'])
    _, out = call(["adb", "shell", 'nv', 'get', 'PRODUCT_TSP'], out=1, return_output=True)
    if not [i for i in out if "Mobile" in i]:
        print("错误：此优化工具需要在已启用ADB的设备上运行。")
        print("请先使用调试工具为您的设备启用ADB服务，然后再运行此工具。")
        return 1
    print("正在优化不必要的组件以提升路由器的性能与稳定性")
    file_creator("/tmp/cleaner.sh",cleaner)
    safesh("sh /tmp/cleaner.sh")
    sleep(5)
    call(["adb", "shell", "rm", "/tmp/cleaner.sh"])
    print("执行完毕。快去试试吧！")
    call(["adb", "devices"])
    return 0