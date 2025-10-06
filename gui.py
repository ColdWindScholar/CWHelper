from threading import Thread
from tkinter import *
from tkinter.ttk import *
from tkinter import ttk
from sv_ttk import use_dark_theme
from main import Main
cil_main = Main()
def create_thread(func, *args, join=False, deamon: bool = True):
    """
    Multithreaded running tasks
    :param deamon:
    :param func: Function
    :param args:Args for the task
    :param join:if wait the task
    :return:
    """
    t = Thread(target=func, args=args, daemon=deamon)
    t.start()
    if join:
        t.join()


class Main(Tk):
    def __init__(self):
        super().__init__()
        self.title("CWHelper")
        use_dark_theme()
        self.device_status = IntVar()
        self.device_status.trace("w", lambda *x: self.change_device_status_label())
        self.at_status = IntVar()
        self.at_status.trace("w", lambda *x: self.change_at_status_label())
    def refresh_status(self):
        has_device, is_offline = cil_main.check_adb_status()
        if has_device and is_offline:
            self.device_status.set(2)
        if has_device and not is_offline:
            self.device_status.set(1)
        else:
            self.device_status.set(3)
        if cil_main.is_serial_port_connected():
            self.at_status.set(1)
        else:
            self.at_status.set(2)
    def change_device_status_label(self):
        status = {1:"已连接", 2:"已连接（离线）", 3:"无设备"}
        text = status.get(self.device_status.get(), "无设备")
        self.device_status_label.configure(text=text)
        self.device_status_label.config(foreground='green' if self.device_status.get() in [1,2] else 'red')

    def change_at_status_label(self):
        status = {1:"已连接", 2:"无设备"}
        text = status.get(self.at_status.get(), "无设备")
        self.at_status_label.configure(text=text)
        self.at_status_label.config(foreground='green' if self.at_status.get() == 1 else 'red')

    def main(self):
        ttk.Label(self, text="CWHelper", font=(None, 20)).pack(padx=5, pady=5)
        device_info = ttk.Labelframe(self, text="设备信息")
        device_status_frame = ttk.Frame(device_info)
        ttk.Label(device_status_frame, text="设备状态:", foreground='yellow').pack(padx=5, pady=5, side=LEFT)
        self.device_status_label = ttk.Label(device_status_frame,text="未连接")
        self.device_status_label.pack(padx=5, pady=5, side=RIGHT)
        device_status_frame.pack(padx=5, pady=5)
        at_status_frame = ttk.Frame(device_info)
        ttk.Label(at_status_frame, text="串口状态(AT等):", foreground='yellow').pack(padx=5, pady=5, side=LEFT)
        self.at_status_label = ttk.Label(at_status_frame, text="未连接")
        self.at_status_label.pack(padx=5, pady=5, side=RIGHT)
        at_status_frame.pack(padx=5, pady=5)
        ttk.Button(device_info, text="刷新", command=self.refresh_status).pack(padx=5, pady=5, expand=True, fill=X)
        device_info.pack(padx=5, pady=5)


if __name__ == "__main__":
    app = Main()
    app.main()
    app.mainloop()