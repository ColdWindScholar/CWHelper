import requests
url_1 = "http://boss.momi-iot.com/bms-base/api/main/v1/getCurrentFlowInfo"
url_2 = "http://boss.momi-iot.com/bms-base/api/main/v1/getDeviceStatus"
url_3 = "http://boss.momi-iot.com/bms-base/api/main/v1/findDeviceSetup"
url_4 = "http://boss.momi-iot.com/bms-base/api/main/v1/getDeviceActualTimeStatus"

def get_status(sn):
    response = requests.get(f"{url_2}?sn={sn}")
    json_data = response.json()
    if not json_data["success"] or not json_data["data"]:
        print("状态查询失败")
        return 1
    print("----------------------------------")
    print(f"SN号: {sn} 状态: {json_data['data']['statusText']}")
    print("----------------------------------")
    status = json_data['data']['status']
    if status == 0:
        return 0
    elif status == 7:
        print("该SN未实名-禁用，不查询")
    elif status == 4:
        print("该SN服务到期，不查询")
    elif status == 1:
        print("该SN未激活，不查询")
    else:
        print("SN状态查询失败")
    return 1
def get_flow(sn):
    response = requests.get(f"{url_1}?sn={sn}")
    json_data = response.json()
    if not json_data["success"] or not json_data["data"]:
        print("流量查询失败")
        return 1
    total_flow_val = json_data['data']['supplierFlow']['flow_val']
    if total_flow_val > 0 :
        print("总流量：", json_data['data']['supplierFlow']['flow_val'], json_data['data']['supplierFlow']['flow_unit'])
    else:
        print(f"SN号: {sn} 没有供应商流量")
    used_flow_val = json_data['data']['comboUsedFlow']['flow_val']
    if used_flow_val > 0:
        print("已用: ", used_flow_val, json_data['data']['comboUsedFlow']['flow_unit'])
    else:
        print(f"SN号: {sn} 没有已用流量")
    print("----------------------------------")
    return None


def get_vendor(sn):
    response = requests.get(f"{url_3}?sn={sn}")
    json_data = response.json()
    if not json_data["success"] or not json_data["data"]:
        print("运营商查询失败")
        return 1
    vendors = {0:"自动", 1:"移动", 2:"联通", 3:"电信"}
    print("网络选择:", vendors.get(json_data['data']['connectIsp'], "未知"))
    print("办卡时间:", json_data['data']['createDate'])
    print("更新时间:", json_data['data']['updateDate'])
    print("----------------------------------")
    return None


def get_wifi_info(sn):
    response = requests.get(f"{url_4}?sn={sn}")
    json_data = response.json()
    if not json_data["success"] or not json_data["data"]:
        print("WIFI查询失败")
        return 1
    print(f"WiFi 名称: {json_data['data']['wifiName']}\nWiFi 密码: {json_data['data']['wifiPwd']}")
    print("----------------------------------")
    return None


def get_all(sn):
    if get_status(sn):
        return 1
    if get_flow(sn):
        return 1
    if get_vendor(sn):
        return 1
    if get_vendor(sn):
        return 1
    if get_wifi_info(sn):
        return 1
    return None


def main():
    print("\033[32m本软件可通过API进行查询聚火公司产品SN,但API是具有时效性的,若被修复则该工具无法正常使用。\033[0m")
    print("\033[32m我们倡导正确充值使用设备与健康查询,请勿一次性过量查询,否则您的IP可能会遭到封禁。\033[0m")
    print("\033[32m请注意！批量查询必须从小到大,例如100→200。如果200→100的话会导致软件崩溃。\033[0m")
    sn = input("\033[32m输入您的sn号:\033[0m")
    get_all(sn)

if __name__ == "__main__":
    main()