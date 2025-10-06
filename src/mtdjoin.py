import os
from .fillend import fill
from .utils import call
import json
file_path = "MTDs/"
if not os.path.exists(file_path+"/partitions.json") and not os.path.exists(file_path+"/mtd0"):
    print("无法识别工程文件夹，请检查：", file_path)

def main():
    file_out = file_path + "/full_new.bin"
    if os.path.exists(file_path+"/partitions.json"):
        print("检测到新版mtd集合格式")
        print("=====================================")
        with open(file_path+"/partitions.json", "r", encoding="utf-8") as f:
            partition_data = json.load(f)
        os.remove(file_out)
        for part in partition_data:
            src = file_path + "/" + part['file'] + "_new"
            if not os.path.exists(src):
                src = file_path + "/" + part['file']
            if os.path.exists(src):
                size = os.path.getsize(src)
                if size < part['size']:
                    print("分区文件",  src ,  "太小，自动填充0xFF")
                    fill(src, part['size'])
                elif size > part['size']:
                    print("检测到严重错误：")
                    print("分区文件",src,"太大，请检查")
                    return 1
            else:
                print("检测到严重错误：")
                print("找不到分区", part['name'],"的相应文件，请检查")
            if part['start'] % 1024 == 0:
                seek = part['start'] / 1024
                call(['dd', f'if="{src}"', f'of="{file_out}"',  'bs=1024', f'seek={seek}', 'conv=notrunc'])
            else:
                call(['dd', f'if="{src}"', f'of="{file_out}"', 'bs=1', f'seek={part["start"]}', 'conv=notrunc'])
            print("已导入分区：", src)
    else:
        file_out = file_path +  "/merged-mtd.bin"
        print("检测到旧版mtd文件格式")
        print("=====================================")
        os.remove(file_out)
        os.remove("tmp")
        i = 0
        tmp_file = open('tmp', 'wb')
        while True:
            src = file_path + f"/mtd{i}"
            if not os.path.exists(src):
                print("检测到" ,src, "不存在，结束导入")
                break
            else:
                with open(src, "rb") as f:
                    tmp_file.write(f.read())
                print("已导入分区：" , src)
            i += 1
        os.rename("tmp", file_out)
        os.remove("tmp")
    print("=====================================")
    print("导入完成，\n文件位于：", file_out)

