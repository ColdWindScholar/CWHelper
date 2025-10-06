import serial
import serial.tools.list_ports


def find_at_port():
    for port in serial.tools.list_ports.comports():
        desc = f'{port.device} {port.description}'.lower()
        if 'at' in desc:
            return port.device
        return None
    return None


def ateer(at_command, show_send: bool = False, show_response: bool = False, timeout: int = 2):
    port_name = find_at_port()
    if not port_name:
        print()
        print('error')
        print('未找到包含 \'AT\' 的串口设备')
        return 2
    try:
        with serial.Serial(port=port_name, baudrate=9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_ONE, parity=serial.PARITY_NONE,
                           timeout=timeout) as ser:
            ser.write((at_command + '\r\n').encode())
            response = ser.read(1024).decode(errors='ignore')
            if show_response:
                if show_send:
                    print(f'➡️ 发送指令：{at_command}')
                print('返回：', response.strip())
    except Exception as e:
        print(f'串口通信失败：{e}')
        return 3
    return 0
