# Decompiled with PyLingual (https://pylingual.io)
# Internal filename: XTOOL_MTD.py
# Bytecode version: 3.11a7e (3495)
# Source timestamp: 1970-01-01 00:00:00 UTC (0)

import os
import base64
import subprocess
import time
import sys
import requests
import serial
import threading
from serial.tools import list_ports
from PyQt5.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QGridLayout, QPushButton, QTextEdit, QMessageBox, QInputDialog, QComboBox, QSizePolicy, QLabel, QLineEdit, QDialog, QFileDialog, QDialogButtonBox
from PyQt5.QtGui import QIcon, QFont, QTextCursor, QTextBlockFormat
from PyQt5.QtCore import Qt, QProcess, QThread, pyqtSignal, QTimer

class AdbCommandThread(QThread):
    output_signal = pyqtSignal(str)

    def __init__(self, adb_path, commands, parent=None):
        super().__init__(parent)
        self.adb_path = adb_path
        self.commands = commands

    def run(self):
        for command in self.commands:
            command_with_adb = f'\"{self.adb_path}\" {command}'
            try:
                process = subprocess.Popen(command_with_adb, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, creationflags=subprocess.CREATE_NO_WINDOW)
                stdout, stderr = process.communicate()
                result = f'Executed adb command: {command}\n'
                if stdout:
                    result +=  f'Output:\n{stdout.strip()}\n'
                if stderr:
                    result += f'Error:\n{stderr.strip()}\n'
                result +=  f'Return code: {process.returncode}\n'
            except Exception as e:
                result = f'Exception occurred while executing command: {command}\nException: {str(e)}'
            self.output_signal.emit(result)

class ADBTool(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('UFI_TOOL by Orz0000')
        self.script_directory = getattr(sys, '_MEIPASS', os.path.abspath(os.path.dirname(__file__)))
        self.set_window_icon()
        self.init_ui()

    def set_window_icon(self):
        icon_path = os.path.join(self.script_directory, 'u.ico')
        if os.path.exists(icon_path):
            self.setWindowIcon(QIcon(icon_path))
        else:  # inserted
            print('Icon file not found:', icon_path)

    def init_ui(self):
        main_widget = QWidget()
        layout = QVBoxLayout()
        self.feedback_text = QTextEdit()
        layout.addWidget(self.feedback_text)
        button_layout = QHBoxLayout()
        device_layout = QHBoxLayout()
        self.device_status_label = QLabel()
        self.update_device_status()
        self.device_status_label.setAlignment(Qt.AlignLeft)
        device_layout.addWidget(self.device_status_label)
        layout.addLayout(device_layout)
        button_names = ['开启ADB', '检测ADB', '通用优化', '18优化', '18改川', 'web后台', '备份mtd分区', '备份系统文件', '重启设备', 'AT工具', 'ADB shell']
        button_commands = [self.show_input_dialog, self.refresh_device_status, self.execute_stop_commands, self.execute_tasks, self.send_imei, self.execute_web_command, self.execute_mtd_commands, self.pull_directories, self.execute_reboot_operations, self.open_at_tool, self.open_ad_tool]
        for button_text, command_func in zip(button_names, button_commands):
            button = QPushButton(button_text)
            button.clicked.connect(command_func)
            button_layout.addWidget(button)
        layout.addLayout(button_layout)
        main_widget.setLayout(layout)
        self.setCentralWidget(main_widget)

    def execute_adb_commands(self, commands):
        adb_path = os.path.join(self.script_directory, 'adb.exe')
        self.thread = AdbCommandThread(adb_path, commands)
        self.thread.output_signal.connect(self.handle_output)
        self.thread.start()

    def handle_output(self, output):
        self.feedback_text.append(output)

    def execute_weby_command(self):
        commands = ['shell mount -o remount,rw /', f"push \"{os.path.join(self.script_directory, 'a.js')}\" /etc_ro/web/js/"]
        self.execute_adb_commands(commands)
        self.thread.output_signal.connect(self.verify_js_push)

    def verify_js_push(self, output):
        if 'Return code: 0' in output:
            self.pull_and_modify_index_html()
        else:  # inserted
            self.feedback_text.append('Failed to push a.js. Web directory write access check failed.')

    def pull_and_modify_index_html(self):
        local_index_path = os.path.join(self.script_directory, 'index.html')
        remote_index_path = '/etc_ro/web/index.html'
        pull_command = f'pull {remote_index_path} \"{local_index_path}\"'
        self.execute_adb_commands([pull_command])
        self.thread.output_signal.connect(lambda output: self.modify_and_push_index_html(output, local_index_path, remote_index_path))

    def modify_and_push_index_html(self, output, local_index_path, remote_index_path):
        if 'Return code: 0' in output:
            self.feedback_text.append('Pulled index.html successfully.')
            with open(local_index_path, 'r', encoding='utf-8') as file:
                content = file.read()
            index = content.rfind('</body>')
            if index!= (-1):
                modified_content = content[:index] + '<script src=\"js/a.js\"></script>' + content[index:]
                with open(local_index_path, 'w', encoding='utf-8') as file:
                    file.write(modified_content)
                push_command = f'push \"{local_index_path}\" {remote_index_path}'
                self.execute_adb_commands([push_command])
                self.thread.output_signal.connect(lambda output: self.verify_index_push(output))
        else:  # inserted
            self.feedback_text.append('Failed to pull index.html.')

    def verify_index_push(self, output):
        if 'Return code: 0' in output:
            self.feedback_text.append('执行完毕，请在后台查看。')
        else:  # inserted
            self.feedback_text.append('错误')

    def refresh_device_status(self):
        self.update_device_status()

    def update_device_status(self):
        devices = self.scan_adb_devices()
        if devices:
            self.device_status_label.setText('● ADB设备已连接')
            self.device_status_label.setStyleSheet('color: green;')
        else:  # inserted
            self.device_status_label.setText('● ADB设备未连接')
            self.device_status_label.setStyleSheet('color: red;')

    def scan_adb_devices(self):
        commands = ['shell', 'mount', '-o', 'remount,rw', '/']
        result = self.execute_adb_command(commands)
        stdout = result.get('stdout', '')
        stderr = result.get('stderr', '')
        devices = []
        if stderr:
            self.feedback_text.append(f'Error scanning devices: {stderr}\n')
        else:  # inserted
            commands = ['devices']
            result = self.execute_adb_command(commands)
            stdout = result.get('stdout', '')
            stderr = result.get('stderr', '')
            if stderr:
                self.feedback_text.append(f'Error scanning devices: {stderr}\n')
            else:  # inserted
                for line in stdout.splitlines():
                    if '\tdevice' in line:
                        devices.append(line.split('\t')[0])
        return devices

    def execute_adb_command(self, commands):
        adb_path = os.path.join(self.script_directory, 'adb.exe')
        command_with_adb = f"\"{adb_path}\" {' '.join(commands)}"
        try:
            process = subprocess.Popen(command_with_adb, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, creationflags=subprocess.CREATE_NO_WINDOW)
            stdout, stderr = process.communicate()
            result = {'stdout': stdout.strip(), 'stderr': stderr.strip(), 'returncode': process.returncode}
        except Exception as e:
            result = {'stdout': '', 'stderr': f'Exception occurred: {str(e)}', 'returncode': (-1)}
        return result

    def show_input_dialog(self):
        address, ok = QInputDialog.getText(self, '输入', '请输入后台地址:')
        if ok and address:
            self.start_crawler(address.strip())
        else:  # inserted
            if ok:
                QMessageBox.warning(self, '警告', '请输入有效的后台地址！')

    def start_crawler(self, address):
        urls = [f'http://{address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=2/', f'http://{address}/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=1/', f'http://{address}/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1']
        timeout_seconds = 1
        for url in urls:
            try:
                response = requests.get(url, timeout=timeout_seconds)
                if response.status_code == 200:
                    self.feedback_text.append(f'使用地址：\n{url}\n响应：\n{response.text}\n')
                else:  # inserted
                    self.feedback_text.append(f'使用地址：\n{url}\n请求失败，状态码：{response.status_code}\n')
            except requests.Timeout:
                self.feedback_text.append(f'请求超时，使用地址：\n{url}\n')
            except requests.RequestException as e:
                self.feedback_text.append(f'请求过程中出现错误：\n{e}\n使用地址：\n{url}\n')

    def execute_stop_commands(self):
        commands = ['shell mount -o remount,rw /', 'shell nv set mqtt_host=127.0.0.1', 'shell nv set fota_updateMode=0', 'shell nv set os_url=http://127.0.0.1', 'shell nv set lpa_trigger_host=127.0.0.1', 'shell nv set safecare_hostname=http://127.0.0.1', 'shell nv set safecare_mobsite=http://127.0.0.1', 'shell nv set band_select_enable=1', 'shell nv set dns_manual_func_enable=1', 'shell nv set tr069_func_enable=1', 'shell nv set ussd_enable=1', 'shell nv set terminal_mgmt_enable=0', 'shell nv set nofast_port=', 'shell nv set HOST_FIELD=\'Host: 127.0.0.1\'', 'shell nv set TM_SERVER_NAME=127.0.0.1', 'shell nv set remo_switch_mode=0', 'shell rm /bin/terminal_mgmt', 'shell rm /bin/iccid_check', 'shell rm /sbin/ip_ratelimit.sh', 'shell rm /sbin/tc_tbf.sh', 'shell rm /mnt/userdata/etc_rw/nv/main/ro', 'shell rm /mnt/userdata/etc_rw/nv/backup/ro']
        self.execute_adb_commands(commands)

    def send_requests(self, url_base, password):
        password_encoded = base64.b64encode(password.encode()).decode()
        zero_url = f'http://{url_base}/reqproc/proc_post?isTest=false&goformId=LOGIN&password={password_encoded}'
        first_url = f'http://{url_base}/remo/config/setting.db'
        second_url = f'http://{url_base}/reqproc/proc_post?goformId=REMO_SIM_SELECT_R1865&isTest=false&sim_option_id=1&select_sim_mode=1'
        third_url = f'http://{url_base}/reqproc/proc_post?goformId=REBOOT_DEVICE'
        first_payload = b'POST /remo/config/setting.db HTTP/1.1\r\nContent-Type: multipart/form-data; boundary="0ae2d29c-38de-46fc-b7cc-006047bbf031"\r\nHost: {url_base}\r\nContent-Length: 1446\r\nExpect: 100-continue\r\n\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031\r\nContent-Disposition: form-data; name="setting.db"; filename="setting.db"\r\nContent-Type: application/octet-stream\r\n\r\n#####config file######\r\nremo_web_sw_version=For_18XY\r\ncr_version=FOR_18XY\r\nfota_request_host=127.0.0.1\r\nfota_request_port=10721\r\nfota_token_rs=\r\nfota_product_id=\r\nfota_token_zx=\r\nfota_token_gs=\r\nfota_product_secret=\r\nremo_fota_request_port=10721\r\nremo_fota_request_host=127.0.0.1\r\nremo_dm_request_host=127.0.0.1\r\nremo_dm_request_port=10721\r\nremo_dm_request_path=/zte/report?\r\nremo_web_at_debug_switch=1\r\nremo_dm_report_time=60\r\nsafecare_hostname=\r\nfota_updateMode=\r\nsafecare_mobsite=\r\nfota_updateIntervalDay=\r\ntc_enable=0\r\ntc_downlink=0\r\ntc_uplink=0\r\nremo_uicc_sim_slot_info_init=3\r\nremo_uicc_auto_switch_mode=3\r\nremo_uicc_switch_mode=1\r\nremo_sim_select_display_type=1\r\njuhuoapp_enable=0\r\nremo_iot_http_get_config_host=127.0.0.1\r\nremo_iot_http_get_config_host_b1=127.0.0.1\r\nremo_iot_http_get_config_host_b2=127.0.0.1\r\nremo_iot_http_get_config_host_b3=127.0.0.1\r\nremo_iot_http_get_config_host_b4=127.0.0.1\r\nremo_iot_http_get_config_port=10721\r\nremo_iot_http_led_control_host=127.0.0.1\r\nremo_iot_http_led_control_port=10721\r\nremo_iot_http_flow_report_host=127.0.0.1\r\nremo_iot_http_flow_report_port=10721\r\nremo_iot_http_info_report_host=127.0.0.1\r\nremo_iot_http_info_report_port=10721\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031--\r\n'
        try:
            requests.get(zero_url, timeout=1)
        except requests.RequestException:
            pass
        try:
            requests.post(first_url, data=first_payload, timeout=1)
        except requests.RequestException:
            pass
        try:
            requests.get(second_url, timeout=1)
        except requests.RequestException:
            pass
        try:
            requests.get(third_url, timeout=1)
        except requests.RequestException:
            return None

    def execute_tasks(self):
        url_base, ok = QInputDialog.getText(self, '输入', '请输入后台地址:')
        if not ok or not url_base:
            return None
        password, ok = QInputDialog.getText(self, '输入', '请输入密码:')
        if ok and password:
            self.send_requests(url_base, password)
            QMessageBox.information(self, '完成', '执行完毕，请自行测试。')

    def send_imei(self):
        url_base, ok = QInputDialog.getText(self, '输入', '输入后台地址:')
        if not ok or not url_base:
            return None
        password, ok = QInputDialog.getText(self, '输入', '请输入密码:')
        if not ok or not password:
            return None
        password_encoded = base64.b64encode(password.encode()).decode()
        imei, ok = QInputDialog.getText(self, '输入', '输入川号:')
        if not ok or not imei:
            return None
        login_url = f'http://{url_base}/reqproc/proc_post?isTest=false&goformId=LOGIN&password={password_encoded}'
        send_imei_url = f'http://{url_base}/reqproc/proc_post?goformId=ID_SENDAT&at_str_data=AT+MODIMEI={imei}'
        reboot_url = f'http://{url_base}/reqproc/proc_post?goformId=REBOOT_DEVICE'
        try:
            login_response = requests.get(login_url, timeout=1)
            if login_response.status_code == 200:
                self.feedback_text.append(f'登录成功: {login_url}\n响应: {login_response.text}\n')
                imei_response = requests.get(send_imei_url, timeout=1)
                if imei_response.status_code == 200:
                    self.feedback_text.append(f'发送IMEI成功: {send_imei_url}\n响应: {imei_response.text}\n')
                else:  # inserted
                    self.feedback_text.append(f'发送IMEI失败, 状态码: {imei_response.status_code}\n响应: {imei_response.text}\n')
                reboot_response = requests.get(reboot_url, timeout=1)
            else:  # inserted
                self.feedback_text.append(f'登录失败, 状态码: {login_response.status_code}\n响应: {login_response.text}\n')
        except requests.RequestException as e:
            pass
        QMessageBox.information(self, '完成', '执行完毕，重启后请在后台查看。')

    def execute_web_command(self):
        QMessageBox.information(self, '提示', '一键全功能需要是原后台。')
        msg_box = QMessageBox()
        msg_box.setWindowTitle('选择')
        msg_box.setText('选择需要的操作：')
        msg_box.setIcon(QMessageBox.Question)
        msg_box.setWindowIcon(QIcon(os.path.join(self.script_directory, 'u.ico')))
        button_a = msg_box.addButton('一键全功能', QMessageBox.ActionRole)
        button_b = msg_box.addButton('备份/刷入', QMessageBox.ActionRole)
        cancel_button = msg_box.addButton(QMessageBox.Cancel)
        ret = msg_box.exec_()
        if msg_box.clickedButton() == button_a:
            self.execute_weby_command()
            return
        if msg_box.clickedButton() == button_b:
            dialog = CommandDialog(self)
            if dialog.exec_():
                directory_path = dialog.directory_path
                operation = dialog.operation
                source_folder = '/etc_ro/web'
                sourcefolder = '/etc_ro/web.zip'
                source_folder_ = '/etc_ro/'
                if operation == 'Backup':
                    commands = ['shell mount -o remount,rw /', f'pull {source_folder} {directory_path}', f'pull {sourcefolder} {directory_path}']
                    self.execute_adb_commands(commands)
                else:  # inserted
                    if operation == 'Loading':
                        commands = ['shell mount -o remount,rw /', f'shell rm -rf {source_folder}', f'push {directory_path} {source_folder_}']
                        self.execute_adb_commands(commands)
            else:  # inserted
                self.feedback_text.append('用户取消了操作\n')
        else:  # inserted
            self.feedback_text.append('用户取消了操作\n')

    def execute_mtd_commands(self):
        directory_path = QFileDialog.getExistingDirectory(self, '选择存储文件的文件夹')
        if not directory_path:
            self.feedback_text.append('用户取消了操作。\n')
            return
        self.directory_path = directory_path
        commands = ['shell cat /proc/mtd']
        self.execute_adb_commands(commands)
        self.thread.output_signal.connect(self.process_mtd_output)

    def process_mtd_output(self, output):
        if 'Error' in output:
            self.feedback_text.append(f'读取 /proc/mtd 失败: {output}\n')
            return
        mtd_partitions = [line.split(':')[0].strip() for line in output.splitlines() if line.startswith('mtd')]
        if not mtd_partitions:
            self.feedback_text.append('未找到 mtd 分区。\n')
            return
        self.execute_adb_commands(['shell mount -o remount,rw /'])
        self.thread.output_signal.connect(lambda _: self.pull_mtd_partitions(mtd_partitions))

    def pull_mtd_partitions(self, mtd_partitions):
        commands = [f'pull /dev/{mtd} {self.directory_path}' for mtd in mtd_partitions]
        self.execute_adb_commands(commands)

    def pull_directories(self):
        directory_path = QFileDialog.getExistingDirectory(self, '选择存储文件的文件夹')
        if not directory_path:
            self.feedback_text.append('用户取消了操作。\n')
            return
        directories_to_pull = ['bin', 'etc', 'etc_ro', 'lib', 'mnt', 'sbin', 'usr']
        commands = ['shell mount -o remount,rw /']
        commands = commands + [f'pull /{directory} {directory_path}' for directory in directories_to_pull]
        self.execute_adb_commands(commands)

    def execute_reboot_operations(self):
        commands = ['shell reboot']
        self.execute_adb_commands(commands)

    def open_at_tool(self):
        self.at_tool_window = ATToolWindow(self.script_directory)
        self.at_tool_window.show()

    def open_ad_tool(self):
        QMessageBox.information(self, '注意事项', '刷分区请自备编程器。\n\n每次进入shell执行器只可执行一次刷写。\n第二次刷写不生效甚至死机。\n\n每次开机建议刷写一次，重刷建议重启后再去操作。')
        self.ad_tool_window = ADToolWindow(self.script_directory)
        self.ad_tool_window.show()

class ADToolWindow(QWidget):
    append_text_signal = pyqtSignal(str)

    def __init__(self, script_directory):
        super().__init__()
        self.setWindowTitle('shell执行器')
        self.script_directory = script_directory
        self.set_window_icon()
        self.adb_process = None
        self.mtd_file_path = None
        self.init_ui()
        self.resize(800, 500)

    def set_window_icon(self):
        icon_path = os.path.join(self.script_directory, 'u.ico')
        if os.path.exists(icon_path):
            self.setWindowIcon(QIcon(icon_path))
        else:
            print('Icon file not found:', icon_path)

    def init_ui(self):
        layout = QVBoxLayout()
        self.output_text = QTextEdit(self)
        self.output_text.setReadOnly(True)
        font = QFont('Courier', 10)
        self.output_text.setFont(font)
        self.output_text.setStyleSheet('background-color: rgb(131, 203, 172);')
        self.set_line_spacing(self.output_text, 1.5)
        layout.addWidget(self.output_text)
        device_layout = QHBoxLayout()
        self.device_status_label = QLabel()
        self.update_device_status()
        self.device_status_label.setAlignment(Qt.AlignLeft)
        device_layout.addWidget(self.device_status_label)
        layout.addLayout(device_layout)
        entry_layout = QHBoxLayout()
        entry_label = QLabel('ADB命令输入框:')
        entry_layout.addWidget(entry_label)
        self.entry = QLineEdit()
        self.entry.returnPressed.connect(self.send_adb_command)
        entry_layout.addWidget(self.entry)
        send_button = QPushButton('发送命令')
        send_button.clicked.connect(self.send_adb_command)
        entry_layout.addWidget(send_button)
        layout.addLayout(entry_layout)
        button_layout = QHBoxLayout()
        remount_button = QPushButton('挂载读写')
        remount_button.clicked.connect(self.remount_rw)
        button_layout.addWidget(remount_button)
        new_button = QPushButton('刷写MTD4')
        new_button.clicked.connect(self.upload_and_execute)
        button_layout.addWidget(new_button)
        layout.addLayout(button_layout)
        self.setLayout(layout)
        self.start_adb_shell()
        self.append_text_signal.connect(self.append_output_text)

    def scan_adb_devices(self):
        try:
            result = subprocess.run(['adb', 'devices'], capture_output=True, text=True, check=True, creationflags=subprocess.CREATE_NO_WINDOW)
            devices = []
            for line in result.stdout.splitlines():
                if '\tdevice' in line:
                    devices.append(line.split('\t')[0])
            return devices
        except subprocess.CalledProcessError as e:
            self.append_text_signal.emit(f'Error scanning adb devices: {str(e)}')
            return []

    def set_line_spacing(self, text_edit, line_spacing):
        cursor = QTextCursor(text_edit.document())
        block_format = QTextBlockFormat()
        block_format.setLineHeight(line_spacing + 100, QTextBlockFormat.ProportionalHeight)
        cursor.select(QTextCursor.Document)
        cursor.mergeBlockFormat(block_format)
        cursor.clearSelection()
        text_edit.setTextCursor(cursor)

    def update_device_status(self):
        devices = self.scan_adb_devices()
        if devices:
            self.device_status_label.setText('● ADB设备已连接')
            self.device_status_label.setStyleSheet('color: green;')
        else:  # inserted
            self.device_status_label.setText('● ADB设备未连接')
            self.device_status_label.setStyleSheet('color: red;')

    def execute_adb_command(self, command):
        try:
            process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True, creationflags=subprocess.CREATE_NO_WINDOW)
            stdout, stderr = process.communicate()
            self.append_text_signal.emit(f'Executed adb command: {command}\n')
        except Exception as e:
            self.append_text_signal.emit(f'Exception occurred: {str(e)}')

    def execute_shell_command(self, command):
        try:
            if self.adb_process:
                self.adb_process.write((command + '\n').encode())
                self.adb_process.waitForBytesWritten()
        except Exception as e:
            self.append_text_signal.emit(f'Exception occurred: {str(e)}')

    def read_process_output(self, process):
        while process.poll() is None:
            output = process.stdout.readline()
            if output:
                self.append_text_signal.emit(output.strip())

    def append_output_text(self, text):
        self.output_text.setReadOnly(False)
        self.output_text.append(text)
        self.output_text.setReadOnly(True)
        self.output_text.ensureCursorVisible()

    def upload_and_execute(self):
        mtd_file_path, _ = QFileDialog.getOpenFileName(self, '选择MTD文件', '', 'All Files (*)')
        if not mtd_file_path:
            return
        self.mtd_file_path = mtd_file_path
        self.execute_adb_command('adb shell mount -o remount,rw /')
        self.execute_adb_command(f'adb push \"{mtd_file_path}\" /tmp')
        self.execute_adb_command(f"adb push \"{os.path.join(self.script_directory, 'flashcp')}\" /tmp")
        self.execute_adb_command(f"adb push \"{os.path.join(self.script_directory, 'screen')}\" /tmp")
        QTimer.singleShot(1000, self.execute_dd_commands)

    def execute_dd_commands(self):
        mtd_file_name = os.path.basename(self.mtd_file_path)
        self.execute_shell_command('mount -o remount,rw /')
        self.execute_shell_command('cd /')
        self.execute_shell_command('./sbin/fota_release_space.sh')
        self.execute_shell_command('cd /tmp')
        self.execute_shell_command('chmod +x flashcp screen')
        self.execute_shell_command(f'./screen -dmS mtd_flash ./flashcp ./{mtd_file_name} /dev/mtd4 -v')
        QTimer.singleShot(6000, self.check_flash_process)

    def check_flash_process(self):
        try:
            process = subprocess.Popen(['adb', 'shell', 'cd /tmp && ./screen -ls'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, creationflags=subprocess.CREATE_NO_WINDOW)
            stdout, stderr = process.communicate()
            if 'No Sockets found' in stdout:
                self.execute_shell_command('reboot')
                self.append_text_signal.emit('刷写完成，请重启后查看。')
            else:
                self.append_text_signal.emit('刷写中，请稍候...')
                QTimer.singleShot(6000, self.check_flash_process)
        except Exception as e:
            self.append_text_signal.emit(f'Exception occurred while checking flash process: {str(e)}')

    def start_adb_shell(self):
        adb_path = os.path.join(self.script_directory, 'adb.exe')
        self.adb_process = QProcess(self)
        self.adb_process.setProcessChannelMode(QProcess.ProcessChannelMode.MergedChannels)
        self.adb_process.readyReadStandardOutput.connect(self.read_output)
        self.adb_process.start(adb_path, ['shell'])

    def read_output(self):
        output = self.adb_process.readAllStandardOutput().data().decode()
        self.append_output_text(output)
        self.output_text.ensureCursorVisible()

    def send_adb_command(self):
        if self.adb_process:
            command = self.entry.text().strip()
            if command:
                self.adb_process.write((command + '\n').encode())
                self.adb_process.waitForBytesWritten()
                self.entry.clear()
                self.output_text.ensureCursorVisible()
                print("oooo")

    def remount_rw(self):
        self.execute_adb_command('adb shell mount -o remount,rw /')

    def closeEvent(self, event):
        if self.adb_process:
            self.adb_process.terminate()
        event.accept()

class ATToolWindow(QWidget):
    def __init__(self, script_directory):
        super().__init__()
        self.setWindowTitle('AT工具')
        self.script_directory = script_directory
        self.set_window_icon()
        self.init_ui()

    def set_window_icon(self):
        icon_path = os.path.join(self.script_directory, 'u.ico')
        if os.path.exists(icon_path):
            self.setWindowIcon(QIcon(icon_path))
        else:  # inserted
            print('Icon file not found:', icon_path)

    def init_ui(self):
        layout = QVBoxLayout()
        self.output_text = QTextEdit(self)
        self.output_text.setReadOnly(True)
        layout.addWidget(self.output_text)
        top_layout = QHBoxLayout()
        port_label = QLabel('选择AT串口:')
        port_label.setAlignment(Qt.AlignLeft)
        top_layout.addWidget(port_label)
        self.port_combo = QComboBox()
        self.port_combo.addItems(self.scan_at_serial_ports())
        top_layout.addWidget(self.port_combo)
        layout.addLayout(top_layout)
        grid_layout = QGridLayout()
        factory_on_button = QPushButton('开启ZXIC工厂模式')
        factory_on_button.clicked.connect(lambda: self.set_factory_mode(1))
        factory_on_button.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(factory_on_button, 0, 0)
        factory_off_button = QPushButton('关闭ZXIC工厂模式')
        factory_off_button.clicked.connect(lambda: self.set_factory_mode(0))
        factory_off_button.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(factory_off_button, 0, 1)
        query_band_button = QPushButton('查询ZXIC频段')
        query_band_button.clicked.connect(lambda: self.send_at_command('AT+ZLTEAMTBAND?'))
        query_band_button.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(query_band_button, 0, 2, 1, 2)
        factory_on_button_ = QPushButton('开启A-SR工厂模式')
        factory_on_button_.clicked.connect(lambda: self.set_factory_mode_(1))
        factory_on_button_.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(factory_on_button_, 1, 0)
        factory_off_button_ = QPushButton('关闭A-SR工厂模式')
        factory_off_button_.clicked.connect(lambda: self.set_factory_mode_(0))
        factory_off_button_.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(factory_off_button_, 1, 1)
        query_band_button_ = QPushButton('查询A-SR频段')
        query_band_button_.clicked.connect(lambda: self.send_at_command('AT*BAND?'))
        query_band_button_.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        grid_layout.addWidget(query_band_button_, 1, 2, 1, 2)
        imei_label = QLabel(' ZXIC设备改川:')
        imei_label.setAlignment(Qt.AlignLeft)
        grid_layout.addWidget(imei_label, 2, 0)
        self.imei_entry = QLineEdit()
        grid_layout.addWidget(self.imei_entry, 2, 1, 1, 2)
        change_imei_button = QPushButton('执行命令')
        change_imei_button.clicked.connect(self.change_modimei)
        grid_layout.addWidget(change_imei_button, 2, 3)
        imei_label_2 = QLabel(' A-SR设备改川:')
        imei_label_2.setAlignment(Qt.AlignLeft)
        grid_layout.addWidget(imei_label_2, 3, 0)
        self.imei_entry_2 = QLineEdit()
        grid_layout.addWidget(self.imei_entry_2, 3, 1, 1, 2)
        change_imei_button_2 = QPushButton('执行命令')
        change_imei_button_2.clicked.connect(self.change_modimei_)
        grid_layout.addWidget(change_imei_button_2, 3, 3)
        imei_label_3 = QLabel(' A-SR改序列号:')
        imei_label_3.setAlignment(Qt.AlignLeft)
        grid_layout.addWidget(imei_label_3, 4, 0)
        self.imei_entry_3 = QLineEdit()
        grid_layout.addWidget(self.imei_entry_3, 4, 1, 1, 2)
        change_imei_button_3 = QPushButton('执行命令')
        change_imei_button_3.clicked.connect(self.change_modimei__)
        grid_layout.addWidget(change_imei_button_3, 4, 3)
        entry_label = QLabel(' AT命令输入框:')
        entry_label.setAlignment(Qt.AlignLeft)
        grid_layout.addWidget(entry_label, 5, 0)
        self.entry = QLineEdit()
        grid_layout.addWidget(self.entry, 5, 1, 1, 2)
        send_button = QPushButton('发送命令')
        send_button.clicked.connect(lambda: self.send_at_command(self.entry.text()))
        grid_layout.addWidget(send_button, 5, 3)
        layout.addLayout(grid_layout)
        self.setLayout(layout)

    def scan_at_serial_ports(self):
        at_port_list = [port.device for port in list_ports.comports() if 'AT' in port.description.upper()]
        return at_port_list

    def send_at_command(self, command):
        selected_port = self.port_combo.currentText()
        self.output_text.setReadOnly(False)
        self.output_text.clear()
        try:
            with serial.Serial(selected_port, baudrate=9600, timeout=1) as ser:
                if ser.isOpen():
                    ser.write(command + '\r\n'.encode())
                    response = ser.read(100).decode('utf-8', 'ignore')
                    self.output_text.append(f'发送的指令: {command}\n')
                    self.output_text.append(f'收到的响应: {response}\n')
                else:  # inserted
                    self.output_text.append(f'无法打开串口 {selected_port}\n')
        except serial.SerialException as e:
                self.output_text.append(f'串口 {selected_port} 打开失败: {e}\n')
        self.output_text.setReadOnly(True)

    def set_factory_mode(self, mode):
        command = 'AT+ZMODE=1' if mode == 1 else 'AT+ZMODE=0'
        self.send_at_command(command)
        mode_text = '开启' if mode == 1 else '关闭'
        self.output_text.append(f'{mode_text}工厂模式\n')

    def set_factory_mode_(self, mode):
        command = 'AT*PROD=1' if mode == 1 else 'AT*PROD=0'
        self.send_at_command(command)
        mode_text = '开启' if mode == 1 else '关闭'
        self.output_text.append(f'{mode_text}工厂模式\n')

    def change_modimei(self):
        imei = self.imei_entry.text().strip()
        if imei:
            self.send_at_command(f'AT+MODIMEI={imei}')
            self.output_text.append(f'已发送命令: {imei}\n')

    def change_modimei_(self):
        imei = self.imei_entry_2.text().strip()
        if imei:
            self.send_at_command(f'AT*MRD_IMEI=W,0,01JAN1970,{imei}')
            self.output_text.append(f'已发送命令: {imei}\n')

    def change_modimei__(self):
        imei = self.imei_entry_3.text().strip()
        if imei:
            self.send_at_command(f'AT*MRD_SN=,{imei}')
            self.output_text.append(f'已发送命令: {imei}\n')

class CommandDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle('选择')
        self.setFixedSize(200, 100)
        layout = QVBoxLayout()
        backup_button = QPushButton('备份web后台')
        backup_button.clicked.connect(self.backup_clicked)
        layout.addWidget(backup_button)
        loading_button = QPushButton('刷入web后台')
        loading_button.clicked.connect(self.loading_clicked)
        layout.addWidget(loading_button)
        self.setLayout(layout)
        self.directory_path = None
        self.operation = None

    def backup_clicked(self):
        self.directory_path = QFileDialog.getExistingDirectory(self, '选择备份地址')
        if self.directory_path:
            self.operation = 'Backup'
            self.accept()

    def loading_clicked(self):
        choice, ok = QInputDialog.getItem(self, '选择操作', '请选择web类型:', ['文件夹', '压缩包'], 0, False)
        if ok and choice:
            if choice == '文件夹':
                self.directory_path = QFileDialog.getExistingDirectory(self, '选择web地址')
            else:  # inserted
                options = QFileDialog.Options()
                self.directory_path, _ = QFileDialog.getOpenFileName(self, '选择web地址', '', '压缩文件 (*.zip *.tar *.gz *.tgz);;所有文件 (*)', options=options)
            if self.directory_path:
                self.operation = 'Loading'
                self.accept()
if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_window = ADBTool()
    main_window.show()
    sys.exit(app.exec_())