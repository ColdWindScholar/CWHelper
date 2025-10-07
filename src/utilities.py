import os
from hashlib import md5
from random import randrange

from utils import call


def md5sum(string):
    return md5(string.encode('utf-8')).hexdigest()


def hex_convert(string: str, mode=None):
    if mode is None:
        mode = 0
    if mode == 0:
        return string.encode().hex()
    elif mode == 1:
        return bytes.fromhex(string).decode()


def generate_imei():
    oem = [86654906, 86087006, 86935204, 86942403, 86487605, 86683702, 86857205, 86381604, 86840803, 86549403,
           86462804]
    imei = str(oem[randrange(0, len(oem) - 1)])
    for i in range(1, 7):
        imei += str(randrange(0, 9))

    def digit_sum(num_str):
        number = int(num_str) * 2
        a = ("00" + str(number))[-1:]
        b = ("00" + str(number))[:-1][-1:]
        return int(a) + int(b)

    def get_luhn(num_str):
        sum_ = 0
        for n in range(2, 16, 2):
            sum_ += digit_sum(num_str[n - 1])
        for n in range(1, 15, 2):
            sum_ += int(num_str[n - 1])
        last_num = str(sum_)[-1:]
        return str(10 - int(last_num))[-1:]

    imei += get_luhn(imei)
    return imei


def file_exists(path):
    ret, output = call(["adb", "shell", f'ls "{path}"'], out=1, return_output=True)
    for i in output:
        if "file " in i:
            return True
    return False


def safesh(cmd: str) -> tuple[int, str]:
    return call(["adb", "shell", cmd.replace('"', '\"')], out=1, return_output=True)


def edit_nv_line(line, name, value, set_now=None):
    findstr = name + "="
    endstr = ""
    if line[-2:] == '\r\n' or line[-1:] == '\n':
        endstr = '\n'
    elif line[-1:] == '\r':
        endstr = '\r'
    if line.startswith(findstr):
        if set_now:
            call(["adb", "shell", "nv", "set", f"{name}={value}"])
        return f"{findstr}{value}{endstr}"
    else:
        return line


def file_modify(handler, line_by_line, device_path, tmp_path=None, chmod=None):
    if not device_path or not handler:
        print("文件编辑器：参数错误")
        return False
    os.makedirs("tmp", exist_ok=True)
    if tmp_path is None:
        tmp_path = f"tmp/{randrange(0, 9999)}"
    call(["adb", "pull", device_path, tmp_path])
    if not os.path.exists(tmp_path):
        print("文件编辑器：拉取失败")
        return False
    if chmod is None:
        ret, output = call(["adb", "shell", "stat", "-c", "%a", device_path], out=1, return_output=True)
        for i in output:
            if i.isdigit():
                chmod = int(i)
                break
    if not isinstance(chmod, int):
        print("文件编辑器：未知权限")
        return False
    if line_by_line:
        lines = []
        with open(tmp_path, 'rb') as file:
            for line in file.readlines():
                lines.append(handler(line))
        with open(tmp_path, 'wb') as file:
            for line in lines:
                file.write(line.replace(b"\r\n", b"\n"))
    else:
        with open(tmp_path, 'rb') as file:
            content = file.read()
            content = handler(content)
            content = content.replace(b"\r\n", b"\n")
        with open(tmp_path, 'wb') as file:
            file.write(content)
    call(['adb', 'shell', 'mount', '-o', 'rw,remount', '/'])
    call(["adb", "push", tmp_path, device_path])
    os.remove(tmp_path)
    call(["adb", "shell", "chmod", f"{chmod}", device_path])
    call(["adb", "shell", "nv", "save"])
    return True


def set_nv_configs(name, value, action=None, type_=None):
    if not name or not value:
        print("nv编辑器：参数错误")
        return False
    if not isinstance(value, str):
        value = str(value)
    action = action or False
    if not type_:
        type_ = "rw"
    if action == 1 or action == 'persist':
        if type_ == 'ro':
            file_modify(lambda line: edit_nv_line(line, name, value, False), True,
                        "/etc_ro/default/default_parameter_ro")
            call(['adb', 'shell', 'rm', '-f', '/mnt/userdata/etc_rw/nv/main/ro'])
            call(['adb', 'shell', 'rm', '-f', '/mnt/userdata/etc_rw/nv/backup/ro'])
            call(['adb', 'shell', 'nv', 'save'])
        if type_ == 'rw' or type_ == 'user':
            file_modify(lambda line: edit_nv_line(line, name, value, True), True,
                        "/etc_ro/default/default_parameter_user")
        if type_ == 'rw' or type_ == 'sys':
            file_modify(lambda line: edit_nv_line(line, name, value, True), True,
                        "/etc_ro/default/default_parameter_sys")
    else:
        if type_ == 'ro':
            print("【警告】nv编辑器：只读配置不支持直接修改")
        else:
            call(['adb', "shell", "nv", "set", f"{name}={value}"])
            if action == True or action == 'save' or action == 0:
                call(["adb", "shell", "nv", "save"])
    return True


def local_write(path, content, add=None):
    if add is None:
        add = False
    if not path or not content:
        print("写入文件：参数错误")
        return False
    if add and os.path.exists(path):
        with open(path, "ab") as file:
            file.write(content)
    else:
        with open(path, "wb") as file:
            file.write(content)
    return True


def char_write(path, content):
    for char in content:
        local_write(path, char, True)


def file_creator(device_path, content, chmod=None, is_binary=None, tmp_path=None):
    if not device_path:
        print("文件创建器：参数错误")
        return False
    is_binary = is_binary or False
    chmod = chmod or 755
    os.makedirs("tmp", exist_ok=True)
    if tmp_path is None:
        tmp_path = f"tmp/{randrange(0, 9999)}"
    if not is_binary:
        char_write(tmp_path, content)
    else:
        local_write(tmp_path, content)
    if not os.path.exists(tmp_path):
        print("文件创建器：缓存创建失败")
        return False
    call(['adb', 'push', tmp_path, device_path])
    call(["adb", "shell", "chmod", f"{chmod}", device_path])
    os.remove(tmp_path)
    return True
