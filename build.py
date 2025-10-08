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
import os
import platform
import shutil
import zipfile
from platform import system

from pip._internal.cli.main import main as _main


class Builder:
    def __init__(self):
        ostype = system()
        try:
            from tkinter import END
        except:
            raise FileNotFoundError("Tkinter IS not exist!\nThe Build may not Work!")
        if ostype == 'Linux':
            name = 'CWHelper-linux.zip'
        elif ostype == 'Darwin':
            if platform.machine() == 'x86_64':
                name = 'CWHelper-macos-intel.zip'
            else:
                name = 'CWHelper-macos.zip'
        else:
            name = 'CWHelper-win.zip'
        self.name = name
        self.local = os.getcwd()
        self.ostype = ostype
        self.dndplat = None

    def build(self):
        print('Building...')
        self.install_package()
        self.unit_test()
        self.pyinstaller_build()
        self.config_folder()
        self.pack_zip(f'{self.local}/dist', self.name)

    def unit_test(self):
        pass

    def install_package(self):
        with open('requirements.txt', 'r', encoding='utf-8') as l:
            for i in l.read().split("\n"):
                print(f"Installing {i}")
                _main(['install', i])

    def pyinstaller_build(self):
        import PyInstaller.__main__
        if self.ostype == 'Darwin':
            PyInstaller.__main__.run([
                'main.py',
                '-F',
                '-i',
                'icon.ico',
            ])
        elif os.name == 'posix':
            PyInstaller.__main__.run([
                'main.py',
                '-F',
                '-i',
                'icon.ico',
            ])
        elif os.name == 'nt':
            mach_ = platform.machine()
            platform.machine = lambda: 'x86' if platform.architecture()[0] == '32bit' and mach_ == 'AMD64' else mach_

            PyInstaller.__main__.run([
                'main.py',
                '-F',
                '-i',
                'icon.ico',
            ])

    def config_folder(self):
        if not os.path.exists('dist/bin'):
            os.makedirs('dist/bin', exist_ok=True)
        while_list = [ 'languages', 'licenses', 'extra_flash', 'version.ini', self.ostype]
        for i in os.listdir(self.local + "/bin"):
            if i in while_list:
                if os.path.isdir(f"{self.local}/bin/{i}"):
                    shutil.copytree(f"{self.local}/bin/{i}", f"{self.local}/dist/bin/{i}", dirs_exist_ok=True)
                else:
                    shutil.copy(f"{self.local}/bin/{i}", f"{self.local}/dist/bin/{i}")
        if not os.path.exists('dist/LICENSE'):
            shutil.copy(f'{self.local}/LICENSE', f"{self.local}/dist/LICENSE")
        for i in ['file', 'LICENSES', 'TQ', 'res']:
            if not os.path.isfile(f'dist/{i}'):
                shutil.copytree(f"{self.local}/{i}", f"{self.local}/dist/{i}", dirs_exist_ok=True)

        if os.name == 'posix':
            if platform.machine() == 'x86_64' and os.path.exists(f'{self.local}/dist/bin/Linux/aarch64'):
                try:
                    shutil.rmtree(f'{self.local}/dist/bin/Linux/aarch64')
                except Exception as e:
                    print(e)
            for root, dirs, files in os.walk(f'{self.local}/dist', topdown=True):
                for i in files:
                    print(f"Chmod {os.path.join(root, i)}")
                    os.chmod(os.path.join(root, i), 0o7777, follow_symlinks=False)

    def pack_zip(self, source, name):
        # 获取文件夹的绝对路径和文件夹名称
        abs_folder_path = os.path.abspath(source)
        # 创建一个同名的zip文件
        zip_file_path = os.path.join(self.local, name)
        with zipfile.ZipFile(zip_file_path, "w", zipfile.ZIP_DEFLATED) as archive:
            # 遍历文件夹中的所有文件和子文件夹
            for root, _, files in os.walk(abs_folder_path):
                for file in files:
                    if file == name:
                        continue
                    file_path = os.path.join(root, file)
                    if ".git" in file_path:
                        continue
                    print(f"Adding: {file_path}")
                    # 将文件添加到zip文件中
                    archive.write(file_path, os.path.relpath(file_path, abs_folder_path))
        print("Pack Zip Done!")


if __name__ == '__main__':
    builder = Builder()
    builder.build()
