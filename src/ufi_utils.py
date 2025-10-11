import os
if os.name == 'nt':
    import wmi

def devcon(str_list:list):
    c = wmi.WMI()
    devices = c.Win32_PnPEntity()
    for device in devices:
        device_str = device.name + devices.deviceid
        for i in str_list:
            if i in device_str:
                return True
    return False