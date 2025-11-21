#!/usr/bin/env python3
# pylint: disable=line-too-long
# Copyright (C) 2022-2025 The CWHelper-SOURCE Project
#
# Licensed under the GNU AFFERO GENERAL PUBLIC LICENSE, Version 3.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.gnu.org/licenses/agpl-3.0.en.html#license-text
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import serial
import serial.tools.list_ports


def find_at_ports():
    return [port.device for port in serial.tools.list_ports.comports() if 'at' in f'{port.device} {port.description}'.lower()]


def ateer(at_command, port_name=None, show_send: bool = False, show_response: bool = False, timeout: int = 2):
    port_name = port_name or find_at_ports()[0]
    if not port_name:
        print("未找到包含 'AT' 的串口设备")
        return 2
    try:
        with serial.Serial(port=port_name, baudrate=9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_ONE, parity=serial.PARITY_NONE,
                           timeout=timeout) as ser:
            ser.write((at_command + '\r\n').encode())
            response = ser.read(1024).decode(errors='ignore')
            if show_response:
                if show_send:
                    print(f'发送:{at_command}')
                print('返回:', response.strip())
    except Exception as e:
        print(f'串口通信失败：{e}')
        return 3
    return 0
