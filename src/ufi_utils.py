import os
if os.name == 'nt':
    import wmi


    def devcon(str_list: list):
        c = wmi.WMI()
        devices = c.Win32_PnPEntity()
        for device in devices:
            device_str = device.name + devices.deviceid
            for i in str_list:
                if i in device_str:
                    return True
        return False
elif os.name == 'posix':
    def devcon(str_list: list):
        print(f"Are you sure {str_list} is your device?")
        return input('Y/N: ').lower() == 'y'
