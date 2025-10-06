import os
import subprocess
import platform as plat

elocal = os.getcwd()
platform = plat.machine()
ostype = plat.system()
binner = elocal + "/bin"
ebinner = binner + "/" + ostype + "/" + platform + "/"


def call(exe, extra_path=True, out=0, return_output=False):
    out_put_ = []
    if isinstance(exe, list):
        cmd = exe
        if extra_path:
            cmd[0] = f"{ebinner}{exe[0]}"
        cmd = [i for i in cmd if i]
    else:
        cmd = f'{ebinner}{exe}' if extra_path else exe
        if os.name == 'posix':
            cmd = cmd.split()
    conf = subprocess.CREATE_NO_WINDOW if os.name != 'posix' else 0
    try:
        ret = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT, creationflags=conf)
        for i in iter(ret.stdout.readline, b""):
            try:
                out_put = i.decode("utf-8").strip()
            except (Exception, BaseException):
                out_put = i.decode("gbk").strip()
            out_put_.append(out_put)
            if out == 0:
                print(out_put)
    except subprocess.CalledProcessError as e:
        for i in iter(e.stdout.readline, b""):
            try:
                out_put = i.decode("utf-8").strip()
            except (Exception, BaseException):
                out_put = i.decode("gbk").strip()
            out_put_.append(out_put)
            if out == 0:
                print(out_put)
        return 2
    except (FileNotFoundError, OSError) as e:
        return 2 if not return_output else (2, e)
    ret.wait()
    return ret.returncode if not return_output else (ret.returncode, out_put_)
