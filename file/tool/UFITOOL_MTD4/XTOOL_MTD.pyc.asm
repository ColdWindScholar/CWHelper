XTOOL_MTD.pyc (Python 3.11)
[Code]
    File Name: XTOOL_MTD.py
    Object Name: <module>
    Qualified Name: <module>
    Arg Count: 0
    Pos Only Arg Count: 0
    KW Only Arg Count: 0
    Stack Size: 5
    Flags: 0x00000000
    [Names]
        'os'
        'base64'
        'subprocess'
        'time'
        'sys'
        'requests'
        'serial'
        'threading'
        'serial.tools'
        'list_ports'
        'PyQt5.QtWidgets'
        'QApplication'
        'QMainWindow'
        'QWidget'
        'QVBoxLayout'
        'QHBoxLayout'
        'QGridLayout'
        'QPushButton'
        'QTextEdit'
        'QMessageBox'
        'QInputDialog'
        'QComboBox'
        'QSizePolicy'
        'QLabel'
        'QLineEdit'
        'QDialog'
        'QFileDialog'
        'QDialogButtonBox'
        'PyQt5.QtGui'
        'QIcon'
        'QFont'
        'QTextCursor'
        'QTextBlockFormat'
        'PyQt5.QtCore'
        'Qt'
        'QProcess'
        'QThread'
        'pyqtSignal'
        'QTimer'
        'AdbCommandThread'
        'ADBTool'
        'ADToolWindow'
        'ATToolWindow'
        'CommandDialog'
        '__name__'
        'argv'
        'app'
        'main_window'
        'show'
        'exit'
        'exec_'
    [Locals+Names]
    [Constants]
        0
        None
        (
            'list_ports'
        )
        (
            'QApplication'
            'QMainWindow'
            'QWidget'
            'QVBoxLayout'
            'QHBoxLayout'
            'QGridLayout'
            'QPushButton'
            'QTextEdit'
            'QMessageBox'
            'QInputDialog'
            'QComboBox'
            'QSizePolicy'
            'QLabel'
            'QLineEdit'
            'QDialog'
            'QFileDialog'
            'QDialogButtonBox'
        )
        (
            'QIcon'
            'QFont'
            'QTextCursor'
            'QTextBlockFormat'
        )
        (
            'Qt'
            'QProcess'
            'QThread'
            'pyqtSignal'
            'QTimer'
        )
        [Code]
            File Name: XTOOL_MTD.py
            Object Name: AdbCommandThread
            Qualified Name: AdbCommandThread
            Arg Count: 0
            Pos Only Arg Count: 0
            KW Only Arg Count: 0
            Stack Size: 3
            Flags: 0x00000000
            [Names]
                '__name__'
                '__module__'
                '__qualname__'
                'pyqtSignal'
                'str'
                'output_signal'
                '__init__'
                'run'
                '__classcell__'
            [Locals+Names]
                '__class__'
            [Constants]
                'AdbCommandThread'
                None
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: __init__
                    Qualified Name: AdbCommandThread.__init__
                    Arg Count: 4
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'super'
                        '__init__'
                        'adb_path'
                        'commands'
                    [Locals+Names]
                        'self'
                        'adb_path'
                        'commands'
                        'parent'
                        '__class__'
                    [Constants]
                        None
                    [Disassembly]
                        0       COPY_FREE_VARS                  1
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + super
                        16      PRECALL                         0
                        20      CALL                            0
                        30      LOAD_METHOD                     1: __init__
                        52      LOAD_FAST                       3: parent
                        54      PRECALL                         1
                        58      CALL                            1
                        68      POP_TOP                         
                        70      LOAD_FAST                       1: adb_path
                        72      LOAD_FAST                       0: self
                        74      STORE_ATTR                      2: adb_path
                        84      LOAD_FAST                       2: commands
                        86      LOAD_FAST                       0: self
                        88      STORE_ATTR                      3: commands
                        98      LOAD_CONST                      0: None
                        100     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: run
                    Qualified Name: AdbCommandThread.run
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 8
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'commands'
                        'adb_path'
                        'subprocess'
                        'Popen'
                        'PIPE'
                        'CREATE_NO_WINDOW'
                        'communicate'
                        'strip'
                        'returncode'
                        'Exception'
                        'str'
                        'output_signal'
                        'emit'
                    [Locals+Names]
                        'self'
                        'command'
                        'command_with_adb'
                        'process'
                        'stdout'
                        'stderr'
                        'result'
                        'e'
                    [Constants]
                        None
                        '"'
                        '" '
                        True
                        (
                            'stdout'
                            'stderr'
                            'text'
                            'creationflags'
                        )
                        'Executed adb command: '
                        '\n'
                        'Output:\n'
                        'Error:\n'
                        'Return code: '
                        'Exception occurred while executing command: '
                        '\nException: '
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: commands
                        14      GET_ITER                        
                        16      FOR_ITER                        243 (to 504)
                        18      STORE_FAST                      1: command
                        20      LOAD_CONST                      1: '"'
                        22      LOAD_FAST                       0: self
                        24      LOAD_ATTR                       1: adb_path
                        34      FORMAT_VALUE                    0 (FVC_NONE)
                        36      LOAD_CONST                      2: '" '
                        38      LOAD_FAST                       1: command
                        40      FORMAT_VALUE                    0 (FVC_NONE)
                        42      BUILD_STRING                    4
                        44      STORE_FAST                      2: command_with_adb
                        46      NOP                             
                        48      LOAD_GLOBAL                     5: NULL + subprocess
                        60      LOAD_ATTR                       3: Popen
                        70      LOAD_FAST                       2: command_with_adb
                        72      LOAD_GLOBAL                     4: subprocess
                        84      LOAD_ATTR                       4: PIPE
                        94      LOAD_GLOBAL                     4: subprocess
                        106     LOAD_ATTR                       4: PIPE
                        116     LOAD_CONST                      3: True
                        118     LOAD_GLOBAL                     4: subprocess
                        130     LOAD_ATTR                       5: CREATE_NO_WINDOW
                        140     KW_NAMES                        4: ('stdout', 'stderr', 'text', 'creationflags')
                        142     PRECALL                         5
                        146     CALL                            5
                        156     STORE_FAST                      3: process
                        158     LOAD_FAST                       3: process
                        160     LOAD_METHOD                     6: communicate
                        182     PRECALL                         0
                        186     CALL                            0
                        196     UNPACK_SEQUENCE                 2
                        200     STORE_FAST                      4: stdout
                        202     STORE_FAST                      5: stderr
                        204     LOAD_CONST                      5: 'Executed adb command: '
                        206     LOAD_FAST                       1: command
                        208     FORMAT_VALUE                    0 (FVC_NONE)
                        210     LOAD_CONST                      6: '\n'
                        212     BUILD_STRING                    3
                        214     STORE_FAST                      6: result
                        216     LOAD_FAST                       4: stdout
                        218     POP_JUMP_FORWARD_IF_FALSE       27 (to 274)
                        220     LOAD_FAST                       6: result
                        222     LOAD_CONST                      7: 'Output:\n'
                        224     LOAD_FAST                       4: stdout
                        226     LOAD_METHOD                     7: strip
                        248     PRECALL                         0
                        252     CALL                            0
                        262     FORMAT_VALUE                    0 (FVC_NONE)
                        264     LOAD_CONST                      6: '\n'
                        266     BUILD_STRING                    3
                        268     BINARY_OP                       13 (+=)
                        272     STORE_FAST                      6: result
                        274     LOAD_FAST                       5: stderr
                        276     POP_JUMP_FORWARD_IF_FALSE       27 (to 332)
                        278     LOAD_FAST                       6: result
                        280     LOAD_CONST                      8: 'Error:\n'
                        282     LOAD_FAST                       5: stderr
                        284     LOAD_METHOD                     7: strip
                        306     PRECALL                         0
                        310     CALL                            0
                        320     FORMAT_VALUE                    0 (FVC_NONE)
                        322     LOAD_CONST                      6: '\n'
                        324     BUILD_STRING                    3
                        326     BINARY_OP                       13 (+=)
                        330     STORE_FAST                      6: result
                        332     LOAD_FAST                       6: result
                        334     LOAD_CONST                      9: 'Return code: '
                        336     LOAD_FAST                       3: process
                        338     LOAD_ATTR                       8: returncode
                        348     FORMAT_VALUE                    0 (FVC_NONE)
                        350     LOAD_CONST                      6: '\n'
                        352     BUILD_STRING                    3
                        354     BINARY_OP                       13 (+=)
                        358     STORE_FAST                      6: result
                        360     JUMP_FORWARD                    44 (to 450)
                        362     PUSH_EXC_INFO                   
                        364     LOAD_GLOBAL                     18: Exception
                        376     CHECK_EXC_MATCH                 
                        378     POP_JUMP_FORWARD_IF_FALSE       31 (to 442)
                        380     STORE_FAST                      7: e
                        382     LOAD_CONST                      10: 'Exception occurred while executing command: '
                        384     LOAD_FAST                       1: command
                        386     FORMAT_VALUE                    0 (FVC_NONE)
                        388     LOAD_CONST                      11: '\nException: '
                        390     LOAD_GLOBAL                     21: NULL + str
                        402     LOAD_FAST                       7: e
                        404     PRECALL                         1
                        408     CALL                            1
                        418     FORMAT_VALUE                    0 (FVC_NONE)
                        420     BUILD_STRING                    4
                        422     STORE_FAST                      6: result
                        424     POP_EXCEPT                      
                        426     LOAD_CONST                      0: None
                        428     STORE_FAST                      7: e
                        430     DELETE_FAST                     7: e
                        432     JUMP_FORWARD                    8 (to 450)
                        434     LOAD_CONST                      0: None
                        436     STORE_FAST                      7: e
                        438     DELETE_FAST                     7: e
                        440     RERAISE                         1
                        442     RERAISE                         0
                        444     COPY                            3
                        446     POP_EXCEPT                      
                        448     RERAISE                         1
                        450     LOAD_FAST                       0: self
                        452     LOAD_ATTR                       11: output_signal
                        462     LOAD_METHOD                     12: emit
                        484     LOAD_FAST                       6: result
                        486     PRECALL                         1
                        490     CALL                            1
                        500     POP_TOP                         
                        502     JUMP_BACKWARD                   244 (to 16)
                        504     LOAD_CONST                      0: None
                        506     RETURN_VALUE                    
                    [Exception Table]
                        48 to 360 -> 362 [1] 
                        362 to 382 -> 444 [2] lasti
                        382 to 424 -> 434 [2] lasti
                        434 to 444 -> 444 [2] lasti
                (
                    None
                )
            [Disassembly]
                0       MAKE_CELL                       0: __class__
                2       RESUME                          0
                4       LOAD_NAME                       0: __name__
                6       STORE_NAME                      1: __module__
                8       LOAD_CONST                      0: 'AdbCommandThread'
                10      STORE_NAME                      2: __qualname__
                12      PUSH_NULL                       
                14      LOAD_NAME                       3: pyqtSignal
                16      LOAD_NAME                       4: str
                18      PRECALL                         1
                22      CALL                            1
                32      STORE_NAME                      5: output_signal
                34      LOAD_CONST                      4: (None,)
                36      LOAD_CLOSURE                    0: __class__
                38      BUILD_TUPLE                     1
                40      LOAD_CONST                      2: <CODE> __init__
                42      MAKE_FUNCTION                   9
                44      STORE_NAME                      6: __init__
                46      LOAD_CONST                      3: <CODE> run
                48      MAKE_FUNCTION                   0
                50      STORE_NAME                      7: run
                52      LOAD_CLOSURE                    0: __class__
                54      COPY                            1
                56      STORE_NAME                      8: __classcell__
                58      RETURN_VALUE                    
            [Exception Table]
        'AdbCommandThread'
        [Code]
            File Name: XTOOL_MTD.py
            Object Name: ADBTool
            Qualified Name: ADBTool
            Arg Count: 0
            Pos Only Arg Count: 0
            KW Only Arg Count: 0
            Stack Size: 2
            Flags: 0x00000000
            [Names]
                '__name__'
                '__module__'
                '__qualname__'
                '__init__'
                'set_window_icon'
                'init_ui'
                'execute_adb_commands'
                'handle_output'
                'execute_weby_command'
                'verify_js_push'
                'pull_and_modify_index_html'
                'modify_and_push_index_html'
                'verify_index_push'
                'refresh_device_status'
                'update_device_status'
                'scan_adb_devices'
                'execute_adb_command'
                'show_input_dialog'
                'start_crawler'
                'execute_stop_commands'
                'send_requests'
                'execute_tasks'
                'send_imei'
                'execute_web_command'
                'execute_mtd_commands'
                'process_mtd_output'
                'pull_mtd_partitions'
                'pull_directories'
                'execute_reboot_operations'
                'open_at_tool'
                'open_ad_tool'
                '__classcell__'
            [Locals+Names]
                '__class__'
            [Constants]
                'ADBTool'
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: __init__
                    Qualified Name: ADBTool.__init__
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 9
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'super'
                        '__init__'
                        'setWindowTitle'
                        'getattr'
                        'sys'
                        'os'
                        'path'
                        'abspath'
                        'dirname'
                        '__file__'
                        'script_directory'
                        'set_window_icon'
                        'init_ui'
                    [Locals+Names]
                        'self'
                        '__class__'
                    [Constants]
                        None
                        'UFI_TOOL by Orz0000'
                        '_MEIPASS'
                    [Disassembly]
                        0       COPY_FREE_VARS                  1
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + super
                        16      PRECALL                         0
                        20      CALL                            0
                        30      LOAD_METHOD                     1: __init__
                        52      PRECALL                         0
                        56      CALL                            0
                        66      POP_TOP                         
                        68      LOAD_FAST                       0: self
                        70      LOAD_METHOD                     2: setWindowTitle
                        92      LOAD_CONST                      1: 'UFI_TOOL by Orz0000'
                        94      PRECALL                         1
                        98      CALL                            1
                        108     POP_TOP                         
                        110     LOAD_GLOBAL                     7: NULL + getattr
                        122     LOAD_GLOBAL                     8: sys
                        134     LOAD_CONST                      2: '_MEIPASS'
                        136     LOAD_GLOBAL                     10: os
                        148     LOAD_ATTR                       6: path
                        158     LOAD_METHOD                     7: abspath
                        180     LOAD_GLOBAL                     10: os
                        192     LOAD_ATTR                       6: path
                        202     LOAD_METHOD                     8: dirname
                        224     LOAD_GLOBAL                     18: __file__
                        236     PRECALL                         1
                        240     CALL                            1
                        250     PRECALL                         1
                        254     CALL                            1
                        264     PRECALL                         3
                        268     CALL                            3
                        278     LOAD_FAST                       0: self
                        280     STORE_ATTR                      10: script_directory
                        290     LOAD_FAST                       0: self
                        292     LOAD_METHOD                     11: set_window_icon
                        314     PRECALL                         0
                        318     CALL                            0
                        328     POP_TOP                         
                        330     LOAD_FAST                       0: self
                        332     LOAD_METHOD                     12: init_ui
                        354     PRECALL                         0
                        358     CALL                            0
                        368     POP_TOP                         
                        370     LOAD_CONST                      0: None
                        372     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_window_icon
                    Qualified Name: ADBTool.set_window_icon
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'exists'
                        'setWindowIcon'
                        'QIcon'
                        'print'
                    [Locals+Names]
                        'self'
                        'icon_path'
                    [Constants]
                        None
                        'u.ico'
                        'Icon file not found:'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'u.ico'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      1: icon_path
                        76      LOAD_GLOBAL                     0: os
                        88      LOAD_ATTR                       1: path
                        98      LOAD_METHOD                     4: exists
                        120     LOAD_FAST                       1: icon_path
                        122     PRECALL                         1
                        126     CALL                            1
                        136     POP_JUMP_FORWARD_IF_FALSE       36 (to 210)
                        138     LOAD_FAST                       0: self
                        140     LOAD_METHOD                     5: setWindowIcon
                        162     LOAD_GLOBAL                     13: NULL + QIcon
                        174     LOAD_FAST                       1: icon_path
                        176     PRECALL                         1
                        180     CALL                            1
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_CONST                      0: None
                        208     RETURN_VALUE                    
                        210     LOAD_GLOBAL                     15: NULL + print
                        222     LOAD_CONST                      2: 'Icon file not found:'
                        224     LOAD_FAST                       1: icon_path
                        226     PRECALL                         2
                        230     CALL                            2
                        240     POP_TOP                         
                        242     LOAD_CONST                      0: None
                        244     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: init_ui
                    Qualified Name: ADBTool.init_ui
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 11
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QWidget'
                        'QVBoxLayout'
                        'QTextEdit'
                        'feedback_text'
                        'addWidget'
                        'QHBoxLayout'
                        'QLabel'
                        'device_status_label'
                        'update_device_status'
                        'setAlignment'
                        'Qt'
                        'AlignLeft'
                        'addLayout'
                        'show_input_dialog'
                        'refresh_device_status'
                        'execute_stop_commands'
                        'execute_tasks'
                        'send_imei'
                        'execute_web_command'
                        'execute_mtd_commands'
                        'pull_directories'
                        'execute_reboot_operations'
                        'open_at_tool'
                        'open_ad_tool'
                        'zip'
                        'QPushButton'
                        'clicked'
                        'connect'
                        'setLayout'
                        'setCentralWidget'
                    [Locals+Names]
                        'self'
                        'main_widget'
                        'layout'
                        'button_layout'
                        'device_layout'
                        'button_names'
                        'button_commands'
                        'button_text'
                        'command_func'
                        'button'
                    [Constants]
                        None
                        (
                            '开启ADB'
                            '检测ADB'
                            '通用优化'
                            '18优化'
                            '18改川'
                            'web后台'
                            '备份mtd分区'
                            '备份系统文件'
                            '重启设备'
                            'AT工具'
                            'ADB shell'
                        )
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QWidget
                        14      PRECALL                         0
                        18      CALL                            0
                        28      STORE_FAST                      1: main_widget
                        30      LOAD_GLOBAL                     3: NULL + QVBoxLayout
                        42      PRECALL                         0
                        46      CALL                            0
                        56      STORE_FAST                      2: layout
                        58      LOAD_GLOBAL                     5: NULL + QTextEdit
                        70      PRECALL                         0
                        74      CALL                            0
                        84      LOAD_FAST                       0: self
                        86      STORE_ATTR                      3: feedback_text
                        96      LOAD_FAST                       2: layout
                        98      LOAD_METHOD                     4: addWidget
                        120     LOAD_FAST                       0: self
                        122     LOAD_ATTR                       3: feedback_text
                        132     PRECALL                         1
                        136     CALL                            1
                        146     POP_TOP                         
                        148     LOAD_GLOBAL                     11: NULL + QHBoxLayout
                        160     PRECALL                         0
                        164     CALL                            0
                        174     STORE_FAST                      3: button_layout
                        176     LOAD_GLOBAL                     11: NULL + QHBoxLayout
                        188     PRECALL                         0
                        192     CALL                            0
                        202     STORE_FAST                      4: device_layout
                        204     LOAD_GLOBAL                     13: NULL + QLabel
                        216     PRECALL                         0
                        220     CALL                            0
                        230     LOAD_FAST                       0: self
                        232     STORE_ATTR                      7: device_status_label
                        242     LOAD_FAST                       0: self
                        244     LOAD_METHOD                     8: update_device_status
                        266     PRECALL                         0
                        270     CALL                            0
                        280     POP_TOP                         
                        282     LOAD_FAST                       0: self
                        284     LOAD_ATTR                       7: device_status_label
                        294     LOAD_METHOD                     9: setAlignment
                        316     LOAD_GLOBAL                     20: Qt
                        328     LOAD_ATTR                       11: AlignLeft
                        338     PRECALL                         1
                        342     CALL                            1
                        352     POP_TOP                         
                        354     LOAD_FAST                       4: device_layout
                        356     LOAD_METHOD                     4: addWidget
                        378     LOAD_FAST                       0: self
                        380     LOAD_ATTR                       7: device_status_label
                        390     PRECALL                         1
                        394     CALL                            1
                        404     POP_TOP                         
                        406     LOAD_FAST                       2: layout
                        408     LOAD_METHOD                     12: addLayout
                        430     LOAD_FAST                       4: device_layout
                        432     PRECALL                         1
                        436     CALL                            1
                        446     POP_TOP                         
                        448     BUILD_LIST                      0
                        450     LOAD_CONST                      1: ('开启ADB', '检测ADB', '通用优化', '18优化', '18改川', 'web后台', '备份mtd分区', '备份系统文件', '重启设备', 'AT工具', 'ADB shell')
                        452     LIST_EXTEND                     1
                        454     STORE_FAST                      5: button_names
                        456     LOAD_FAST                       0: self
                        458     LOAD_ATTR                       13: show_input_dialog
                        468     LOAD_FAST                       0: self
                        470     LOAD_ATTR                       14: refresh_device_status
                        480     LOAD_FAST                       0: self
                        482     LOAD_ATTR                       15: execute_stop_commands
                        492     LOAD_FAST                       0: self
                        494     LOAD_ATTR                       16: execute_tasks
                        504     LOAD_FAST                       0: self
                        506     LOAD_ATTR                       17: send_imei
                        516     LOAD_FAST                       0: self
                        518     LOAD_ATTR                       18: execute_web_command
                        528     LOAD_FAST                       0: self
                        530     LOAD_ATTR                       19: execute_mtd_commands
                        540     LOAD_FAST                       0: self
                        542     LOAD_ATTR                       20: pull_directories
                        552     LOAD_FAST                       0: self
                        554     LOAD_ATTR                       21: execute_reboot_operations
                        564     LOAD_FAST                       0: self
                        566     LOAD_ATTR                       22: open_at_tool
                        576     LOAD_FAST                       0: self
                        578     LOAD_ATTR                       23: open_ad_tool
                        588     BUILD_LIST                      11
                        590     STORE_FAST                      6: button_commands
                        592     LOAD_GLOBAL                     49: NULL + zip
                        604     LOAD_FAST                       5: button_names
                        606     LOAD_FAST                       6: button_commands
                        608     PRECALL                         2
                        612     CALL                            2
                        622     GET_ITER                        
                        624     FOR_ITER                        67 (to 760)
                        626     UNPACK_SEQUENCE                 2
                        630     STORE_FAST                      7: button_text
                        632     STORE_FAST                      8: command_func
                        634     LOAD_GLOBAL                     51: NULL + QPushButton
                        646     LOAD_FAST                       7: button_text
                        648     PRECALL                         1
                        652     CALL                            1
                        662     STORE_FAST                      9: button
                        664     LOAD_FAST                       9: button
                        666     LOAD_ATTR                       26: clicked
                        676     LOAD_METHOD                     27: connect
                        698     LOAD_FAST                       8: command_func
                        700     PRECALL                         1
                        704     CALL                            1
                        714     POP_TOP                         
                        716     LOAD_FAST                       3: button_layout
                        718     LOAD_METHOD                     4: addWidget
                        740     LOAD_FAST                       9: button
                        742     PRECALL                         1
                        746     CALL                            1
                        756     POP_TOP                         
                        758     JUMP_BACKWARD                   68 (to 624)
                        760     LOAD_FAST                       2: layout
                        762     LOAD_METHOD                     12: addLayout
                        784     LOAD_FAST                       3: button_layout
                        786     PRECALL                         1
                        790     CALL                            1
                        800     POP_TOP                         
                        802     LOAD_FAST                       1: main_widget
                        804     LOAD_METHOD                     28: setLayout
                        826     LOAD_FAST                       2: layout
                        828     PRECALL                         1
                        832     CALL                            1
                        842     POP_TOP                         
                        844     LOAD_FAST                       0: self
                        846     LOAD_METHOD                     29: setCentralWidget
                        868     LOAD_FAST                       1: main_widget
                        870     PRECALL                         1
                        874     CALL                            1
                        884     POP_TOP                         
                        886     LOAD_CONST                      0: None
                        888     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_adb_commands
                    Qualified Name: ADBTool.execute_adb_commands
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'AdbCommandThread'
                        'thread'
                        'output_signal'
                        'connect'
                        'handle_output'
                        'start'
                    [Locals+Names]
                        'self'
                        'commands'
                        'adb_path'
                    [Constants]
                        None
                        'adb.exe'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'adb.exe'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      2: adb_path
                        76      LOAD_GLOBAL                     9: NULL + AdbCommandThread
                        88      LOAD_FAST                       2: adb_path
                        90      LOAD_FAST                       1: commands
                        92      PRECALL                         2
                        96      CALL                            2
                        106     LOAD_FAST                       0: self
                        108     STORE_ATTR                      5: thread
                        118     LOAD_FAST                       0: self
                        120     LOAD_ATTR                       5: thread
                        130     LOAD_ATTR                       6: output_signal
                        140     LOAD_METHOD                     7: connect
                        162     LOAD_FAST                       0: self
                        164     LOAD_ATTR                       8: handle_output
                        174     PRECALL                         1
                        178     CALL                            1
                        188     POP_TOP                         
                        190     LOAD_FAST                       0: self
                        192     LOAD_ATTR                       5: thread
                        202     LOAD_METHOD                     9: start
                        224     PRECALL                         0
                        228     CALL                            0
                        238     POP_TOP                         
                        240     LOAD_CONST                      0: None
                        242     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: handle_output
                    Qualified Name: ADBTool.handle_output
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'feedback_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'output'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: feedback_text
                        14      LOAD_METHOD                     1: append
                        36      LOAD_FAST                       1: output
                        38      PRECALL                         1
                        42      CALL                            1
                        52      POP_TOP                         
                        54      LOAD_CONST                      0: None
                        56      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_weby_command
                    Qualified Name: ADBTool.execute_weby_command
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 6
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'execute_adb_commands'
                        'thread'
                        'output_signal'
                        'connect'
                        'verify_js_push'
                    [Locals+Names]
                        'self'
                        'commands'
                    [Constants]
                        None
                        'shell mount -o remount,rw /'
                        'push "'
                        'a.js'
                        '" /etc_ro/web/js/'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: 'shell mount -o remount,rw /'
                        4       LOAD_CONST                      2: 'push "'
                        6       LOAD_GLOBAL                     0: os
                        18      LOAD_ATTR                       1: path
                        28      LOAD_METHOD                     2: join
                        50      LOAD_FAST                       0: self
                        52      LOAD_ATTR                       3: script_directory
                        62      LOAD_CONST                      3: 'a.js'
                        64      PRECALL                         2
                        68      CALL                            2
                        78      FORMAT_VALUE                    0 (FVC_NONE)
                        80      LOAD_CONST                      4: '" /etc_ro/web/js/'
                        82      BUILD_STRING                    3
                        84      BUILD_LIST                      2
                        86      STORE_FAST                      1: commands
                        88      LOAD_FAST                       0: self
                        90      LOAD_METHOD                     4: execute_adb_commands
                        112     LOAD_FAST                       1: commands
                        114     PRECALL                         1
                        118     CALL                            1
                        128     POP_TOP                         
                        130     LOAD_FAST                       0: self
                        132     LOAD_ATTR                       5: thread
                        142     LOAD_ATTR                       6: output_signal
                        152     LOAD_METHOD                     7: connect
                        174     LOAD_FAST                       0: self
                        176     LOAD_ATTR                       8: verify_js_push
                        186     PRECALL                         1
                        190     CALL                            1
                        200     POP_TOP                         
                        202     LOAD_CONST                      0: None
                        204     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: verify_js_push
                    Qualified Name: ADBTool.verify_js_push
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'pull_and_modify_index_html'
                        'feedback_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'output'
                    [Constants]
                        None
                        'Return code: 0'
                        'Failed to push a.js. Web directory write access check failed.'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: 'Return code: 0'
                        4       LOAD_FAST                       1: output
                        6       CONTAINS_OP                     0 (in)
                        8       POP_JUMP_FORWARD_IF_FALSE       22 (to 54)
                        10      LOAD_FAST                       0: self
                        12      LOAD_METHOD                     0: pull_and_modify_index_html
                        34      PRECALL                         0
                        38      CALL                            0
                        48      POP_TOP                         
                        50      LOAD_CONST                      0: None
                        52      RETURN_VALUE                    
                        54      LOAD_FAST                       0: self
                        56      LOAD_ATTR                       1: feedback_text
                        66      LOAD_METHOD                     2: append
                        88      LOAD_CONST                      2: 'Failed to push a.js. Web directory write access check failed.'
                        90      PRECALL                         1
                        94      CALL                            1
                        104     POP_TOP                         
                        106     LOAD_CONST                      0: None
                        108     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: pull_and_modify_index_html
                    Qualified Name: ADBTool.pull_and_modify_index_html
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'execute_adb_commands'
                        'thread'
                        'output_signal'
                        'connect'
                    [Locals+Names]
                        'self'
                        'pull_command'
                        'local_index_path'
                        'remote_index_path'
                    [Constants]
                        None
                        'index.html'
                        '/etc_ro/web/index.html'
                        'pull '
                        ' "'
                        '"'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ADBTool.pull_and_modify_index_html.<locals>.<lambda>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 5
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'modify_and_push_index_html'
                            [Locals+Names]
                                'output'
                                'local_index_path'
                                'remote_index_path'
                                'self'
                            [Constants]
                                None
                            [Disassembly]
                                0       COPY_FREE_VARS                  3
                                2       RESUME                          0
                                4       LOAD_DEREF                      3: self
                                6       LOAD_METHOD                     0: modify_and_push_index_html
                                28      LOAD_FAST                       0: output
                                30      LOAD_DEREF                      1: local_index_path
                                32      LOAD_DEREF                      2: remote_index_path
                                34      PRECALL                         3
                                38      CALL                            3
                                48      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       MAKE_CELL                       0: self
                        2       MAKE_CELL                       2: local_index_path
                        4       MAKE_CELL                       3: remote_index_path
                        6       RESUME                          0
                        8       LOAD_GLOBAL                     0: os
                        20      LOAD_ATTR                       1: path
                        30      LOAD_METHOD                     2: join
                        52      LOAD_DEREF                      0: self
                        54      LOAD_ATTR                       3: script_directory
                        64      LOAD_CONST                      1: 'index.html'
                        66      PRECALL                         2
                        70      CALL                            2
                        80      STORE_DEREF                     2: local_index_path
                        82      LOAD_CONST                      2: '/etc_ro/web/index.html'
                        84      STORE_DEREF                     3: remote_index_path
                        86      LOAD_CONST                      3: 'pull '
                        88      LOAD_DEREF                      3: remote_index_path
                        90      FORMAT_VALUE                    0 (FVC_NONE)
                        92      LOAD_CONST                      4: ' "'
                        94      LOAD_DEREF                      2: local_index_path
                        96      FORMAT_VALUE                    0 (FVC_NONE)
                        98      LOAD_CONST                      5: '"'
                        100     BUILD_STRING                    5
                        102     STORE_FAST                      1: pull_command
                        104     LOAD_DEREF                      0: self
                        106     LOAD_METHOD                     4: execute_adb_commands
                        128     LOAD_FAST                       1: pull_command
                        130     BUILD_LIST                      1
                        132     PRECALL                         1
                        136     CALL                            1
                        146     POP_TOP                         
                        148     LOAD_DEREF                      0: self
                        150     LOAD_ATTR                       5: thread
                        160     LOAD_ATTR                       6: output_signal
                        170     LOAD_METHOD                     7: connect
                        192     LOAD_CLOSURE                    2: local_index_path
                        194     LOAD_CLOSURE                    3: remote_index_path
                        196     LOAD_CLOSURE                    0: self
                        198     BUILD_TUPLE                     3
                        200     LOAD_CONST                      6: <CODE> <lambda>
                        202     MAKE_FUNCTION                   8
                        204     PRECALL                         1
                        208     CALL                            1
                        218     POP_TOP                         
                        220     LOAD_CONST                      0: None
                        222     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: modify_and_push_index_html
                    Qualified Name: ADBTool.modify_and_push_index_html
                    Arg Count: 4
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 6
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'feedback_text'
                        'append'
                        'open'
                        'read'
                        'rfind'
                        'write'
                        'execute_adb_commands'
                        'thread'
                        'output_signal'
                        'connect'
                    [Locals+Names]
                        'self'
                        'output'
                        'local_index_path'
                        'remote_index_path'
                        'file'
                        'content'
                        'index'
                        'modified_content'
                        'push_command'
                    [Constants]
                        None
                        'Return code: 0'
                        'Pulled index.html successfully.'
                        'r'
                        'utf-8'
                        (
                            'encoding'
                        )
                        '</body>'
                        -1
                        '<script src="js/a.js"></script>'
                        'w'
                        'push "'
                        '" '
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ADBTool.modify_and_push_index_html.<locals>.<lambda>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'verify_index_push'
                            [Locals+Names]
                                'output'
                                'self'
                            [Constants]
                                None
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      1: self
                                6       LOAD_METHOD                     0: verify_index_push
                                28      LOAD_FAST                       0: output
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        'Failed to pull index.html.'
                    [Disassembly]
                        0       MAKE_CELL                       0: self
                        2       RESUME                          0
                        4       LOAD_CONST                      1: 'Return code: 0'
                        6       LOAD_FAST                       1: output
                        8       CONTAINS_OP                     0 (in)
                        10      POP_JUMP_FORWARD_IF_FALSE       270 (to 554)
                        14      LOAD_DEREF                      0: self
                        16      LOAD_ATTR                       0: feedback_text
                        26      LOAD_METHOD                     1: append
                        48      LOAD_CONST                      2: 'Pulled index.html successfully.'
                        50      PRECALL                         1
                        54      CALL                            1
                        64      POP_TOP                         
                        66      LOAD_GLOBAL                     5: NULL + open
                        78      LOAD_FAST                       2: local_index_path
                        80      LOAD_CONST                      3: 'r'
                        82      LOAD_CONST                      4: 'utf-8'
                        84      KW_NAMES                        5: ('encoding',)
                        86      PRECALL                         3
                        90      CALL                            3
                        100     BEFORE_WITH                     
                        102     STORE_FAST                      4: file
                        104     LOAD_FAST                       4: file
                        106     LOAD_METHOD                     3: read
                        128     PRECALL                         0
                        132     CALL                            0
                        142     STORE_FAST                      5: content
                        144     LOAD_CONST                      0: None
                        146     LOAD_CONST                      0: None
                        148     LOAD_CONST                      0: None
                        150     PRECALL                         2
                        154     CALL                            2
                        164     POP_TOP                         
                        166     JUMP_FORWARD                    11 (to 190)
                        168     PUSH_EXC_INFO                   
                        170     WITH_EXCEPT_START               
                        172     POP_JUMP_FORWARD_IF_TRUE        4 (to 182)
                        174     RERAISE                         2
                        176     COPY                            3
                        178     POP_EXCEPT                      
                        180     RERAISE                         1
                        182     POP_TOP                         
                        184     POP_EXCEPT                      
                        186     POP_TOP                         
                        188     POP_TOP                         
                        190     LOAD_FAST                       5: content
                        192     LOAD_METHOD                     4: rfind
                        214     LOAD_CONST                      6: '</body>'
                        216     PRECALL                         1
                        220     CALL                            1
                        230     STORE_FAST                      6: index
                        232     LOAD_FAST                       6: index
                        234     LOAD_CONST                      7: -1
                        236     COMPARE_OP                      3 (!=)
                        242     POP_JUMP_FORWARD_IF_FALSE       153 (to 550)
                        244     LOAD_FAST                       5: content
                        246     LOAD_CONST                      0: None
                        248     LOAD_FAST                       6: index
                        250     BUILD_SLICE                     2
                        252     BINARY_SUBSCR                   
                        262     LOAD_CONST                      8: '<script src="js/a.js"></script>'
                        264     BINARY_OP                       0 (+)
                        268     LOAD_FAST                       5: content
                        270     LOAD_FAST                       6: index
                        272     LOAD_CONST                      0: None
                        274     BUILD_SLICE                     2
                        276     BINARY_SUBSCR                   
                        286     BINARY_OP                       0 (+)
                        290     STORE_FAST                      7: modified_content
                        292     LOAD_GLOBAL                     5: NULL + open
                        304     LOAD_FAST                       2: local_index_path
                        306     LOAD_CONST                      9: 'w'
                        308     LOAD_CONST                      4: 'utf-8'
                        310     KW_NAMES                        5: ('encoding',)
                        312     PRECALL                         3
                        316     CALL                            3
                        326     BEFORE_WITH                     
                        328     STORE_FAST                      4: file
                        330     LOAD_FAST                       4: file
                        332     LOAD_METHOD                     5: write
                        354     LOAD_FAST                       7: modified_content
                        356     PRECALL                         1
                        360     CALL                            1
                        370     POP_TOP                         
                        372     LOAD_CONST                      0: None
                        374     LOAD_CONST                      0: None
                        376     LOAD_CONST                      0: None
                        378     PRECALL                         2
                        382     CALL                            2
                        392     POP_TOP                         
                        394     JUMP_FORWARD                    11 (to 418)
                        396     PUSH_EXC_INFO                   
                        398     WITH_EXCEPT_START               
                        400     POP_JUMP_FORWARD_IF_TRUE        4 (to 410)
                        402     RERAISE                         2
                        404     COPY                            3
                        406     POP_EXCEPT                      
                        408     RERAISE                         1
                        410     POP_TOP                         
                        412     POP_EXCEPT                      
                        414     POP_TOP                         
                        416     POP_TOP                         
                        418     LOAD_CONST                      10: 'push "'
                        420     LOAD_FAST                       2: local_index_path
                        422     FORMAT_VALUE                    0 (FVC_NONE)
                        424     LOAD_CONST                      11: '" '
                        426     LOAD_FAST                       3: remote_index_path
                        428     FORMAT_VALUE                    0 (FVC_NONE)
                        430     BUILD_STRING                    4
                        432     STORE_FAST                      8: push_command
                        434     LOAD_DEREF                      0: self
                        436     LOAD_METHOD                     6: execute_adb_commands
                        458     LOAD_FAST                       8: push_command
                        460     BUILD_LIST                      1
                        462     PRECALL                         1
                        466     CALL                            1
                        476     POP_TOP                         
                        478     LOAD_DEREF                      0: self
                        480     LOAD_ATTR                       7: thread
                        490     LOAD_ATTR                       8: output_signal
                        500     LOAD_METHOD                     9: connect
                        522     LOAD_CLOSURE                    0: self
                        524     BUILD_TUPLE                     1
                        526     LOAD_CONST                      12: <CODE> <lambda>
                        528     MAKE_FUNCTION                   8
                        530     PRECALL                         1
                        534     CALL                            1
                        544     POP_TOP                         
                        546     LOAD_CONST                      0: None
                        548     RETURN_VALUE                    
                        550     LOAD_CONST                      0: None
                        552     RETURN_VALUE                    
                        554     LOAD_DEREF                      0: self
                        556     LOAD_ATTR                       0: feedback_text
                        566     LOAD_METHOD                     1: append
                        588     LOAD_CONST                      13: 'Failed to pull index.html.'
                        590     PRECALL                         1
                        594     CALL                            1
                        604     POP_TOP                         
                        606     LOAD_CONST                      0: None
                        608     RETURN_VALUE                    
                    [Exception Table]
                        102 to 144 -> 168 [1] lasti
                        168 to 176 -> 176 [3] lasti
                        182 to 184 -> 176 [3] lasti
                        328 to 372 -> 396 [1] lasti
                        396 to 404 -> 404 [3] lasti
                        410 to 412 -> 404 [3] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: verify_index_push
                    Qualified Name: ADBTool.verify_index_push
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'feedback_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'output'
                    [Constants]
                        None
                        'Return code: 0'
                        '执行完毕，请在后台查看。'
                        '错误'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: 'Return code: 0'
                        4       LOAD_FAST                       1: output
                        6       CONTAINS_OP                     0 (in)
                        8       POP_JUMP_FORWARD_IF_FALSE       28 (to 66)
                        10      LOAD_FAST                       0: self
                        12      LOAD_ATTR                       0: feedback_text
                        22      LOAD_METHOD                     1: append
                        44      LOAD_CONST                      2: '执行完毕，请在后台查看。'
                        46      PRECALL                         1
                        50      CALL                            1
                        60      POP_TOP                         
                        62      LOAD_CONST                      0: None
                        64      RETURN_VALUE                    
                        66      LOAD_FAST                       0: self
                        68      LOAD_ATTR                       0: feedback_text
                        78      LOAD_METHOD                     1: append
                        100     LOAD_CONST                      3: '错误'
                        102     PRECALL                         1
                        106     CALL                            1
                        116     POP_TOP                         
                        118     LOAD_CONST                      0: None
                        120     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: refresh_device_status
                    Qualified Name: ADBTool.refresh_device_status
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 2
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'update_device_status'
                    [Locals+Names]
                        'self'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_METHOD                     0: update_device_status
                        26      PRECALL                         0
                        30      CALL                            0
                        40      POP_TOP                         
                        42      LOAD_CONST                      0: None
                        44      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: update_device_status
                    Qualified Name: ADBTool.update_device_status
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'scan_adb_devices'
                        'device_status_label'
                        'setText'
                        'setStyleSheet'
                    [Locals+Names]
                        'self'
                        'devices'
                    [Constants]
                        None
                        '● ADB设备已连接'
                        'color: green;'
                        '● ADB设备未连接'
                        'color: red;'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_METHOD                     0: scan_adb_devices
                        26      PRECALL                         0
                        30      CALL                            0
                        40      STORE_FAST                      1: devices
                        42      LOAD_FAST                       1: devices
                        44      POP_JUMP_FORWARD_IF_FALSE       54 (to 154)
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       1: device_status_label
                        58      LOAD_METHOD                     2: setText
                        80      LOAD_CONST                      1: '● ADB设备已连接'
                        82      PRECALL                         1
                        86      CALL                            1
                        96      POP_TOP                         
                        98      LOAD_FAST                       0: self
                        100     LOAD_ATTR                       1: device_status_label
                        110     LOAD_METHOD                     3: setStyleSheet
                        132     LOAD_CONST                      2: 'color: green;'
                        134     PRECALL                         1
                        138     CALL                            1
                        148     POP_TOP                         
                        150     LOAD_CONST                      0: None
                        152     RETURN_VALUE                    
                        154     LOAD_FAST                       0: self
                        156     LOAD_ATTR                       1: device_status_label
                        166     LOAD_METHOD                     2: setText
                        188     LOAD_CONST                      3: '● ADB设备未连接'
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_FAST                       0: self
                        208     LOAD_ATTR                       1: device_status_label
                        218     LOAD_METHOD                     3: setStyleSheet
                        240     LOAD_CONST                      4: 'color: red;'
                        242     PRECALL                         1
                        246     CALL                            1
                        256     POP_TOP                         
                        258     LOAD_CONST                      0: None
                        260     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: scan_adb_devices
                    Qualified Name: ADBTool.scan_adb_devices
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 6
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'execute_adb_command'
                        'get'
                        'feedback_text'
                        'append'
                        'splitlines'
                        'split'
                    [Locals+Names]
                        'self'
                        'commands'
                        'result'
                        'stdout'
                        'stderr'
                        'devices'
                        'line'
                    [Constants]
                        None
                        (
                            'shell'
                            'mount'
                            '-o'
                            'remount,rw'
                            '/'
                        )
                        'stdout'
                        ''
                        'stderr'
                        'Error scanning devices: '
                        '\n'
                        'devices'
                        '\tdevice'
                        '\t'
                        0
                    [Disassembly]
                        0       RESUME                          0
                        2       BUILD_LIST                      0
                        4       LOAD_CONST                      1: ('shell', 'mount', '-o', 'remount,rw', '/')
                        6       LIST_EXTEND                     1
                        8       STORE_FAST                      1: commands
                        10      LOAD_FAST                       0: self
                        12      LOAD_METHOD                     0: execute_adb_command
                        34      LOAD_FAST                       1: commands
                        36      PRECALL                         1
                        40      CALL                            1
                        50      STORE_FAST                      2: result
                        52      LOAD_FAST                       2: result
                        54      LOAD_METHOD                     1: get
                        76      LOAD_CONST                      2: 'stdout'
                        78      LOAD_CONST                      3: ''
                        80      PRECALL                         2
                        84      CALL                            2
                        94      STORE_FAST                      3: stdout
                        96      LOAD_FAST                       2: result
                        98      LOAD_METHOD                     1: get
                        120     LOAD_CONST                      4: 'stderr'
                        122     LOAD_CONST                      3: ''
                        124     PRECALL                         2
                        128     CALL                            2
                        138     STORE_FAST                      4: stderr
                        140     BUILD_LIST                      0
                        142     STORE_FAST                      5: devices
                        144     LOAD_FAST                       4: stderr
                        146     POP_JUMP_FORWARD_IF_FALSE       31 (to 210)
                        148     LOAD_FAST                       0: self
                        150     LOAD_ATTR                       2: feedback_text
                        160     LOAD_METHOD                     3: append
                        182     LOAD_CONST                      5: 'Error scanning devices: '
                        184     LOAD_FAST                       4: stderr
                        186     FORMAT_VALUE                    0 (FVC_NONE)
                        188     LOAD_CONST                      6: '\n'
                        190     BUILD_STRING                    3
                        192     PRECALL                         1
                        196     CALL                            1
                        206     POP_TOP                         
                        208     JUMP_FORWARD                    174 (to 558)
                        210     LOAD_CONST                      7: 'devices'
                        212     BUILD_LIST                      1
                        214     STORE_FAST                      1: commands
                        216     LOAD_FAST                       0: self
                        218     LOAD_METHOD                     0: execute_adb_command
                        240     LOAD_FAST                       1: commands
                        242     PRECALL                         1
                        246     CALL                            1
                        256     STORE_FAST                      2: result
                        258     LOAD_FAST                       2: result
                        260     LOAD_METHOD                     1: get
                        282     LOAD_CONST                      2: 'stdout'
                        284     LOAD_CONST                      3: ''
                        286     PRECALL                         2
                        290     CALL                            2
                        300     STORE_FAST                      3: stdout
                        302     LOAD_FAST                       2: result
                        304     LOAD_METHOD                     1: get
                        326     LOAD_CONST                      4: 'stderr'
                        328     LOAD_CONST                      3: ''
                        330     PRECALL                         2
                        334     CALL                            2
                        344     STORE_FAST                      4: stderr
                        346     LOAD_FAST                       4: stderr
                        348     POP_JUMP_FORWARD_IF_FALSE       31 (to 412)
                        350     LOAD_FAST                       0: self
                        352     LOAD_ATTR                       2: feedback_text
                        362     LOAD_METHOD                     3: append
                        384     LOAD_CONST                      5: 'Error scanning devices: '
                        386     LOAD_FAST                       4: stderr
                        388     FORMAT_VALUE                    0 (FVC_NONE)
                        390     LOAD_CONST                      6: '\n'
                        392     BUILD_STRING                    3
                        394     PRECALL                         1
                        398     CALL                            1
                        408     POP_TOP                         
                        410     JUMP_FORWARD                    73 (to 558)
                        412     LOAD_FAST                       3: stdout
                        414     LOAD_METHOD                     4: splitlines
                        436     PRECALL                         0
                        440     CALL                            0
                        450     GET_ITER                        
                        452     FOR_ITER                        52 (to 558)
                        454     STORE_FAST                      6: line
                        456     LOAD_CONST                      8: '\tdevice'
                        458     LOAD_FAST                       6: line
                        460     CONTAINS_OP                     0 (in)
                        462     POP_JUMP_FORWARD_IF_FALSE       46 (to 556)
                        464     LOAD_FAST                       5: devices
                        466     LOAD_METHOD                     3: append
                        488     LOAD_FAST                       6: line
                        490     LOAD_METHOD                     5: split
                        512     LOAD_CONST                      9: '\t'
                        514     PRECALL                         1
                        518     CALL                            1
                        528     LOAD_CONST                      10: 0
                        530     BINARY_SUBSCR                   
                        540     PRECALL                         1
                        544     CALL                            1
                        554     POP_TOP                         
                        556     JUMP_BACKWARD                   53 (to 452)
                        558     LOAD_FAST                       5: devices
                        560     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_adb_command
                    Qualified Name: ADBTool.execute_adb_command
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'subprocess'
                        'Popen'
                        'PIPE'
                        'CREATE_NO_WINDOW'
                        'communicate'
                        'strip'
                        'returncode'
                        'Exception'
                        'str'
                    [Locals+Names]
                        'self'
                        'commands'
                        'adb_path'
                        'command_with_adb'
                        'process'
                        'stdout'
                        'stderr'
                        'result'
                        'e'
                    [Constants]
                        None
                        'adb.exe'
                        '"'
                        '" '
                        ' '
                        True
                        (
                            'stdout'
                            'stderr'
                            'text'
                            'creationflags'
                        )
                        (
                            'stdout'
                            'stderr'
                            'returncode'
                        )
                        ''
                        'Exception occurred: '
                        -1
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'adb.exe'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      2: adb_path
                        76      LOAD_CONST                      2: '"'
                        78      LOAD_FAST                       2: adb_path
                        80      FORMAT_VALUE                    0 (FVC_NONE)
                        82      LOAD_CONST                      3: '" '
                        84      LOAD_CONST                      4: ' '
                        86      LOAD_METHOD                     2: join
                        108     LOAD_FAST                       1: commands
                        110     PRECALL                         1
                        114     CALL                            1
                        124     FORMAT_VALUE                    0 (FVC_NONE)
                        126     BUILD_STRING                    4
                        128     STORE_FAST                      3: command_with_adb
                        130     NOP                             
                        132     LOAD_GLOBAL                     9: NULL + subprocess
                        144     LOAD_ATTR                       5: Popen
                        154     LOAD_FAST                       3: command_with_adb
                        156     LOAD_GLOBAL                     8: subprocess
                        168     LOAD_ATTR                       6: PIPE
                        178     LOAD_GLOBAL                     8: subprocess
                        190     LOAD_ATTR                       6: PIPE
                        200     LOAD_CONST                      5: True
                        202     LOAD_GLOBAL                     8: subprocess
                        214     LOAD_ATTR                       7: CREATE_NO_WINDOW
                        224     KW_NAMES                        6: ('stdout', 'stderr', 'text', 'creationflags')
                        226     PRECALL                         5
                        230     CALL                            5
                        240     STORE_FAST                      4: process
                        242     LOAD_FAST                       4: process
                        244     LOAD_METHOD                     8: communicate
                        266     PRECALL                         0
                        270     CALL                            0
                        280     UNPACK_SEQUENCE                 2
                        284     STORE_FAST                      5: stdout
                        286     STORE_FAST                      6: stderr
                        288     LOAD_FAST                       5: stdout
                        290     LOAD_METHOD                     9: strip
                        312     PRECALL                         0
                        316     CALL                            0
                        326     LOAD_FAST                       6: stderr
                        328     LOAD_METHOD                     9: strip
                        350     PRECALL                         0
                        354     CALL                            0
                        364     LOAD_FAST                       4: process
                        366     LOAD_ATTR                       10: returncode
                        376     LOAD_CONST                      7: ('stdout', 'stderr', 'returncode')
                        378     BUILD_CONST_KEY_MAP             3
                        380     STORE_FAST                      7: result
                        382     JUMP_FORWARD                    45 (to 474)
                        384     PUSH_EXC_INFO                   
                        386     LOAD_GLOBAL                     22: Exception
                        398     CHECK_EXC_MATCH                 
                        400     POP_JUMP_FORWARD_IF_FALSE       32 (to 466)
                        402     STORE_FAST                      8: e
                        404     LOAD_CONST                      8: ''
                        406     LOAD_CONST                      9: 'Exception occurred: '
                        408     LOAD_GLOBAL                     25: NULL + str
                        420     LOAD_FAST                       8: e
                        422     PRECALL                         1
                        426     CALL                            1
                        436     FORMAT_VALUE                    0 (FVC_NONE)
                        438     BUILD_STRING                    2
                        440     LOAD_CONST                      10: -1
                        442     LOAD_CONST                      7: ('stdout', 'stderr', 'returncode')
                        444     BUILD_CONST_KEY_MAP             3
                        446     STORE_FAST                      7: result
                        448     POP_EXCEPT                      
                        450     LOAD_CONST                      0: None
                        452     STORE_FAST                      8: e
                        454     DELETE_FAST                     8: e
                        456     JUMP_FORWARD                    8 (to 474)
                        458     LOAD_CONST                      0: None
                        460     STORE_FAST                      8: e
                        462     DELETE_FAST                     8: e
                        464     RERAISE                         1
                        466     RERAISE                         0
                        468     COPY                            3
                        470     POP_EXCEPT                      
                        472     RERAISE                         1
                        474     LOAD_FAST                       7: result
                        476     RETURN_VALUE                    
                    [Exception Table]
                        132 to 382 -> 384 [0] 
                        384 to 404 -> 468 [1] lasti
                        404 to 448 -> 458 [1] lasti
                        458 to 468 -> 468 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: show_input_dialog
                    Qualified Name: ADBTool.show_input_dialog
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QInputDialog'
                        'getText'
                        'start_crawler'
                        'strip'
                        'QMessageBox'
                        'warning'
                    [Locals+Names]
                        'self'
                        'address'
                        'ok'
                    [Constants]
                        None
                        '输入'
                        '请输入后台地址:'
                        '警告'
                        '请输入有效的后台地址！'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QInputDialog
                        14      LOAD_ATTR                       1: getText
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '输入'
                        28      LOAD_CONST                      2: '请输入后台地址:'
                        30      PRECALL                         3
                        34      CALL                            3
                        44      UNPACK_SEQUENCE                 2
                        48      STORE_FAST                      1: address
                        50      STORE_FAST                      2: ok
                        52      LOAD_FAST                       2: ok
                        54      POP_JUMP_FORWARD_IF_FALSE       43 (to 142)
                        56      LOAD_FAST                       1: address
                        58      POP_JUMP_FORWARD_IF_FALSE       41 (to 142)
                        60      LOAD_FAST                       0: self
                        62      LOAD_METHOD                     2: start_crawler
                        84      LOAD_FAST                       1: address
                        86      LOAD_METHOD                     3: strip
                        108     PRECALL                         0
                        112     CALL                            0
                        122     PRECALL                         1
                        126     CALL                            1
                        136     POP_TOP                         
                        138     LOAD_CONST                      0: None
                        140     RETURN_VALUE                    
                        142     LOAD_FAST                       2: ok
                        144     POP_JUMP_FORWARD_IF_FALSE       24 (to 194)
                        146     LOAD_GLOBAL                     9: NULL + QMessageBox
                        158     LOAD_ATTR                       5: warning
                        168     LOAD_FAST                       0: self
                        170     LOAD_CONST                      3: '警告'
                        172     LOAD_CONST                      4: '请输入有效的后台地址！'
                        174     PRECALL                         3
                        178     CALL                            3
                        188     POP_TOP                         
                        190     LOAD_CONST                      0: None
                        192     RETURN_VALUE                    
                        194     LOAD_CONST                      0: None
                        196     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: start_crawler
                    Qualified Name: ADBTool.start_crawler
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 9
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'requests'
                        'get'
                        'status_code'
                        'feedback_text'
                        'append'
                        'text'
                        'Timeout'
                        'RequestException'
                    [Locals+Names]
                        'self'
                        'address'
                        'urls'
                        'timeout_seconds'
                        'url'
                        'response'
                        'e'
                    [Constants]
                        None
                        'http://'
                        '/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=2/'
                        '/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=1/'
                        '/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1'
                        1
                        (
                            'timeout'
                        )
                        200
                        '使用地址：\n'
                        '\n响应：\n'
                        '\n'
                        '\n请求失败，状态码：'
                        '请求超时，使用地址：\n'
                        '请求过程中出现错误：\n'
                        '\n使用地址：\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: 'http://'
                        4       LOAD_FAST                       1: address
                        6       FORMAT_VALUE                    0 (FVC_NONE)
                        8       LOAD_CONST                      2: '/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=2/'
                        10      BUILD_STRING                    3
                        12      LOAD_CONST                      1: 'http://'
                        14      LOAD_FAST                       1: address
                        16      FORMAT_VALUE                    0 (FVC_NONE)
                        18      LOAD_CONST                      3: '/goform/goform_set_cmd_process?goformId=SET_DEVICE_MODE&debug_enable=1/'
                        20      BUILD_STRING                    3
                        22      LOAD_CONST                      1: 'http://'
                        24      LOAD_FAST                       1: address
                        26      FORMAT_VALUE                    0 (FVC_NONE)
                        28      LOAD_CONST                      4: '/reqproc/proc_post?goformId=SET_DEVICE_MODE&debug_enable=1'
                        30      BUILD_STRING                    3
                        32      BUILD_LIST                      3
                        34      STORE_FAST                      2: urls
                        36      LOAD_CONST                      5: 1
                        38      STORE_FAST                      3: timeout_seconds
                        40      LOAD_FAST                       2: urls
                        42      GET_ITER                        
                        44      FOR_ITER                        220 (to 486)
                        46      STORE_FAST                      4: url
                        48      NOP                             
                        50      LOAD_GLOBAL                     1: NULL + requests
                        62      LOAD_ATTR                       1: get
                        72      LOAD_FAST                       4: url
                        74      LOAD_FAST                       3: timeout_seconds
                        76      KW_NAMES                        6: ('timeout',)
                        78      PRECALL                         2
                        82      CALL                            2
                        92      STORE_FAST                      5: response
                        94      LOAD_FAST                       5: response
                        96      LOAD_ATTR                       2: status_code
                        106     LOAD_CONST                      7: 200
                        108     COMPARE_OP                      2 (==)
                        114     POP_JUMP_FORWARD_IF_FALSE       39 (to 194)
                        116     LOAD_FAST                       0: self
                        118     LOAD_ATTR                       3: feedback_text
                        128     LOAD_METHOD                     4: append
                        150     LOAD_CONST                      8: '使用地址：\n'
                        152     LOAD_FAST                       4: url
                        154     FORMAT_VALUE                    0 (FVC_NONE)
                        156     LOAD_CONST                      9: '\n响应：\n'
                        158     LOAD_FAST                       5: response
                        160     LOAD_ATTR                       5: text
                        170     FORMAT_VALUE                    0 (FVC_NONE)
                        172     LOAD_CONST                      10: '\n'
                        174     BUILD_STRING                    5
                        176     PRECALL                         1
                        180     CALL                            1
                        190     POP_TOP                         
                        192     JUMP_FORWARD                    38 (to 270)
                        194     LOAD_FAST                       0: self
                        196     LOAD_ATTR                       3: feedback_text
                        206     LOAD_METHOD                     4: append
                        228     LOAD_CONST                      8: '使用地址：\n'
                        230     LOAD_FAST                       4: url
                        232     FORMAT_VALUE                    0 (FVC_NONE)
                        234     LOAD_CONST                      11: '\n请求失败，状态码：'
                        236     LOAD_FAST                       5: response
                        238     LOAD_ATTR                       2: status_code
                        248     FORMAT_VALUE                    0 (FVC_NONE)
                        250     LOAD_CONST                      10: '\n'
                        252     BUILD_STRING                    5
                        254     PRECALL                         1
                        258     CALL                            1
                        268     POP_TOP                         
                        270     JUMP_BACKWARD                   114 (to 44)
                        272     PUSH_EXC_INFO                   
                        274     LOAD_GLOBAL                     0: requests
                        286     LOAD_ATTR                       6: Timeout
                        296     CHECK_EXC_MATCH                 
                        298     POP_JUMP_FORWARD_IF_FALSE       33 (to 366)
                        300     POP_TOP                         
                        302     LOAD_FAST                       0: self
                        304     LOAD_ATTR                       3: feedback_text
                        314     LOAD_METHOD                     4: append
                        336     LOAD_CONST                      12: '请求超时，使用地址：\n'
                        338     LOAD_FAST                       4: url
                        340     FORMAT_VALUE                    0 (FVC_NONE)
                        342     LOAD_CONST                      10: '\n'
                        344     BUILD_STRING                    3
                        346     PRECALL                         1
                        350     CALL                            1
                        360     POP_TOP                         
                        362     POP_EXCEPT                      
                        364     JUMP_BACKWARD                   161 (to 44)
                        366     LOAD_GLOBAL                     0: requests
                        378     LOAD_ATTR                       7: RequestException
                        388     CHECK_EXC_MATCH                 
                        390     POP_JUMP_FORWARD_IF_FALSE       43 (to 478)
                        392     STORE_FAST                      6: e
                        394     LOAD_FAST                       0: self
                        396     LOAD_ATTR                       3: feedback_text
                        406     LOAD_METHOD                     4: append
                        428     LOAD_CONST                      13: '请求过程中出现错误：\n'
                        430     LOAD_FAST                       6: e
                        432     FORMAT_VALUE                    0 (FVC_NONE)
                        434     LOAD_CONST                      14: '\n使用地址：\n'
                        436     LOAD_FAST                       4: url
                        438     FORMAT_VALUE                    0 (FVC_NONE)
                        440     LOAD_CONST                      10: '\n'
                        442     BUILD_STRING                    5
                        444     PRECALL                         1
                        448     CALL                            1
                        458     POP_TOP                         
                        460     POP_EXCEPT                      
                        462     LOAD_CONST                      0: None
                        464     STORE_FAST                      6: e
                        466     DELETE_FAST                     6: e
                        468     JUMP_BACKWARD                   213 (to 44)
                        470     LOAD_CONST                      0: None
                        472     STORE_FAST                      6: e
                        474     DELETE_FAST                     6: e
                        476     RERAISE                         1
                        478     RERAISE                         0
                        480     COPY                            3
                        482     POP_EXCEPT                      
                        484     RERAISE                         1
                        486     LOAD_CONST                      0: None
                        488     RETURN_VALUE                    
                    [Exception Table]
                        50 to 270 -> 272 [1] 
                        272 to 362 -> 480 [2] lasti
                        366 to 394 -> 480 [2] lasti
                        394 to 460 -> 470 [2] lasti
                        470 to 480 -> 480 [2] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_stop_commands
                    Qualified Name: ADBTool.execute_stop_commands
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'execute_adb_commands'
                    [Locals+Names]
                        'self'
                        'commands'
                    [Constants]
                        None
                        (
                            'shell mount -o remount,rw /'
                            'shell nv set mqtt_host=127.0.0.1'
                            'shell nv set fota_updateMode=0'
                            'shell nv set os_url=http://127.0.0.1'
                            'shell nv set lpa_trigger_host=127.0.0.1'
                            'shell nv set safecare_hostname=http://127.0.0.1'
                            'shell nv set safecare_mobsite=http://127.0.0.1'
                            'shell nv set band_select_enable=1'
                            'shell nv set dns_manual_func_enable=1'
                            'shell nv set tr069_func_enable=1'
                            'shell nv set ussd_enable=1'
                            'shell nv set terminal_mgmt_enable=0'
                            'shell nv set nofast_port='
                            "shell nv set HOST_FIELD='Host: 127.0.0.1'"
                            'shell nv set TM_SERVER_NAME=127.0.0.1'
                            'shell nv set remo_switch_mode=0'
                            'shell rm /bin/terminal_mgmt'
                            'shell rm /bin/iccid_check'
                            'shell rm /sbin/ip_ratelimit.sh'
                            'shell rm /sbin/tc_tbf.sh'
                            'shell rm /mnt/userdata/etc_rw/nv/main/ro'
                            'shell rm /mnt/userdata/etc_rw/nv/backup/ro'
                        )
                    [Disassembly]
                        0       RESUME                          0
                        2       BUILD_LIST                      0
                        4       LOAD_CONST                      1: ('shell mount -o remount,rw /', 'shell nv set mqtt_host=127.0.0.1', 'shell nv set fota_updateMode=0', 'shell nv set os_url=http://127.0.0.1', 'shell nv set lpa_trigger_host=127.0.0.1', 'shell nv set safecare_hostname=http://127.0.0.1', 'shell nv set safecare_mobsite=http://127.0.0.1', 'shell nv set band_select_enable=1', 'shell nv set dns_manual_func_enable=1', 'shell nv set tr069_func_enable=1', 'shell nv set ussd_enable=1', 'shell nv set terminal_mgmt_enable=0', 'shell nv set nofast_port=', "shell nv set HOST_FIELD='Host: 127.0.0.1'", 'shell nv set TM_SERVER_NAME=127.0.0.1', 'shell nv set remo_switch_mode=0', 'shell rm /bin/terminal_mgmt', 'shell rm /bin/iccid_check', 'shell rm /sbin/ip_ratelimit.sh', 'shell rm /sbin/tc_tbf.sh', 'shell rm /mnt/userdata/etc_rw/nv/main/ro', 'shell rm /mnt/userdata/etc_rw/nv/backup/ro')
                        6       LIST_EXTEND                     1
                        8       STORE_FAST                      1: commands
                        10      LOAD_FAST                       0: self
                        12      LOAD_METHOD                     0: execute_adb_commands
                        34      LOAD_FAST                       1: commands
                        36      PRECALL                         1
                        40      CALL                            1
                        50      POP_TOP                         
                        52      LOAD_CONST                      0: None
                        54      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: send_requests
                    Qualified Name: ADBTool.send_requests
                    Arg Count: 3
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'base64'
                        'b64encode'
                        'encode'
                        'decode'
                        'requests'
                        'get'
                        'RequestException'
                        'post'
                    [Locals+Names]
                        'self'
                        'url_base'
                        'password'
                        'password_encoded'
                        'zero_url'
                        'first_url'
                        'second_url'
                        'third_url'
                        'first_payload'
                    [Constants]
                        None
                        'http://'
                        '/reqproc/proc_post?isTest=false&goformId=LOGIN&password='
                        '/remo/config/setting.db'
                        '/reqproc/proc_post?goformId=REMO_SIM_SELECT_R1865&isTest=false&sim_option_id=1&select_sim_mode=1'
                        '/reqproc/proc_post?goformId=REBOOT_DEVICE'
                        b'POST /remo/config/setting.db HTTP/1.1\r\nContent-Type: multipart/form-data; boundary="0ae2d29c-38de-46fc-b7cc-006047bbf031"\r\nHost: {url_base}\r\nContent-Length: 1446\r\nExpect: 100-continue\r\n\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031\r\nContent-Disposition: form-data; name="setting.db"; filename="setting.db"\r\nContent-Type: application/octet-stream\r\n\r\n#####config file######\r\nremo_web_sw_version=For_18XY\r\ncr_version=FOR_18XY\r\nfota_request_host=127.0.0.1\r\nfota_request_port=10721\r\nfota_token_rs=\r\nfota_product_id=\r\nfota_token_zx=\r\nfota_token_gs=\r\nfota_product_secret=\r\nremo_fota_request_port=10721\r\nremo_fota_request_host=127.0.0.1\r\nremo_dm_request_host=127.0.0.1\r\nremo_dm_request_port=10721\r\nremo_dm_request_path=/zte/report?\r\nremo_web_at_debug_switch=1\r\nremo_dm_report_time=60\r\nsafecare_hostname=\r\nfota_updateMode=\r\nsafecare_mobsite=\r\nfota_updateIntervalDay=\r\ntc_enable=0\r\ntc_downlink=0\r\ntc_uplink=0\r\nremo_uicc_sim_slot_info_init=3\r\nremo_uicc_auto_switch_mode=3\r\nremo_uicc_switch_mode=1\r\nremo_sim_select_display_type=1\r\njuhuoapp_enable=0\r\nremo_iot_http_get_config_host=127.0.0.1\r\nremo_iot_http_get_config_host_b1=127.0.0.1\r\nremo_iot_http_get_config_host_b2=127.0.0.1\r\nremo_iot_http_get_config_host_b3=127.0.0.1\r\nremo_iot_http_get_config_host_b4=127.0.0.1\r\nremo_iot_http_get_config_port=10721\r\nremo_iot_http_led_control_host=127.0.0.1\r\nremo_iot_http_led_control_port=10721\r\nremo_iot_http_flow_report_host=127.0.0.1\r\nremo_iot_http_flow_report_port=10721\r\nremo_iot_http_info_report_host=127.0.0.1\r\nremo_iot_http_info_report_port=10721\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031--\r\n'
                        1
                        (
                            'timeout'
                        )
                        (
                            'data'
                            'timeout'
                        )
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + base64
                        14      LOAD_ATTR                       1: b64encode
                        24      LOAD_FAST                       2: password
                        26      LOAD_METHOD                     2: encode
                        48      PRECALL                         0
                        52      CALL                            0
                        62      PRECALL                         1
                        66      CALL                            1
                        76      LOAD_METHOD                     3: decode
                        98      PRECALL                         0
                        102     CALL                            0
                        112     STORE_FAST                      3: password_encoded
                        114     LOAD_CONST                      1: 'http://'
                        116     LOAD_FAST                       1: url_base
                        118     FORMAT_VALUE                    0 (FVC_NONE)
                        120     LOAD_CONST                      2: '/reqproc/proc_post?isTest=false&goformId=LOGIN&password='
                        122     LOAD_FAST                       3: password_encoded
                        124     FORMAT_VALUE                    0 (FVC_NONE)
                        126     BUILD_STRING                    4
                        128     STORE_FAST                      4: zero_url
                        130     LOAD_CONST                      1: 'http://'
                        132     LOAD_FAST                       1: url_base
                        134     FORMAT_VALUE                    0 (FVC_NONE)
                        136     LOAD_CONST                      3: '/remo/config/setting.db'
                        138     BUILD_STRING                    3
                        140     STORE_FAST                      5: first_url
                        142     LOAD_CONST                      1: 'http://'
                        144     LOAD_FAST                       1: url_base
                        146     FORMAT_VALUE                    0 (FVC_NONE)
                        148     LOAD_CONST                      4: '/reqproc/proc_post?goformId=REMO_SIM_SELECT_R1865&isTest=false&sim_option_id=1&select_sim_mode=1'
                        150     BUILD_STRING                    3
                        152     STORE_FAST                      6: second_url
                        154     LOAD_CONST                      1: 'http://'
                        156     LOAD_FAST                       1: url_base
                        158     FORMAT_VALUE                    0 (FVC_NONE)
                        160     LOAD_CONST                      5: '/reqproc/proc_post?goformId=REBOOT_DEVICE'
                        162     BUILD_STRING                    3
                        164     STORE_FAST                      7: third_url
                        166     LOAD_CONST                      6: b'POST /remo/config/setting.db HTTP/1.1\r\nContent-Type: multipart/form-data; boundary="0ae2d29c-38de-46fc-b7cc-006047bbf031"\r\nHost: {url_base}\r\nContent-Length: 1446\r\nExpect: 100-continue\r\n\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031\r\nContent-Disposition: form-data; name="setting.db"; filename="setting.db"\r\nContent-Type: application/octet-stream\r\n\r\n#####config file######\r\nremo_web_sw_version=For_18XY\r\ncr_version=FOR_18XY\r\nfota_request_host=127.0.0.1\r\nfota_request_port=10721\r\nfota_token_rs=\r\nfota_product_id=\r\nfota_token_zx=\r\nfota_token_gs=\r\nfota_product_secret=\r\nremo_fota_request_port=10721\r\nremo_fota_request_host=127.0.0.1\r\nremo_dm_request_host=127.0.0.1\r\nremo_dm_request_port=10721\r\nremo_dm_request_path=/zte/report?\r\nremo_web_at_debug_switch=1\r\nremo_dm_report_time=60\r\nsafecare_hostname=\r\nfota_updateMode=\r\nsafecare_mobsite=\r\nfota_updateIntervalDay=\r\ntc_enable=0\r\ntc_downlink=0\r\ntc_uplink=0\r\nremo_uicc_sim_slot_info_init=3\r\nremo_uicc_auto_switch_mode=3\r\nremo_uicc_switch_mode=1\r\nremo_sim_select_display_type=1\r\njuhuoapp_enable=0\r\nremo_iot_http_get_config_host=127.0.0.1\r\nremo_iot_http_get_config_host_b1=127.0.0.1\r\nremo_iot_http_get_config_host_b2=127.0.0.1\r\nremo_iot_http_get_config_host_b3=127.0.0.1\r\nremo_iot_http_get_config_host_b4=127.0.0.1\r\nremo_iot_http_get_config_port=10721\r\nremo_iot_http_led_control_host=127.0.0.1\r\nremo_iot_http_led_control_port=10721\r\nremo_iot_http_flow_report_host=127.0.0.1\r\nremo_iot_http_flow_report_port=10721\r\nremo_iot_http_info_report_host=127.0.0.1\r\nremo_iot_http_info_report_port=10721\r\n--0ae2d29c-38de-46fc-b7cc-006047bbf031--\r\n'
                        168     STORE_FAST                      8: first_payload
                        170     NOP                             
                        172     LOAD_GLOBAL                     9: NULL + requests
                        184     LOAD_ATTR                       5: get
                        194     LOAD_FAST                       4: zero_url
                        196     LOAD_CONST                      7: 1
                        198     KW_NAMES                        8: ('timeout',)
                        200     PRECALL                         2
                        204     CALL                            2
                        214     POP_TOP                         
                        216     JUMP_FORWARD                    21 (to 260)
                        218     PUSH_EXC_INFO                   
                        220     LOAD_GLOBAL                     8: requests
                        232     LOAD_ATTR                       6: RequestException
                        242     CHECK_EXC_MATCH                 
                        244     POP_JUMP_FORWARD_IF_FALSE       3 (to 252)
                        246     POP_TOP                         
                        248     POP_EXCEPT                      
                        250     JUMP_FORWARD                    4 (to 260)
                        252     RERAISE                         0
                        254     COPY                            3
                        256     POP_EXCEPT                      
                        258     RERAISE                         1
                        260     NOP                             
                        262     LOAD_GLOBAL                     9: NULL + requests
                        274     LOAD_ATTR                       7: post
                        284     LOAD_FAST                       5: first_url
                        286     LOAD_FAST                       8: first_payload
                        288     LOAD_CONST                      7: 1
                        290     KW_NAMES                        9: ('data', 'timeout')
                        292     PRECALL                         3
                        296     CALL                            3
                        306     POP_TOP                         
                        308     JUMP_FORWARD                    21 (to 352)
                        310     PUSH_EXC_INFO                   
                        312     LOAD_GLOBAL                     8: requests
                        324     LOAD_ATTR                       6: RequestException
                        334     CHECK_EXC_MATCH                 
                        336     POP_JUMP_FORWARD_IF_FALSE       3 (to 344)
                        338     POP_TOP                         
                        340     POP_EXCEPT                      
                        342     JUMP_FORWARD                    4 (to 352)
                        344     RERAISE                         0
                        346     COPY                            3
                        348     POP_EXCEPT                      
                        350     RERAISE                         1
                        352     NOP                             
                        354     LOAD_GLOBAL                     9: NULL + requests
                        366     LOAD_ATTR                       5: get
                        376     LOAD_FAST                       6: second_url
                        378     LOAD_CONST                      7: 1
                        380     KW_NAMES                        8: ('timeout',)
                        382     PRECALL                         2
                        386     CALL                            2
                        396     POP_TOP                         
                        398     JUMP_FORWARD                    21 (to 442)
                        400     PUSH_EXC_INFO                   
                        402     LOAD_GLOBAL                     8: requests
                        414     LOAD_ATTR                       6: RequestException
                        424     CHECK_EXC_MATCH                 
                        426     POP_JUMP_FORWARD_IF_FALSE       3 (to 434)
                        428     POP_TOP                         
                        430     POP_EXCEPT                      
                        432     JUMP_FORWARD                    4 (to 442)
                        434     RERAISE                         0
                        436     COPY                            3
                        438     POP_EXCEPT                      
                        440     RERAISE                         1
                        442     NOP                             
                        444     LOAD_GLOBAL                     9: NULL + requests
                        456     LOAD_ATTR                       5: get
                        466     LOAD_FAST                       7: third_url
                        468     LOAD_CONST                      7: 1
                        470     KW_NAMES                        8: ('timeout',)
                        472     PRECALL                         2
                        476     CALL                            2
                        486     POP_TOP                         
                        488     LOAD_CONST                      0: None
                        490     RETURN_VALUE                    
                        492     PUSH_EXC_INFO                   
                        494     LOAD_GLOBAL                     8: requests
                        506     LOAD_ATTR                       6: RequestException
                        516     CHECK_EXC_MATCH                 
                        518     POP_JUMP_FORWARD_IF_FALSE       4 (to 528)
                        520     POP_TOP                         
                        522     POP_EXCEPT                      
                        524     LOAD_CONST                      0: None
                        526     RETURN_VALUE                    
                        528     RERAISE                         0
                        530     COPY                            3
                        532     POP_EXCEPT                      
                        534     RERAISE                         1
                    [Exception Table]
                        172 to 216 -> 218 [0] 
                        218 to 248 -> 254 [1] lasti
                        252 to 254 -> 254 [1] lasti
                        262 to 308 -> 310 [0] 
                        310 to 340 -> 346 [1] lasti
                        344 to 346 -> 346 [1] lasti
                        354 to 398 -> 400 [0] 
                        400 to 430 -> 436 [1] lasti
                        434 to 436 -> 436 [1] lasti
                        444 to 488 -> 492 [0] 
                        492 to 522 -> 530 [1] lasti
                        528 to 530 -> 530 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_tasks
                    Qualified Name: ADBTool.execute_tasks
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QInputDialog'
                        'getText'
                        'send_requests'
                        'QMessageBox'
                        'information'
                    [Locals+Names]
                        'self'
                        'url_base'
                        'ok'
                        'password'
                    [Constants]
                        None
                        '输入'
                        '请输入后台地址:'
                        '请输入密码:'
                        '完成'
                        '执行完毕，请自行测试。'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QInputDialog
                        14      LOAD_ATTR                       1: getText
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '输入'
                        28      LOAD_CONST                      2: '请输入后台地址:'
                        30      PRECALL                         3
                        34      CALL                            3
                        44      UNPACK_SEQUENCE                 2
                        48      STORE_FAST                      1: url_base
                        50      STORE_FAST                      2: ok
                        52      LOAD_FAST                       2: ok
                        54      POP_JUMP_FORWARD_IF_FALSE       2 (to 60)
                        56      LOAD_FAST                       1: url_base
                        58      POP_JUMP_FORWARD_IF_TRUE        2 (to 64)
                        60      LOAD_CONST                      0: None
                        62      RETURN_VALUE                    
                        64      LOAD_GLOBAL                     1: NULL + QInputDialog
                        76      LOAD_ATTR                       1: getText
                        86      LOAD_FAST                       0: self
                        88      LOAD_CONST                      1: '输入'
                        90      LOAD_CONST                      3: '请输入密码:'
                        92      PRECALL                         3
                        96      CALL                            3
                        106     UNPACK_SEQUENCE                 2
                        110     STORE_FAST                      3: password
                        112     STORE_FAST                      2: ok
                        114     LOAD_FAST                       2: ok
                        116     POP_JUMP_FORWARD_IF_FALSE       48 (to 214)
                        118     LOAD_FAST                       3: password
                        120     POP_JUMP_FORWARD_IF_FALSE       48 (to 218)
                        122     LOAD_FAST                       0: self
                        124     LOAD_METHOD                     2: send_requests
                        146     LOAD_FAST                       1: url_base
                        148     LOAD_FAST                       3: password
                        150     PRECALL                         2
                        154     CALL                            2
                        164     POP_TOP                         
                        166     LOAD_GLOBAL                     7: NULL + QMessageBox
                        178     LOAD_ATTR                       4: information
                        188     LOAD_FAST                       0: self
                        190     LOAD_CONST                      4: '完成'
                        192     LOAD_CONST                      5: '执行完毕，请自行测试。'
                        194     PRECALL                         3
                        198     CALL                            3
                        208     POP_TOP                         
                        210     LOAD_CONST                      0: None
                        212     RETURN_VALUE                    
                        214     LOAD_CONST                      0: None
                        216     RETURN_VALUE                    
                        218     LOAD_CONST                      0: None
                        220     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: send_imei
                    Qualified Name: ADBTool.send_imei
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QInputDialog'
                        'getText'
                        'base64'
                        'b64encode'
                        'encode'
                        'decode'
                        'requests'
                        'get'
                        'status_code'
                        'feedback_text'
                        'append'
                        'text'
                        'RequestException'
                        'QMessageBox'
                        'information'
                    [Locals+Names]
                        'self'
                        'url_base'
                        'ok'
                        'password'
                        'password_encoded'
                        'imei'
                        'login_url'
                        'send_imei_url'
                        'reboot_url'
                        'login_response'
                        'imei_response'
                        'reboot_response'
                        'e'
                    [Constants]
                        None
                        '输入'
                        '输入后台地址:'
                        '请输入密码:'
                        '输入川号:'
                        'http://'
                        '/reqproc/proc_post?isTest=false&goformId=LOGIN&password='
                        '/reqproc/proc_post?goformId=ID_SENDAT&at_str_data=AT+MODIMEI='
                        '/reqproc/proc_post?goformId=REBOOT_DEVICE'
                        1
                        (
                            'timeout'
                        )
                        200
                        '登录成功: '
                        '\n响应: '
                        '\n'
                        '发送IMEI成功: '
                        '发送IMEI失败, 状态码: '
                        '登录失败, 状态码: '
                        '完成'
                        '执行完毕，重启后请在后台查看。'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QInputDialog
                        14      LOAD_ATTR                       1: getText
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '输入'
                        28      LOAD_CONST                      2: '输入后台地址:'
                        30      PRECALL                         3
                        34      CALL                            3
                        44      UNPACK_SEQUENCE                 2
                        48      STORE_FAST                      1: url_base
                        50      STORE_FAST                      2: ok
                        52      LOAD_FAST                       2: ok
                        54      POP_JUMP_FORWARD_IF_FALSE       2 (to 60)
                        56      LOAD_FAST                       1: url_base
                        58      POP_JUMP_FORWARD_IF_TRUE        2 (to 64)
                        60      LOAD_CONST                      0: None
                        62      RETURN_VALUE                    
                        64      LOAD_GLOBAL                     1: NULL + QInputDialog
                        76      LOAD_ATTR                       1: getText
                        86      LOAD_FAST                       0: self
                        88      LOAD_CONST                      1: '输入'
                        90      LOAD_CONST                      3: '请输入密码:'
                        92      PRECALL                         3
                        96      CALL                            3
                        106     UNPACK_SEQUENCE                 2
                        110     STORE_FAST                      3: password
                        112     STORE_FAST                      2: ok
                        114     LOAD_FAST                       2: ok
                        116     POP_JUMP_FORWARD_IF_FALSE       2 (to 122)
                        118     LOAD_FAST                       3: password
                        120     POP_JUMP_FORWARD_IF_TRUE        2 (to 126)
                        122     LOAD_CONST                      0: None
                        124     RETURN_VALUE                    
                        126     LOAD_GLOBAL                     5: NULL + base64
                        138     LOAD_ATTR                       3: b64encode
                        148     LOAD_FAST                       3: password
                        150     LOAD_METHOD                     4: encode
                        172     PRECALL                         0
                        176     CALL                            0
                        186     PRECALL                         1
                        190     CALL                            1
                        200     LOAD_METHOD                     5: decode
                        222     PRECALL                         0
                        226     CALL                            0
                        236     STORE_FAST                      4: password_encoded
                        238     LOAD_GLOBAL                     1: NULL + QInputDialog
                        250     LOAD_ATTR                       1: getText
                        260     LOAD_FAST                       0: self
                        262     LOAD_CONST                      1: '输入'
                        264     LOAD_CONST                      4: '输入川号:'
                        266     PRECALL                         3
                        270     CALL                            3
                        280     UNPACK_SEQUENCE                 2
                        284     STORE_FAST                      5: imei
                        286     STORE_FAST                      2: ok
                        288     LOAD_FAST                       2: ok
                        290     POP_JUMP_FORWARD_IF_FALSE       2 (to 296)
                        292     LOAD_FAST                       5: imei
                        294     POP_JUMP_FORWARD_IF_TRUE        2 (to 300)
                        296     LOAD_CONST                      0: None
                        298     RETURN_VALUE                    
                        300     LOAD_CONST                      5: 'http://'
                        302     LOAD_FAST                       1: url_base
                        304     FORMAT_VALUE                    0 (FVC_NONE)
                        306     LOAD_CONST                      6: '/reqproc/proc_post?isTest=false&goformId=LOGIN&password='
                        308     LOAD_FAST                       4: password_encoded
                        310     FORMAT_VALUE                    0 (FVC_NONE)
                        312     BUILD_STRING                    4
                        314     STORE_FAST                      6: login_url
                        316     LOAD_CONST                      5: 'http://'
                        318     LOAD_FAST                       1: url_base
                        320     FORMAT_VALUE                    0 (FVC_NONE)
                        322     LOAD_CONST                      7: '/reqproc/proc_post?goformId=ID_SENDAT&at_str_data=AT+MODIMEI='
                        324     LOAD_FAST                       5: imei
                        326     FORMAT_VALUE                    0 (FVC_NONE)
                        328     BUILD_STRING                    4
                        330     STORE_FAST                      7: send_imei_url
                        332     LOAD_CONST                      5: 'http://'
                        334     LOAD_FAST                       1: url_base
                        336     FORMAT_VALUE                    0 (FVC_NONE)
                        338     LOAD_CONST                      8: '/reqproc/proc_post?goformId=REBOOT_DEVICE'
                        340     BUILD_STRING                    3
                        342     STORE_FAST                      8: reboot_url
                        344     NOP                             
                        346     LOAD_GLOBAL                     13: NULL + requests
                        358     LOAD_ATTR                       7: get
                        368     LOAD_FAST                       6: login_url
                        370     LOAD_CONST                      9: 1
                        372     KW_NAMES                        10: ('timeout',)
                        374     PRECALL                         2
                        378     CALL                            2
                        388     STORE_FAST                      9: login_response
                        390     LOAD_FAST                       9: login_response
                        392     LOAD_ATTR                       8: status_code
                        402     LOAD_CONST                      11: 200
                        404     COMPARE_OP                      2 (==)
                        410     POP_JUMP_FORWARD_IF_FALSE       176 (to 764)
                        412     LOAD_FAST                       0: self
                        414     LOAD_ATTR                       9: feedback_text
                        424     LOAD_METHOD                     10: append
                        446     LOAD_CONST                      12: '登录成功: '
                        448     LOAD_FAST                       6: login_url
                        450     FORMAT_VALUE                    0 (FVC_NONE)
                        452     LOAD_CONST                      13: '\n响应: '
                        454     LOAD_FAST                       9: login_response
                        456     LOAD_ATTR                       11: text
                        466     FORMAT_VALUE                    0 (FVC_NONE)
                        468     LOAD_CONST                      14: '\n'
                        470     BUILD_STRING                    5
                        472     PRECALL                         1
                        476     CALL                            1
                        486     POP_TOP                         
                        488     LOAD_GLOBAL                     13: NULL + requests
                        500     LOAD_ATTR                       7: get
                        510     LOAD_FAST                       7: send_imei_url
                        512     LOAD_CONST                      9: 1
                        514     KW_NAMES                        10: ('timeout',)
                        516     PRECALL                         2
                        520     CALL                            2
                        530     STORE_FAST                      10: imei_response
                        532     LOAD_FAST                       10: imei_response
                        534     LOAD_ATTR                       8: status_code
                        544     LOAD_CONST                      11: 200
                        546     COMPARE_OP                      2 (==)
                        552     POP_JUMP_FORWARD_IF_FALSE       39 (to 632)
                        554     LOAD_FAST                       0: self
                        556     LOAD_ATTR                       9: feedback_text
                        566     LOAD_METHOD                     10: append
                        588     LOAD_CONST                      15: '发送IMEI成功: '
                        590     LOAD_FAST                       7: send_imei_url
                        592     FORMAT_VALUE                    0 (FVC_NONE)
                        594     LOAD_CONST                      13: '\n响应: '
                        596     LOAD_FAST                       10: imei_response
                        598     LOAD_ATTR                       11: text
                        608     FORMAT_VALUE                    0 (FVC_NONE)
                        610     LOAD_CONST                      14: '\n'
                        612     BUILD_STRING                    5
                        614     PRECALL                         1
                        618     CALL                            1
                        628     POP_TOP                         
                        630     JUMP_FORWARD                    43 (to 718)
                        632     LOAD_FAST                       0: self
                        634     LOAD_ATTR                       9: feedback_text
                        644     LOAD_METHOD                     10: append
                        666     LOAD_CONST                      16: '发送IMEI失败, 状态码: '
                        668     LOAD_FAST                       10: imei_response
                        670     LOAD_ATTR                       8: status_code
                        680     FORMAT_VALUE                    0 (FVC_NONE)
                        682     LOAD_CONST                      13: '\n响应: '
                        684     LOAD_FAST                       10: imei_response
                        686     LOAD_ATTR                       11: text
                        696     FORMAT_VALUE                    0 (FVC_NONE)
                        698     LOAD_CONST                      14: '\n'
                        700     BUILD_STRING                    5
                        702     PRECALL                         1
                        706     CALL                            1
                        716     POP_TOP                         
                        718     LOAD_GLOBAL                     13: NULL + requests
                        730     LOAD_ATTR                       7: get
                        740     LOAD_FAST                       8: reboot_url
                        742     LOAD_CONST                      9: 1
                        744     KW_NAMES                        10: ('timeout',)
                        746     PRECALL                         2
                        750     CALL                            2
                        760     STORE_FAST                      11: reboot_response
                        762     JUMP_FORWARD                    43 (to 850)
                        764     LOAD_FAST                       0: self
                        766     LOAD_ATTR                       9: feedback_text
                        776     LOAD_METHOD                     10: append
                        798     LOAD_CONST                      17: '登录失败, 状态码: '
                        800     LOAD_FAST                       9: login_response
                        802     LOAD_ATTR                       8: status_code
                        812     FORMAT_VALUE                    0 (FVC_NONE)
                        814     LOAD_CONST                      13: '\n响应: '
                        816     LOAD_FAST                       9: login_response
                        818     LOAD_ATTR                       11: text
                        828     FORMAT_VALUE                    0 (FVC_NONE)
                        830     LOAD_CONST                      14: '\n'
                        832     BUILD_STRING                    5
                        834     PRECALL                         1
                        838     CALL                            1
                        848     POP_TOP                         
                        850     JUMP_FORWARD                    28 (to 908)
                        852     PUSH_EXC_INFO                   
                        854     LOAD_GLOBAL                     12: requests
                        866     LOAD_ATTR                       12: RequestException
                        876     CHECK_EXC_MATCH                 
                        878     POP_JUMP_FORWARD_IF_FALSE       10 (to 900)
                        880     STORE_FAST                      12: e
                        882     POP_EXCEPT                      
                        884     LOAD_CONST                      0: None
                        886     STORE_FAST                      12: e
                        888     DELETE_FAST                     12: e
                        890     JUMP_FORWARD                    8 (to 908)
                        892     LOAD_CONST                      0: None
                        894     STORE_FAST                      12: e
                        896     DELETE_FAST                     12: e
                        898     RERAISE                         1
                        900     RERAISE                         0
                        902     COPY                            3
                        904     POP_EXCEPT                      
                        906     RERAISE                         1
                        908     LOAD_GLOBAL                     27: NULL + QMessageBox
                        920     LOAD_ATTR                       14: information
                        930     LOAD_FAST                       0: self
                        932     LOAD_CONST                      18: '完成'
                        934     LOAD_CONST                      19: '执行完毕，重启后请在后台查看。'
                        936     PRECALL                         3
                        940     CALL                            3
                        950     POP_TOP                         
                        952     LOAD_CONST                      0: None
                        954     RETURN_VALUE                    
                    [Exception Table]
                        346 to 850 -> 852 [0] 
                        852 to 882 -> 902 [1] lasti
                        892 to 902 -> 902 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_web_command
                    Qualified Name: ADBTool.execute_web_command
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 8
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QMessageBox'
                        'information'
                        'setWindowTitle'
                        'setText'
                        'setIcon'
                        'Question'
                        'setWindowIcon'
                        'QIcon'
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'addButton'
                        'ActionRole'
                        'Cancel'
                        'exec_'
                        'clickedButton'
                        'execute_weby_command'
                        'CommandDialog'
                        'directory_path'
                        'operation'
                        'execute_adb_commands'
                        'feedback_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'msg_box'
                        'button_a'
                        'button_b'
                        'cancel_button'
                        'ret'
                        'dialog'
                        'directory_path'
                        'operation'
                        'source_folder'
                        'sourcefolder'
                        'source_folder_'
                        'commands'
                    [Constants]
                        None
                        '提示'
                        '一键全功能需要是原后台。'
                        '选择'
                        '选择需要的操作：'
                        'u.ico'
                        '一键全功能'
                        '备份/刷入'
                        '/etc_ro/web'
                        '/etc_ro/web.zip'
                        '/etc_ro/'
                        'Backup'
                        'shell mount -o remount,rw /'
                        'pull '
                        ' '
                        'Loading'
                        'shell rm -rf '
                        'push '
                        '用户取消了操作\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QMessageBox
                        14      LOAD_ATTR                       1: information
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '提示'
                        28      LOAD_CONST                      2: '一键全功能需要是原后台。'
                        30      PRECALL                         3
                        34      CALL                            3
                        44      POP_TOP                         
                        46      LOAD_GLOBAL                     1: NULL + QMessageBox
                        58      PRECALL                         0
                        62      CALL                            0
                        72      STORE_FAST                      1: msg_box
                        74      LOAD_FAST                       1: msg_box
                        76      LOAD_METHOD                     2: setWindowTitle
                        98      LOAD_CONST                      3: '选择'
                        100     PRECALL                         1
                        104     CALL                            1
                        114     POP_TOP                         
                        116     LOAD_FAST                       1: msg_box
                        118     LOAD_METHOD                     3: setText
                        140     LOAD_CONST                      4: '选择需要的操作：'
                        142     PRECALL                         1
                        146     CALL                            1
                        156     POP_TOP                         
                        158     LOAD_FAST                       1: msg_box
                        160     LOAD_METHOD                     4: setIcon
                        182     LOAD_GLOBAL                     0: QMessageBox
                        194     LOAD_ATTR                       5: Question
                        204     PRECALL                         1
                        208     CALL                            1
                        218     POP_TOP                         
                        220     LOAD_FAST                       1: msg_box
                        222     LOAD_METHOD                     6: setWindowIcon
                        244     LOAD_GLOBAL                     15: NULL + QIcon
                        256     LOAD_GLOBAL                     16: os
                        268     LOAD_ATTR                       9: path
                        278     LOAD_METHOD                     10: join
                        300     LOAD_FAST                       0: self
                        302     LOAD_ATTR                       11: script_directory
                        312     LOAD_CONST                      5: 'u.ico'
                        314     PRECALL                         2
                        318     CALL                            2
                        328     PRECALL                         1
                        332     CALL                            1
                        342     PRECALL                         1
                        346     CALL                            1
                        356     POP_TOP                         
                        358     LOAD_FAST                       1: msg_box
                        360     LOAD_METHOD                     12: addButton
                        382     LOAD_CONST                      6: '一键全功能'
                        384     LOAD_GLOBAL                     0: QMessageBox
                        396     LOAD_ATTR                       13: ActionRole
                        406     PRECALL                         2
                        410     CALL                            2
                        420     STORE_FAST                      2: button_a
                        422     LOAD_FAST                       1: msg_box
                        424     LOAD_METHOD                     12: addButton
                        446     LOAD_CONST                      7: '备份/刷入'
                        448     LOAD_GLOBAL                     0: QMessageBox
                        460     LOAD_ATTR                       13: ActionRole
                        470     PRECALL                         2
                        474     CALL                            2
                        484     STORE_FAST                      3: button_b
                        486     LOAD_FAST                       1: msg_box
                        488     LOAD_METHOD                     12: addButton
                        510     LOAD_GLOBAL                     0: QMessageBox
                        522     LOAD_ATTR                       14: Cancel
                        532     PRECALL                         1
                        536     CALL                            1
                        546     STORE_FAST                      4: cancel_button
                        548     LOAD_FAST                       1: msg_box
                        550     LOAD_METHOD                     15: exec_
                        572     PRECALL                         0
                        576     CALL                            0
                        586     STORE_FAST                      5: ret
                        588     LOAD_FAST                       1: msg_box
                        590     LOAD_METHOD                     16: clickedButton
                        612     PRECALL                         0
                        616     CALL                            0
                        626     LOAD_FAST                       2: button_a
                        628     COMPARE_OP                      2 (==)
                        634     POP_JUMP_FORWARD_IF_FALSE       22 (to 680)
                        636     LOAD_FAST                       0: self
                        638     LOAD_METHOD                     17: execute_weby_command
                        660     PRECALL                         0
                        664     CALL                            0
                        674     POP_TOP                         
                        676     LOAD_CONST                      0: None
                        678     RETURN_VALUE                    
                        680     LOAD_FAST                       1: msg_box
                        682     LOAD_METHOD                     16: clickedButton
                        704     PRECALL                         0
                        708     CALL                            0
                        718     LOAD_FAST                       3: button_b
                        720     COMPARE_OP                      2 (==)
                        726     POP_JUMP_FORWARD_IF_FALSE       174 (to 1076)
                        728     LOAD_GLOBAL                     37: NULL + CommandDialog
                        740     LOAD_FAST                       0: self
                        742     PRECALL                         1
                        746     CALL                            1
                        756     STORE_FAST                      6: dialog
                        758     LOAD_FAST                       6: dialog
                        760     LOAD_METHOD                     15: exec_
                        782     PRECALL                         0
                        786     CALL                            0
                        796     POP_JUMP_FORWARD_IF_FALSE       111 (to 1020)
                        798     LOAD_FAST                       6: dialog
                        800     LOAD_ATTR                       19: directory_path
                        810     STORE_FAST                      7: directory_path
                        812     LOAD_FAST                       6: dialog
                        814     LOAD_ATTR                       20: operation
                        824     STORE_FAST                      8: operation
                        826     LOAD_CONST                      8: '/etc_ro/web'
                        828     STORE_FAST                      9: source_folder
                        830     LOAD_CONST                      9: '/etc_ro/web.zip'
                        832     STORE_FAST                      10: sourcefolder
                        834     LOAD_CONST                      10: '/etc_ro/'
                        836     STORE_FAST                      11: source_folder_
                        838     LOAD_FAST                       8: operation
                        840     LOAD_CONST                      11: 'Backup'
                        842     COMPARE_OP                      2 (==)
                        848     POP_JUMP_FORWARD_IF_FALSE       40 (to 930)
                        850     LOAD_CONST                      12: 'shell mount -o remount,rw /'
                        852     LOAD_CONST                      13: 'pull '
                        854     LOAD_FAST                       9: source_folder
                        856     FORMAT_VALUE                    0 (FVC_NONE)
                        858     LOAD_CONST                      14: ' '
                        860     LOAD_FAST                       7: directory_path
                        862     FORMAT_VALUE                    0 (FVC_NONE)
                        864     BUILD_STRING                    4
                        866     LOAD_CONST                      13: 'pull '
                        868     LOAD_FAST                       10: sourcefolder
                        870     FORMAT_VALUE                    0 (FVC_NONE)
                        872     LOAD_CONST                      14: ' '
                        874     LOAD_FAST                       7: directory_path
                        876     FORMAT_VALUE                    0 (FVC_NONE)
                        878     BUILD_STRING                    4
                        880     BUILD_LIST                      3
                        882     STORE_FAST                      12: commands
                        884     LOAD_FAST                       0: self
                        886     LOAD_METHOD                     21: execute_adb_commands
                        908     LOAD_FAST                       12: commands
                        910     PRECALL                         1
                        914     CALL                            1
                        924     POP_TOP                         
                        926     LOAD_CONST                      0: None
                        928     RETURN_VALUE                    
                        930     LOAD_FAST                       8: operation
                        932     LOAD_CONST                      15: 'Loading'
                        934     COMPARE_OP                      2 (==)
                        940     POP_JUMP_FORWARD_IF_FALSE       37 (to 1016)
                        942     LOAD_CONST                      12: 'shell mount -o remount,rw /'
                        944     LOAD_CONST                      16: 'shell rm -rf '
                        946     LOAD_FAST                       9: source_folder
                        948     FORMAT_VALUE                    0 (FVC_NONE)
                        950     BUILD_STRING                    2
                        952     LOAD_CONST                      17: 'push '
                        954     LOAD_FAST                       7: directory_path
                        956     FORMAT_VALUE                    0 (FVC_NONE)
                        958     LOAD_CONST                      14: ' '
                        960     LOAD_FAST                       11: source_folder_
                        962     FORMAT_VALUE                    0 (FVC_NONE)
                        964     BUILD_STRING                    4
                        966     BUILD_LIST                      3
                        968     STORE_FAST                      12: commands
                        970     LOAD_FAST                       0: self
                        972     LOAD_METHOD                     21: execute_adb_commands
                        994     LOAD_FAST                       12: commands
                        996     PRECALL                         1
                        1000    CALL                            1
                        1010    POP_TOP                         
                        1012    LOAD_CONST                      0: None
                        1014    RETURN_VALUE                    
                        1016    LOAD_CONST                      0: None
                        1018    RETURN_VALUE                    
                        1020    LOAD_FAST                       0: self
                        1022    LOAD_ATTR                       22: feedback_text
                        1032    LOAD_METHOD                     23: append
                        1054    LOAD_CONST                      18: '用户取消了操作\n'
                        1056    PRECALL                         1
                        1060    CALL                            1
                        1070    POP_TOP                         
                        1072    LOAD_CONST                      0: None
                        1074    RETURN_VALUE                    
                        1076    LOAD_FAST                       0: self
                        1078    LOAD_ATTR                       22: feedback_text
                        1088    LOAD_METHOD                     23: append
                        1110    LOAD_CONST                      18: '用户取消了操作\n'
                        1112    PRECALL                         1
                        1116    CALL                            1
                        1126    POP_TOP                         
                        1128    LOAD_CONST                      0: None
                        1130    RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_mtd_commands
                    Qualified Name: ADBTool.execute_mtd_commands
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QFileDialog'
                        'getExistingDirectory'
                        'feedback_text'
                        'append'
                        'directory_path'
                        'execute_adb_commands'
                        'thread'
                        'output_signal'
                        'connect'
                        'process_mtd_output'
                    [Locals+Names]
                        'self'
                        'directory_path'
                        'commands'
                    [Constants]
                        None
                        '选择存储文件的文件夹'
                        '用户取消了操作。\n'
                        'shell cat /proc/mtd'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QFileDialog
                        14      LOAD_ATTR                       1: getExistingDirectory
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '选择存储文件的文件夹'
                        28      PRECALL                         2
                        32      CALL                            2
                        42      STORE_FAST                      1: directory_path
                        44      LOAD_FAST                       1: directory_path
                        46      POP_JUMP_FORWARD_IF_TRUE        28 (to 104)
                        48      LOAD_FAST                       0: self
                        50      LOAD_ATTR                       2: feedback_text
                        60      LOAD_METHOD                     3: append
                        82      LOAD_CONST                      2: '用户取消了操作。\n'
                        84      PRECALL                         1
                        88      CALL                            1
                        98      POP_TOP                         
                        100     LOAD_CONST                      0: None
                        102     RETURN_VALUE                    
                        104     LOAD_FAST                       1: directory_path
                        106     LOAD_FAST                       0: self
                        108     STORE_ATTR                      4: directory_path
                        118     LOAD_CONST                      3: 'shell cat /proc/mtd'
                        120     BUILD_LIST                      1
                        122     STORE_FAST                      2: commands
                        124     LOAD_FAST                       0: self
                        126     LOAD_METHOD                     5: execute_adb_commands
                        148     LOAD_FAST                       2: commands
                        150     PRECALL                         1
                        154     CALL                            1
                        164     POP_TOP                         
                        166     LOAD_FAST                       0: self
                        168     LOAD_ATTR                       6: thread
                        178     LOAD_ATTR                       7: output_signal
                        188     LOAD_METHOD                     8: connect
                        210     LOAD_FAST                       0: self
                        212     LOAD_ATTR                       9: process_mtd_output
                        222     PRECALL                         1
                        226     CALL                            1
                        236     POP_TOP                         
                        238     LOAD_CONST                      0: None
                        240     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: process_mtd_output
                    Qualified Name: ADBTool.process_mtd_output
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'feedback_text'
                        'append'
                        'splitlines'
                        'execute_adb_commands'
                        'thread'
                        'output_signal'
                        'connect'
                    [Locals+Names]
                        'self'
                        'output'
                        'mtd_partitions'
                    [Constants]
                        None
                        'Error'
                        '读取 /proc/mtd 失败: '
                        '\n'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <listcomp>
                            Qualified Name: ADBTool.process_mtd_output.<locals>.<listcomp>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 5
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'startswith'
                                'split'
                                'strip'
                            [Locals+Names]
                                '.0'
                                'line'
                            [Constants]
                                'mtd'
                                ':'
                                0
                            [Disassembly]
                                0       RESUME                          0
                                2       BUILD_LIST                      0
                                4       LOAD_FAST                       0: .0
                                6       FOR_ITER                        68 (to 144)
                                8       STORE_FAST                      1: line
                                10      LOAD_FAST                       1: line
                                12      LOAD_METHOD                     0: startswith
                                34      LOAD_CONST                      0: 'mtd'
                                36      PRECALL                         1
                                40      CALL                            1
                                50      POP_JUMP_BACKWARD_IF_FALSE      23 (to 6)
                                52      LOAD_FAST                       1: line
                                54      LOAD_METHOD                     1: split
                                76      LOAD_CONST                      1: ':'
                                78      PRECALL                         1
                                82      CALL                            1
                                92      LOAD_CONST                      2: 0
                                94      BINARY_SUBSCR                   
                                104     LOAD_METHOD                     2: strip
                                126     PRECALL                         0
                                130     CALL                            0
                                140     LIST_APPEND                     2
                                142     JUMP_BACKWARD                   69 (to 6)
                                144     RETURN_VALUE                    
                            [Exception Table]
                        '未找到 mtd 分区。\n'
                        'shell mount -o remount,rw /'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ADBTool.process_mtd_output.<locals>.<lambda>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'pull_mtd_partitions'
                            [Locals+Names]
                                '_'
                                'mtd_partitions'
                                'self'
                            [Constants]
                                None
                            [Disassembly]
                                0       COPY_FREE_VARS                  2
                                2       RESUME                          0
                                4       LOAD_DEREF                      2: self
                                6       LOAD_METHOD                     0: pull_mtd_partitions
                                28      LOAD_DEREF                      1: mtd_partitions
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       MAKE_CELL                       0: self
                        2       MAKE_CELL                       2: mtd_partitions
                        4       RESUME                          0
                        6       LOAD_CONST                      1: 'Error'
                        8       LOAD_FAST                       1: output
                        10      CONTAINS_OP                     0 (in)
                        12      POP_JUMP_FORWARD_IF_FALSE       32 (to 78)
                        14      LOAD_DEREF                      0: self
                        16      LOAD_ATTR                       0: feedback_text
                        26      LOAD_METHOD                     1: append
                        48      LOAD_CONST                      2: '读取 /proc/mtd 失败: '
                        50      LOAD_FAST                       1: output
                        52      FORMAT_VALUE                    0 (FVC_NONE)
                        54      LOAD_CONST                      3: '\n'
                        56      BUILD_STRING                    3
                        58      PRECALL                         1
                        62      CALL                            1
                        72      POP_TOP                         
                        74      LOAD_CONST                      0: None
                        76      RETURN_VALUE                    
                        78      LOAD_CONST                      4: <CODE> <listcomp>
                        80      MAKE_FUNCTION                   0
                        82      LOAD_FAST                       1: output
                        84      LOAD_METHOD                     2: splitlines
                        106     PRECALL                         0
                        110     CALL                            0
                        120     GET_ITER                        
                        122     PRECALL                         0
                        126     CALL                            0
                        136     STORE_DEREF                     2: mtd_partitions
                        138     LOAD_DEREF                      2: mtd_partitions
                        140     POP_JUMP_FORWARD_IF_TRUE        28 (to 198)
                        142     LOAD_DEREF                      0: self
                        144     LOAD_ATTR                       0: feedback_text
                        154     LOAD_METHOD                     1: append
                        176     LOAD_CONST                      5: '未找到 mtd 分区。\n'
                        178     PRECALL                         1
                        182     CALL                            1
                        192     POP_TOP                         
                        194     LOAD_CONST                      0: None
                        196     RETURN_VALUE                    
                        198     LOAD_DEREF                      0: self
                        200     LOAD_METHOD                     3: execute_adb_commands
                        222     LOAD_CONST                      6: 'shell mount -o remount,rw /'
                        224     BUILD_LIST                      1
                        226     PRECALL                         1
                        230     CALL                            1
                        240     POP_TOP                         
                        242     LOAD_DEREF                      0: self
                        244     LOAD_ATTR                       4: thread
                        254     LOAD_ATTR                       5: output_signal
                        264     LOAD_METHOD                     6: connect
                        286     LOAD_CLOSURE                    2: mtd_partitions
                        288     LOAD_CLOSURE                    0: self
                        290     BUILD_TUPLE                     2
                        292     LOAD_CONST                      7: <CODE> <lambda>
                        294     MAKE_FUNCTION                   8
                        296     PRECALL                         1
                        300     CALL                            1
                        310     POP_TOP                         
                        312     LOAD_CONST                      0: None
                        314     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: pull_mtd_partitions
                    Qualified Name: ADBTool.pull_mtd_partitions
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'execute_adb_commands'
                    [Locals+Names]
                        'self'
                        'mtd_partitions'
                        'commands'
                    [Constants]
                        None
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <listcomp>
                            Qualified Name: ADBTool.pull_mtd_partitions.<locals>.<listcomp>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 6
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'directory_path'
                            [Locals+Names]
                                '.0'
                                'mtd'
                                'self'
                            [Constants]
                                'pull /dev/'
                                ' '
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       BUILD_LIST                      0
                                6       LOAD_FAST                       0: .0
                                8       FOR_ITER                        15 (to 40)
                                10      STORE_FAST                      1: mtd
                                12      LOAD_CONST                      0: 'pull /dev/'
                                14      LOAD_FAST                       1: mtd
                                16      FORMAT_VALUE                    0 (FVC_NONE)
                                18      LOAD_CONST                      1: ' '
                                20      LOAD_DEREF                      2: self
                                22      LOAD_ATTR                       0: directory_path
                                32      FORMAT_VALUE                    0 (FVC_NONE)
                                34      BUILD_STRING                    4
                                36      LIST_APPEND                     2
                                38      JUMP_BACKWARD                   16 (to 8)
                                40      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       MAKE_CELL                       0: self
                        2       RESUME                          0
                        4       LOAD_CLOSURE                    0: self
                        6       BUILD_TUPLE                     1
                        8       LOAD_CONST                      1: <CODE> <listcomp>
                        10      MAKE_FUNCTION                   8
                        12      LOAD_FAST                       1: mtd_partitions
                        14      GET_ITER                        
                        16      PRECALL                         0
                        20      CALL                            0
                        30      STORE_FAST                      2: commands
                        32      LOAD_DEREF                      0: self
                        34      LOAD_METHOD                     0: execute_adb_commands
                        56      LOAD_FAST                       2: commands
                        58      PRECALL                         1
                        62      CALL                            1
                        72      POP_TOP                         
                        74      LOAD_CONST                      0: None
                        76      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: pull_directories
                    Qualified Name: ADBTool.pull_directories
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QFileDialog'
                        'getExistingDirectory'
                        'feedback_text'
                        'append'
                        'execute_adb_commands'
                    [Locals+Names]
                        'self'
                        'directories_to_pull'
                        'commands'
                        'directory_path'
                    [Constants]
                        None
                        '选择存储文件的文件夹'
                        '用户取消了操作。\n'
                        (
                            'bin'
                            'etc'
                            'etc_ro'
                            'lib'
                            'mnt'
                            'sbin'
                            'usr'
                        )
                        'shell mount -o remount,rw /'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <listcomp>
                            Qualified Name: ADBTool.pull_directories.<locals>.<listcomp>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 6
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                            [Locals+Names]
                                '.0'
                                'directory'
                                'directory_path'
                            [Constants]
                                'pull /'
                                ' '
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       BUILD_LIST                      0
                                6       LOAD_FAST                       0: .0
                                8       FOR_ITER                        10 (to 30)
                                10      STORE_FAST                      1: directory
                                12      LOAD_CONST                      0: 'pull /'
                                14      LOAD_FAST                       1: directory
                                16      FORMAT_VALUE                    0 (FVC_NONE)
                                18      LOAD_CONST                      1: ' '
                                20      LOAD_DEREF                      2: directory_path
                                22      FORMAT_VALUE                    0 (FVC_NONE)
                                24      BUILD_STRING                    4
                                26      LIST_APPEND                     2
                                28      JUMP_BACKWARD                   11 (to 8)
                                30      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       MAKE_CELL                       3: directory_path
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + QFileDialog
                        16      LOAD_ATTR                       1: getExistingDirectory
                        26      LOAD_FAST                       0: self
                        28      LOAD_CONST                      1: '选择存储文件的文件夹'
                        30      PRECALL                         2
                        34      CALL                            2
                        44      STORE_DEREF                     3: directory_path
                        46      LOAD_DEREF                      3: directory_path
                        48      POP_JUMP_FORWARD_IF_TRUE        28 (to 106)
                        50      LOAD_FAST                       0: self
                        52      LOAD_ATTR                       2: feedback_text
                        62      LOAD_METHOD                     3: append
                        84      LOAD_CONST                      2: '用户取消了操作。\n'
                        86      PRECALL                         1
                        90      CALL                            1
                        100     POP_TOP                         
                        102     LOAD_CONST                      0: None
                        104     RETURN_VALUE                    
                        106     BUILD_LIST                      0
                        108     LOAD_CONST                      3: ('bin', 'etc', 'etc_ro', 'lib', 'mnt', 'sbin', 'usr')
                        110     LIST_EXTEND                     1
                        112     STORE_FAST                      1: directories_to_pull
                        114     LOAD_CONST                      4: 'shell mount -o remount,rw /'
                        116     BUILD_LIST                      1
                        118     STORE_FAST                      2: commands
                        120     LOAD_FAST                       2: commands
                        122     LOAD_CLOSURE                    3: directory_path
                        124     BUILD_TUPLE                     1
                        126     LOAD_CONST                      5: <CODE> <listcomp>
                        128     MAKE_FUNCTION                   8
                        130     LOAD_FAST                       1: directories_to_pull
                        132     GET_ITER                        
                        134     PRECALL                         0
                        138     CALL                            0
                        148     BINARY_OP                       13 (+=)
                        152     STORE_FAST                      2: commands
                        154     LOAD_FAST                       0: self
                        156     LOAD_METHOD                     4: execute_adb_commands
                        178     LOAD_FAST                       2: commands
                        180     PRECALL                         1
                        184     CALL                            1
                        194     POP_TOP                         
                        196     LOAD_CONST                      0: None
                        198     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_reboot_operations
                    Qualified Name: ADBTool.execute_reboot_operations
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'execute_adb_commands'
                    [Locals+Names]
                        'self'
                        'commands'
                    [Constants]
                        None
                        'shell reboot'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: 'shell reboot'
                        4       BUILD_LIST                      1
                        6       STORE_FAST                      1: commands
                        8       LOAD_FAST                       0: self
                        10      LOAD_METHOD                     0: execute_adb_commands
                        32      LOAD_FAST                       1: commands
                        34      PRECALL                         1
                        38      CALL                            1
                        48      POP_TOP                         
                        50      LOAD_CONST                      0: None
                        52      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: open_at_tool
                    Qualified Name: ADBTool.open_at_tool
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'ATToolWindow'
                        'script_directory'
                        'at_tool_window'
                        'show'
                    [Locals+Names]
                        'self'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + ATToolWindow
                        14      LOAD_FAST                       0: self
                        16      LOAD_ATTR                       1: script_directory
                        26      PRECALL                         1
                        30      CALL                            1
                        40      LOAD_FAST                       0: self
                        42      STORE_ATTR                      2: at_tool_window
                        52      LOAD_FAST                       0: self
                        54      LOAD_ATTR                       2: at_tool_window
                        64      LOAD_METHOD                     3: show
                        86      PRECALL                         0
                        90      CALL                            0
                        100     POP_TOP                         
                        102     LOAD_CONST                      0: None
                        104     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: open_ad_tool
                    Qualified Name: ADBTool.open_ad_tool
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QMessageBox'
                        'information'
                        'ADToolWindow'
                        'script_directory'
                        'ad_tool_window'
                        'show'
                    [Locals+Names]
                        'self'
                    [Constants]
                        None
                        '注意事项'
                        '刷分区请自备编程器。\n\n每次进入shell执行器只可执行一次刷写。\n第二次刷写不生效甚至死机。\n\n每次开机建议刷写一次，重刷建议重启后再去操作。'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QMessageBox
                        14      LOAD_ATTR                       1: information
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '注意事项'
                        28      LOAD_CONST                      2: '刷分区请自备编程器。\n\n每次进入shell执行器只可执行一次刷写。\n第二次刷写不生效甚至死机。\n\n每次开机建议刷写一次，重刷建议重启后再去操作。'
                        30      PRECALL                         3
                        34      CALL                            3
                        44      POP_TOP                         
                        46      LOAD_GLOBAL                     5: NULL + ADToolWindow
                        58      LOAD_FAST                       0: self
                        60      LOAD_ATTR                       3: script_directory
                        70      PRECALL                         1
                        74      CALL                            1
                        84      LOAD_FAST                       0: self
                        86      STORE_ATTR                      4: ad_tool_window
                        96      LOAD_FAST                       0: self
                        98      LOAD_ATTR                       4: ad_tool_window
                        108     LOAD_METHOD                     5: show
                        130     PRECALL                         0
                        134     CALL                            0
                        144     POP_TOP                         
                        146     LOAD_CONST                      0: None
                        148     RETURN_VALUE                    
                    [Exception Table]
            [Disassembly]
                0       MAKE_CELL                       0: __class__
                2       RESUME                          0
                4       LOAD_NAME                       0: __name__
                6       STORE_NAME                      1: __module__
                8       LOAD_CONST                      0: 'ADBTool'
                10      STORE_NAME                      2: __qualname__
                12      LOAD_CLOSURE                    0: __class__
                14      BUILD_TUPLE                     1
                16      LOAD_CONST                      1: <CODE> __init__
                18      MAKE_FUNCTION                   8
                20      STORE_NAME                      3: __init__
                22      LOAD_CONST                      2: <CODE> set_window_icon
                24      MAKE_FUNCTION                   0
                26      STORE_NAME                      4: set_window_icon
                28      LOAD_CONST                      3: <CODE> init_ui
                30      MAKE_FUNCTION                   0
                32      STORE_NAME                      5: init_ui
                34      LOAD_CONST                      4: <CODE> execute_adb_commands
                36      MAKE_FUNCTION                   0
                38      STORE_NAME                      6: execute_adb_commands
                40      LOAD_CONST                      5: <CODE> handle_output
                42      MAKE_FUNCTION                   0
                44      STORE_NAME                      7: handle_output
                46      LOAD_CONST                      6: <CODE> execute_weby_command
                48      MAKE_FUNCTION                   0
                50      STORE_NAME                      8: execute_weby_command
                52      LOAD_CONST                      7: <CODE> verify_js_push
                54      MAKE_FUNCTION                   0
                56      STORE_NAME                      9: verify_js_push
                58      LOAD_CONST                      8: <CODE> pull_and_modify_index_html
                60      MAKE_FUNCTION                   0
                62      STORE_NAME                      10: pull_and_modify_index_html
                64      LOAD_CONST                      9: <CODE> modify_and_push_index_html
                66      MAKE_FUNCTION                   0
                68      STORE_NAME                      11: modify_and_push_index_html
                70      LOAD_CONST                      10: <CODE> verify_index_push
                72      MAKE_FUNCTION                   0
                74      STORE_NAME                      12: verify_index_push
                76      LOAD_CONST                      11: <CODE> refresh_device_status
                78      MAKE_FUNCTION                   0
                80      STORE_NAME                      13: refresh_device_status
                82      LOAD_CONST                      12: <CODE> update_device_status
                84      MAKE_FUNCTION                   0
                86      STORE_NAME                      14: update_device_status
                88      LOAD_CONST                      13: <CODE> scan_adb_devices
                90      MAKE_FUNCTION                   0
                92      STORE_NAME                      15: scan_adb_devices
                94      LOAD_CONST                      14: <CODE> execute_adb_command
                96      MAKE_FUNCTION                   0
                98      STORE_NAME                      16: execute_adb_command
                100     LOAD_CONST                      15: <CODE> show_input_dialog
                102     MAKE_FUNCTION                   0
                104     STORE_NAME                      17: show_input_dialog
                106     LOAD_CONST                      16: <CODE> start_crawler
                108     MAKE_FUNCTION                   0
                110     STORE_NAME                      18: start_crawler
                112     LOAD_CONST                      17: <CODE> execute_stop_commands
                114     MAKE_FUNCTION                   0
                116     STORE_NAME                      19: execute_stop_commands
                118     LOAD_CONST                      18: <CODE> send_requests
                120     MAKE_FUNCTION                   0
                122     STORE_NAME                      20: send_requests
                124     LOAD_CONST                      19: <CODE> execute_tasks
                126     MAKE_FUNCTION                   0
                128     STORE_NAME                      21: execute_tasks
                130     LOAD_CONST                      20: <CODE> send_imei
                132     MAKE_FUNCTION                   0
                134     STORE_NAME                      22: send_imei
                136     LOAD_CONST                      21: <CODE> execute_web_command
                138     MAKE_FUNCTION                   0
                140     STORE_NAME                      23: execute_web_command
                142     LOAD_CONST                      22: <CODE> execute_mtd_commands
                144     MAKE_FUNCTION                   0
                146     STORE_NAME                      24: execute_mtd_commands
                148     LOAD_CONST                      23: <CODE> process_mtd_output
                150     MAKE_FUNCTION                   0
                152     STORE_NAME                      25: process_mtd_output
                154     LOAD_CONST                      24: <CODE> pull_mtd_partitions
                156     MAKE_FUNCTION                   0
                158     STORE_NAME                      26: pull_mtd_partitions
                160     LOAD_CONST                      25: <CODE> pull_directories
                162     MAKE_FUNCTION                   0
                164     STORE_NAME                      27: pull_directories
                166     LOAD_CONST                      26: <CODE> execute_reboot_operations
                168     MAKE_FUNCTION                   0
                170     STORE_NAME                      28: execute_reboot_operations
                172     LOAD_CONST                      27: <CODE> open_at_tool
                174     MAKE_FUNCTION                   0
                176     STORE_NAME                      29: open_at_tool
                178     LOAD_CONST                      28: <CODE> open_ad_tool
                180     MAKE_FUNCTION                   0
                182     STORE_NAME                      30: open_ad_tool
                184     LOAD_CLOSURE                    0: __class__
                186     COPY                            1
                188     STORE_NAME                      31: __classcell__
                190     RETURN_VALUE                    
            [Exception Table]
        'ADBTool'
        [Code]
            File Name: XTOOL_MTD.py
            Object Name: ADToolWindow
            Qualified Name: ADToolWindow
            Arg Count: 0
            Pos Only Arg Count: 0
            KW Only Arg Count: 0
            Stack Size: 3
            Flags: 0x00000000
            [Names]
                '__name__'
                '__module__'
                '__qualname__'
                'pyqtSignal'
                'str'
                'append_text_signal'
                '__init__'
                'set_window_icon'
                'init_ui'
                'scan_adb_devices'
                'set_line_spacing'
                'update_device_status'
                'execute_adb_command'
                'execute_shell_command'
                'read_process_output'
                'append_output_text'
                'upload_and_execute'
                'execute_dd_commands'
                'check_flash_process'
                'start_adb_shell'
                'read_output'
                'send_adb_command'
                'remount_rw'
                'closeEvent'
                '__classcell__'
            [Locals+Names]
                '__class__'
            [Constants]
                'ADToolWindow'
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: __init__
                    Qualified Name: ADToolWindow.__init__
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'super'
                        '__init__'
                        'setWindowTitle'
                        'script_directory'
                        'set_window_icon'
                        'adb_process'
                        'mtd_file_path'
                        'init_ui'
                        'resize'
                    [Locals+Names]
                        'self'
                        'script_directory'
                        '__class__'
                    [Constants]
                        None
                        'shell执行器'
                        800
                        500
                    [Disassembly]
                        0       COPY_FREE_VARS                  1
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + super
                        16      PRECALL                         0
                        20      CALL                            0
                        30      LOAD_METHOD                     1: __init__
                        52      PRECALL                         0
                        56      CALL                            0
                        66      POP_TOP                         
                        68      LOAD_FAST                       0: self
                        70      LOAD_METHOD                     2: setWindowTitle
                        92      LOAD_CONST                      1: 'shell执行器'
                        94      PRECALL                         1
                        98      CALL                            1
                        108     POP_TOP                         
                        110     LOAD_FAST                       1: script_directory
                        112     LOAD_FAST                       0: self
                        114     STORE_ATTR                      3: script_directory
                        124     LOAD_FAST                       0: self
                        126     LOAD_METHOD                     4: set_window_icon
                        148     PRECALL                         0
                        152     CALL                            0
                        162     POP_TOP                         
                        164     LOAD_CONST                      0: None
                        166     LOAD_FAST                       0: self
                        168     STORE_ATTR                      5: adb_process
                        178     LOAD_CONST                      0: None
                        180     LOAD_FAST                       0: self
                        182     STORE_ATTR                      6: mtd_file_path
                        192     LOAD_FAST                       0: self
                        194     LOAD_METHOD                     7: init_ui
                        216     PRECALL                         0
                        220     CALL                            0
                        230     POP_TOP                         
                        232     LOAD_FAST                       0: self
                        234     LOAD_METHOD                     8: resize
                        256     LOAD_CONST                      2: 800
                        258     LOAD_CONST                      3: 500
                        260     PRECALL                         2
                        264     CALL                            2
                        274     POP_TOP                         
                        276     LOAD_CONST                      0: None
                        278     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_window_icon
                    Qualified Name: ADToolWindow.set_window_icon
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'exists'
                        'setWindowIcon'
                        'QIcon'
                        'print'
                    [Locals+Names]
                        'self'
                        'icon_path'
                    [Constants]
                        None
                        'u.ico'
                        'Icon file not found:'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'u.ico'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      1: icon_path
                        76      LOAD_GLOBAL                     0: os
                        88      LOAD_ATTR                       1: path
                        98      LOAD_METHOD                     4: exists
                        120     LOAD_FAST                       1: icon_path
                        122     PRECALL                         1
                        126     CALL                            1
                        136     POP_JUMP_FORWARD_IF_FALSE       36 (to 210)
                        138     LOAD_FAST                       0: self
                        140     LOAD_METHOD                     5: setWindowIcon
                        162     LOAD_GLOBAL                     13: NULL + QIcon
                        174     LOAD_FAST                       1: icon_path
                        176     PRECALL                         1
                        180     CALL                            1
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_CONST                      0: None
                        208     RETURN_VALUE                    
                        210     LOAD_GLOBAL                     15: NULL + print
                        222     LOAD_CONST                      2: 'Icon file not found:'
                        224     LOAD_FAST                       1: icon_path
                        226     PRECALL                         2
                        230     CALL                            2
                        240     POP_TOP                         
                        242     LOAD_CONST                      0: None
                        244     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: init_ui
                    Qualified Name: ADToolWindow.init_ui
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QVBoxLayout'
                        'QTextEdit'
                        'output_text'
                        'setReadOnly'
                        'QFont'
                        'setFont'
                        'setStyleSheet'
                        'set_line_spacing'
                        'addWidget'
                        'QHBoxLayout'
                        'QLabel'
                        'device_status_label'
                        'update_device_status'
                        'setAlignment'
                        'Qt'
                        'AlignLeft'
                        'addLayout'
                        'QLineEdit'
                        'entry'
                        'returnPressed'
                        'connect'
                        'send_adb_command'
                        'QPushButton'
                        'clicked'
                        'remount_rw'
                        'upload_and_execute'
                        'setLayout'
                        'start_adb_shell'
                        'append_text_signal'
                        'append_output_text'
                    [Locals+Names]
                        'self'
                        'layout'
                        'font'
                        'device_layout'
                        'entry_layout'
                        'entry_label'
                        'send_button'
                        'button_layout'
                        'remount_button'
                        'new_button'
                    [Constants]
                        None
                        True
                        'Courier'
                        10
                        'background-color: rgb(131, 203, 172);'
                        1.5
                        'ADB命令输入框:'
                        '发送命令'
                        '挂载读写'
                        '刷写MTD4'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QVBoxLayout
                        14      PRECALL                         0
                        18      CALL                            0
                        28      STORE_FAST                      1: layout
                        30      LOAD_GLOBAL                     3: NULL + QTextEdit
                        42      LOAD_FAST                       0: self
                        44      PRECALL                         1
                        48      CALL                            1
                        58      LOAD_FAST                       0: self
                        60      STORE_ATTR                      2: output_text
                        70      LOAD_FAST                       0: self
                        72      LOAD_ATTR                       2: output_text
                        82      LOAD_METHOD                     3: setReadOnly
                        104     LOAD_CONST                      1: True
                        106     PRECALL                         1
                        110     CALL                            1
                        120     POP_TOP                         
                        122     LOAD_GLOBAL                     9: NULL + QFont
                        134     LOAD_CONST                      2: 'Courier'
                        136     LOAD_CONST                      3: 10
                        138     PRECALL                         2
                        142     CALL                            2
                        152     STORE_FAST                      2: font
                        154     LOAD_FAST                       0: self
                        156     LOAD_ATTR                       2: output_text
                        166     LOAD_METHOD                     5: setFont
                        188     LOAD_FAST                       2: font
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_FAST                       0: self
                        208     LOAD_ATTR                       2: output_text
                        218     LOAD_METHOD                     6: setStyleSheet
                        240     LOAD_CONST                      4: 'background-color: rgb(131, 203, 172);'
                        242     PRECALL                         1
                        246     CALL                            1
                        256     POP_TOP                         
                        258     LOAD_FAST                       0: self
                        260     LOAD_METHOD                     7: set_line_spacing
                        282     LOAD_FAST                       0: self
                        284     LOAD_ATTR                       2: output_text
                        294     LOAD_CONST                      5: 1.5
                        296     PRECALL                         2
                        300     CALL                            2
                        310     POP_TOP                         
                        312     LOAD_FAST                       1: layout
                        314     LOAD_METHOD                     8: addWidget
                        336     LOAD_FAST                       0: self
                        338     LOAD_ATTR                       2: output_text
                        348     PRECALL                         1
                        352     CALL                            1
                        362     POP_TOP                         
                        364     LOAD_GLOBAL                     19: NULL + QHBoxLayout
                        376     PRECALL                         0
                        380     CALL                            0
                        390     STORE_FAST                      3: device_layout
                        392     LOAD_GLOBAL                     21: NULL + QLabel
                        404     PRECALL                         0
                        408     CALL                            0
                        418     LOAD_FAST                       0: self
                        420     STORE_ATTR                      11: device_status_label
                        430     LOAD_FAST                       0: self
                        432     LOAD_METHOD                     12: update_device_status
                        454     PRECALL                         0
                        458     CALL                            0
                        468     POP_TOP                         
                        470     LOAD_FAST                       0: self
                        472     LOAD_ATTR                       11: device_status_label
                        482     LOAD_METHOD                     13: setAlignment
                        504     LOAD_GLOBAL                     28: Qt
                        516     LOAD_ATTR                       15: AlignLeft
                        526     PRECALL                         1
                        530     CALL                            1
                        540     POP_TOP                         
                        542     LOAD_FAST                       3: device_layout
                        544     LOAD_METHOD                     8: addWidget
                        566     LOAD_FAST                       0: self
                        568     LOAD_ATTR                       11: device_status_label
                        578     PRECALL                         1
                        582     CALL                            1
                        592     POP_TOP                         
                        594     LOAD_FAST                       1: layout
                        596     LOAD_METHOD                     16: addLayout
                        618     LOAD_FAST                       3: device_layout
                        620     PRECALL                         1
                        624     CALL                            1
                        634     POP_TOP                         
                        636     LOAD_GLOBAL                     19: NULL + QHBoxLayout
                        648     PRECALL                         0
                        652     CALL                            0
                        662     STORE_FAST                      4: entry_layout
                        664     LOAD_GLOBAL                     21: NULL + QLabel
                        676     LOAD_CONST                      6: 'ADB命令输入框:'
                        678     PRECALL                         1
                        682     CALL                            1
                        692     STORE_FAST                      5: entry_label
                        694     LOAD_FAST                       4: entry_layout
                        696     LOAD_METHOD                     8: addWidget
                        718     LOAD_FAST                       5: entry_label
                        720     PRECALL                         1
                        724     CALL                            1
                        734     POP_TOP                         
                        736     LOAD_GLOBAL                     35: NULL + QLineEdit
                        748     PRECALL                         0
                        752     CALL                            0
                        762     LOAD_FAST                       0: self
                        764     STORE_ATTR                      18: entry
                        774     LOAD_FAST                       0: self
                        776     LOAD_ATTR                       18: entry
                        786     LOAD_ATTR                       19: returnPressed
                        796     LOAD_METHOD                     20: connect
                        818     LOAD_FAST                       0: self
                        820     LOAD_ATTR                       21: send_adb_command
                        830     PRECALL                         1
                        834     CALL                            1
                        844     POP_TOP                         
                        846     LOAD_FAST                       4: entry_layout
                        848     LOAD_METHOD                     8: addWidget
                        870     LOAD_FAST                       0: self
                        872     LOAD_ATTR                       18: entry
                        882     PRECALL                         1
                        886     CALL                            1
                        896     POP_TOP                         
                        898     LOAD_GLOBAL                     45: NULL + QPushButton
                        910     LOAD_CONST                      7: '发送命令'
                        912     PRECALL                         1
                        916     CALL                            1
                        926     STORE_FAST                      6: send_button
                        928     LOAD_FAST                       6: send_button
                        930     LOAD_ATTR                       23: clicked
                        940     LOAD_METHOD                     20: connect
                        962     LOAD_FAST                       0: self
                        964     LOAD_ATTR                       21: send_adb_command
                        974     PRECALL                         1
                        978     CALL                            1
                        988     POP_TOP                         
                        990     LOAD_FAST                       4: entry_layout
                        992     LOAD_METHOD                     8: addWidget
                        1014    LOAD_FAST                       6: send_button
                        1016    PRECALL                         1
                        1020    CALL                            1
                        1030    POP_TOP                         
                        1032    LOAD_FAST                       1: layout
                        1034    LOAD_METHOD                     16: addLayout
                        1056    LOAD_FAST                       4: entry_layout
                        1058    PRECALL                         1
                        1062    CALL                            1
                        1072    POP_TOP                         
                        1074    LOAD_GLOBAL                     19: NULL + QHBoxLayout
                        1086    PRECALL                         0
                        1090    CALL                            0
                        1100    STORE_FAST                      7: button_layout
                        1102    LOAD_GLOBAL                     45: NULL + QPushButton
                        1114    LOAD_CONST                      8: '挂载读写'
                        1116    PRECALL                         1
                        1120    CALL                            1
                        1130    STORE_FAST                      8: remount_button
                        1132    LOAD_FAST                       8: remount_button
                        1134    LOAD_ATTR                       23: clicked
                        1144    LOAD_METHOD                     20: connect
                        1166    LOAD_FAST                       0: self
                        1168    LOAD_ATTR                       24: remount_rw
                        1178    PRECALL                         1
                        1182    CALL                            1
                        1192    POP_TOP                         
                        1194    LOAD_FAST                       7: button_layout
                        1196    LOAD_METHOD                     8: addWidget
                        1218    LOAD_FAST                       8: remount_button
                        1220    PRECALL                         1
                        1224    CALL                            1
                        1234    POP_TOP                         
                        1236    LOAD_GLOBAL                     45: NULL + QPushButton
                        1248    LOAD_CONST                      9: '刷写MTD4'
                        1250    PRECALL                         1
                        1254    CALL                            1
                        1264    STORE_FAST                      9: new_button
                        1266    LOAD_FAST                       9: new_button
                        1268    LOAD_ATTR                       23: clicked
                        1278    LOAD_METHOD                     20: connect
                        1300    LOAD_FAST                       0: self
                        1302    LOAD_ATTR                       25: upload_and_execute
                        1312    PRECALL                         1
                        1316    CALL                            1
                        1326    POP_TOP                         
                        1328    LOAD_FAST                       7: button_layout
                        1330    LOAD_METHOD                     8: addWidget
                        1352    LOAD_FAST                       9: new_button
                        1354    PRECALL                         1
                        1358    CALL                            1
                        1368    POP_TOP                         
                        1370    LOAD_FAST                       1: layout
                        1372    LOAD_METHOD                     16: addLayout
                        1394    LOAD_FAST                       7: button_layout
                        1396    PRECALL                         1
                        1400    CALL                            1
                        1410    POP_TOP                         
                        1412    LOAD_FAST                       0: self
                        1414    LOAD_METHOD                     26: setLayout
                        1436    LOAD_FAST                       1: layout
                        1438    PRECALL                         1
                        1442    CALL                            1
                        1452    POP_TOP                         
                        1454    LOAD_FAST                       0: self
                        1456    LOAD_METHOD                     27: start_adb_shell
                        1478    PRECALL                         0
                        1482    CALL                            0
                        1492    POP_TOP                         
                        1494    LOAD_FAST                       0: self
                        1496    LOAD_ATTR                       28: append_text_signal
                        1506    LOAD_METHOD                     20: connect
                        1528    LOAD_FAST                       0: self
                        1530    LOAD_ATTR                       29: append_output_text
                        1540    PRECALL                         1
                        1544    CALL                            1
                        1554    POP_TOP                         
                        1556    LOAD_CONST                      0: None
                        1558    RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: scan_adb_devices
                    Qualified Name: ADToolWindow.scan_adb_devices
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'subprocess'
                        'run'
                        'CREATE_NO_WINDOW'
                        'stdout'
                        'splitlines'
                        'append'
                        'split'
                        'CalledProcessError'
                        'append_text_signal'
                        'emit'
                        'str'
                    [Locals+Names]
                        'self'
                        'result'
                        'devices'
                        'line'
                        'e'
                    [Constants]
                        None
                        'adb'
                        'devices'
                        True
                        (
                            'capture_output'
                            'text'
                            'check'
                            'creationflags'
                        )
                        '\tdevice'
                        '\t'
                        0
                        'Error scanning adb devices: '
                    [Disassembly]
                        0       RESUME                          0
                        2       NOP                             
                        4       LOAD_GLOBAL                     1: NULL + subprocess
                        16      LOAD_ATTR                       1: run
                        26      LOAD_CONST                      1: 'adb'
                        28      LOAD_CONST                      2: 'devices'
                        30      BUILD_LIST                      2
                        32      LOAD_CONST                      3: True
                        34      LOAD_CONST                      3: True
                        36      LOAD_CONST                      3: True
                        38      LOAD_GLOBAL                     0: subprocess
                        50      LOAD_ATTR                       2: CREATE_NO_WINDOW
                        60      KW_NAMES                        4: ('capture_output', 'text', 'check', 'creationflags')
                        62      PRECALL                         5
                        66      CALL                            5
                        76      STORE_FAST                      1: result
                        78      BUILD_LIST                      0
                        80      STORE_FAST                      2: devices
                        82      LOAD_FAST                       1: result
                        84      LOAD_ATTR                       3: stdout
                        94      LOAD_METHOD                     4: splitlines
                        116     PRECALL                         0
                        120     CALL                            0
                        130     GET_ITER                        
                        132     FOR_ITER                        52 (to 238)
                        134     STORE_FAST                      3: line
                        136     LOAD_CONST                      5: '\tdevice'
                        138     LOAD_FAST                       3: line
                        140     CONTAINS_OP                     0 (in)
                        142     POP_JUMP_FORWARD_IF_FALSE       46 (to 236)
                        144     LOAD_FAST                       2: devices
                        146     LOAD_METHOD                     5: append
                        168     LOAD_FAST                       3: line
                        170     LOAD_METHOD                     6: split
                        192     LOAD_CONST                      6: '\t'
                        194     PRECALL                         1
                        198     CALL                            1
                        208     LOAD_CONST                      7: 0
                        210     BINARY_SUBSCR                   
                        220     PRECALL                         1
                        224     CALL                            1
                        234     POP_TOP                         
                        236     JUMP_BACKWARD                   53 (to 132)
                        238     LOAD_FAST                       2: devices
                        240     RETURN_VALUE                    
                        242     PUSH_EXC_INFO                   
                        244     LOAD_GLOBAL                     0: subprocess
                        256     LOAD_ATTR                       7: CalledProcessError
                        266     CHECK_EXC_MATCH                 
                        268     POP_JUMP_FORWARD_IF_FALSE       54 (to 378)
                        270     STORE_FAST                      4: e
                        272     LOAD_FAST                       0: self
                        274     LOAD_ATTR                       8: append_text_signal
                        284     LOAD_METHOD                     9: emit
                        306     LOAD_CONST                      8: 'Error scanning adb devices: '
                        308     LOAD_GLOBAL                     21: NULL + str
                        320     LOAD_FAST                       4: e
                        322     PRECALL                         1
                        326     CALL                            1
                        336     FORMAT_VALUE                    0 (FVC_NONE)
                        338     BUILD_STRING                    2
                        340     PRECALL                         1
                        344     CALL                            1
                        354     POP_TOP                         
                        356     BUILD_LIST                      0
                        358     SWAP                            2
                        360     POP_EXCEPT                      
                        362     LOAD_CONST                      0: None
                        364     STORE_FAST                      4: e
                        366     DELETE_FAST                     4: e
                        368     RETURN_VALUE                    
                        370     LOAD_CONST                      0: None
                        372     STORE_FAST                      4: e
                        374     DELETE_FAST                     4: e
                        376     RERAISE                         1
                        378     RERAISE                         0
                        380     COPY                            3
                        382     POP_EXCEPT                      
                        384     RERAISE                         1
                    [Exception Table]
                        4 to 240 -> 242 [0] 
                        242 to 272 -> 380 [1] lasti
                        272 to 358 -> 370 [1] lasti
                        358 to 360 -> 380 [1] lasti
                        370 to 380 -> 380 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_line_spacing
                    Qualified Name: ADToolWindow.set_line_spacing
                    Arg Count: 3
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QTextCursor'
                        'document'
                        'QTextBlockFormat'
                        'setLineHeight'
                        'ProportionalHeight'
                        'select'
                        'Document'
                        'mergeBlockFormat'
                        'clearSelection'
                        'setTextCursor'
                    [Locals+Names]
                        'self'
                        'text_edit'
                        'line_spacing'
                        'cursor'
                        'block_format'
                    [Constants]
                        None
                        100
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QTextCursor
                        14      LOAD_FAST                       1: text_edit
                        16      LOAD_METHOD                     1: document
                        38      PRECALL                         0
                        42      CALL                            0
                        52      PRECALL                         1
                        56      CALL                            1
                        66      STORE_FAST                      3: cursor
                        68      LOAD_GLOBAL                     5: NULL + QTextBlockFormat
                        80      PRECALL                         0
                        84      CALL                            0
                        94      STORE_FAST                      4: block_format
                        96      LOAD_FAST                       4: block_format
                        98      LOAD_METHOD                     3: setLineHeight
                        120     LOAD_FAST                       2: line_spacing
                        122     LOAD_CONST                      1: 100
                        124     BINARY_OP                       5 (*)
                        128     LOAD_GLOBAL                     4: QTextBlockFormat
                        140     LOAD_ATTR                       4: ProportionalHeight
                        150     PRECALL                         2
                        154     CALL                            2
                        164     POP_TOP                         
                        166     LOAD_FAST                       3: cursor
                        168     LOAD_METHOD                     5: select
                        190     LOAD_GLOBAL                     0: QTextCursor
                        202     LOAD_ATTR                       6: Document
                        212     PRECALL                         1
                        216     CALL                            1
                        226     POP_TOP                         
                        228     LOAD_FAST                       3: cursor
                        230     LOAD_METHOD                     7: mergeBlockFormat
                        252     LOAD_FAST                       4: block_format
                        254     PRECALL                         1
                        258     CALL                            1
                        268     POP_TOP                         
                        270     LOAD_FAST                       3: cursor
                        272     LOAD_METHOD                     8: clearSelection
                        294     PRECALL                         0
                        298     CALL                            0
                        308     POP_TOP                         
                        310     LOAD_FAST                       1: text_edit
                        312     LOAD_METHOD                     9: setTextCursor
                        334     LOAD_FAST                       3: cursor
                        336     PRECALL                         1
                        340     CALL                            1
                        350     POP_TOP                         
                        352     LOAD_CONST                      0: None
                        354     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: update_device_status
                    Qualified Name: ADToolWindow.update_device_status
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'scan_adb_devices'
                        'device_status_label'
                        'setText'
                        'setStyleSheet'
                    [Locals+Names]
                        'self'
                        'devices'
                    [Constants]
                        None
                        '● ADB设备已连接'
                        'color: green;'
                        '● ADB设备未连接'
                        'color: red;'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_METHOD                     0: scan_adb_devices
                        26      PRECALL                         0
                        30      CALL                            0
                        40      STORE_FAST                      1: devices
                        42      LOAD_FAST                       1: devices
                        44      POP_JUMP_FORWARD_IF_FALSE       54 (to 154)
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       1: device_status_label
                        58      LOAD_METHOD                     2: setText
                        80      LOAD_CONST                      1: '● ADB设备已连接'
                        82      PRECALL                         1
                        86      CALL                            1
                        96      POP_TOP                         
                        98      LOAD_FAST                       0: self
                        100     LOAD_ATTR                       1: device_status_label
                        110     LOAD_METHOD                     3: setStyleSheet
                        132     LOAD_CONST                      2: 'color: green;'
                        134     PRECALL                         1
                        138     CALL                            1
                        148     POP_TOP                         
                        150     LOAD_CONST                      0: None
                        152     RETURN_VALUE                    
                        154     LOAD_FAST                       0: self
                        156     LOAD_ATTR                       1: device_status_label
                        166     LOAD_METHOD                     2: setText
                        188     LOAD_CONST                      3: '● ADB设备未连接'
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_FAST                       0: self
                        208     LOAD_ATTR                       1: device_status_label
                        218     LOAD_METHOD                     3: setStyleSheet
                        240     LOAD_CONST                      4: 'color: red;'
                        242     PRECALL                         1
                        246     CALL                            1
                        256     POP_TOP                         
                        258     LOAD_CONST                      0: None
                        260     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_adb_command
                    Qualified Name: ADToolWindow.execute_adb_command
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 8
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'subprocess'
                        'Popen'
                        'PIPE'
                        'CREATE_NO_WINDOW'
                        'communicate'
                        'append_text_signal'
                        'emit'
                        'Exception'
                        'str'
                    [Locals+Names]
                        'self'
                        'command'
                        'process'
                        'stdout'
                        'stderr'
                        'e'
                    [Constants]
                        None
                        True
                        (
                            'stdout'
                            'stderr'
                            'text'
                            'shell'
                            'creationflags'
                        )
                        'Executed adb command: '
                        '\n'
                        'Exception occurred: '
                    [Disassembly]
                        0       RESUME                          0
                        2       NOP                             
                        4       LOAD_GLOBAL                     1: NULL + subprocess
                        16      LOAD_ATTR                       1: Popen
                        26      LOAD_FAST                       1: command
                        28      LOAD_GLOBAL                     0: subprocess
                        40      LOAD_ATTR                       2: PIPE
                        50      LOAD_GLOBAL                     0: subprocess
                        62      LOAD_ATTR                       2: PIPE
                        72      LOAD_CONST                      1: True
                        74      LOAD_CONST                      1: True
                        76      LOAD_GLOBAL                     0: subprocess
                        88      LOAD_ATTR                       3: CREATE_NO_WINDOW
                        98      KW_NAMES                        2: ('stdout', 'stderr', 'text', 'shell', 'creationflags')
                        100     PRECALL                         6
                        104     CALL                            6
                        114     STORE_FAST                      2: process
                        116     LOAD_FAST                       2: process
                        118     LOAD_METHOD                     4: communicate
                        140     PRECALL                         0
                        144     CALL                            0
                        154     UNPACK_SEQUENCE                 2
                        158     STORE_FAST                      3: stdout
                        160     STORE_FAST                      4: stderr
                        162     LOAD_FAST                       0: self
                        164     LOAD_ATTR                       5: append_text_signal
                        174     LOAD_METHOD                     6: emit
                        196     LOAD_CONST                      3: 'Executed adb command: '
                        198     LOAD_FAST                       1: command
                        200     FORMAT_VALUE                    0 (FVC_NONE)
                        202     LOAD_CONST                      4: '\n'
                        204     BUILD_STRING                    3
                        206     PRECALL                         1
                        210     CALL                            1
                        220     POP_TOP                         
                        222     LOAD_CONST                      0: None
                        224     RETURN_VALUE                    
                        226     PUSH_EXC_INFO                   
                        228     LOAD_GLOBAL                     14: Exception
                        240     CHECK_EXC_MATCH                 
                        242     POP_JUMP_FORWARD_IF_FALSE       53 (to 350)
                        244     STORE_FAST                      5: e
                        246     LOAD_FAST                       0: self
                        248     LOAD_ATTR                       5: append_text_signal
                        258     LOAD_METHOD                     6: emit
                        280     LOAD_CONST                      5: 'Exception occurred: '
                        282     LOAD_GLOBAL                     17: NULL + str
                        294     LOAD_FAST                       5: e
                        296     PRECALL                         1
                        300     CALL                            1
                        310     FORMAT_VALUE                    0 (FVC_NONE)
                        312     BUILD_STRING                    2
                        314     PRECALL                         1
                        318     CALL                            1
                        328     POP_TOP                         
                        330     POP_EXCEPT                      
                        332     LOAD_CONST                      0: None
                        334     STORE_FAST                      5: e
                        336     DELETE_FAST                     5: e
                        338     LOAD_CONST                      0: None
                        340     RETURN_VALUE                    
                        342     LOAD_CONST                      0: None
                        344     STORE_FAST                      5: e
                        346     DELETE_FAST                     5: e
                        348     RERAISE                         1
                        350     RERAISE                         0
                        352     COPY                            3
                        354     POP_EXCEPT                      
                        356     RERAISE                         1
                    [Exception Table]
                        4 to 222 -> 226 [0] 
                        226 to 246 -> 352 [1] lasti
                        246 to 330 -> 342 [1] lasti
                        342 to 352 -> 352 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_shell_command
                    Qualified Name: ADToolWindow.execute_shell_command
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'adb_process'
                        'write'
                        'encode'
                        'waitForBytesWritten'
                        'Exception'
                        'append_text_signal'
                        'emit'
                        'str'
                    [Locals+Names]
                        'self'
                        'command'
                        'e'
                    [Constants]
                        None
                        '\n'
                        'Exception occurred: '
                    [Disassembly]
                        0       RESUME                          0
                        2       NOP                             
                        4       LOAD_FAST                       0: self
                        6       LOAD_ATTR                       0: adb_process
                        16      POP_JUMP_FORWARD_IF_FALSE       74 (to 166)
                        18      LOAD_FAST                       0: self
                        20      LOAD_ATTR                       0: adb_process
                        30      LOAD_METHOD                     1: write
                        52      LOAD_FAST                       1: command
                        54      LOAD_CONST                      1: '\n'
                        56      BINARY_OP                       0 (+)
                        60      LOAD_METHOD                     2: encode
                        82      PRECALL                         0
                        86      CALL                            0
                        96      PRECALL                         1
                        100     CALL                            1
                        110     POP_TOP                         
                        112     LOAD_FAST                       0: self
                        114     LOAD_ATTR                       0: adb_process
                        124     LOAD_METHOD                     3: waitForBytesWritten
                        146     PRECALL                         0
                        150     CALL                            0
                        160     POP_TOP                         
                        162     LOAD_CONST                      0: None
                        164     RETURN_VALUE                    
                        166     LOAD_CONST                      0: None
                        168     RETURN_VALUE                    
                        170     PUSH_EXC_INFO                   
                        172     LOAD_GLOBAL                     8: Exception
                        184     CHECK_EXC_MATCH                 
                        186     POP_JUMP_FORWARD_IF_FALSE       53 (to 294)
                        188     STORE_FAST                      2: e
                        190     LOAD_FAST                       0: self
                        192     LOAD_ATTR                       5: append_text_signal
                        202     LOAD_METHOD                     6: emit
                        224     LOAD_CONST                      2: 'Exception occurred: '
                        226     LOAD_GLOBAL                     15: NULL + str
                        238     LOAD_FAST                       2: e
                        240     PRECALL                         1
                        244     CALL                            1
                        254     FORMAT_VALUE                    0 (FVC_NONE)
                        256     BUILD_STRING                    2
                        258     PRECALL                         1
                        262     CALL                            1
                        272     POP_TOP                         
                        274     POP_EXCEPT                      
                        276     LOAD_CONST                      0: None
                        278     STORE_FAST                      2: e
                        280     DELETE_FAST                     2: e
                        282     LOAD_CONST                      0: None
                        284     RETURN_VALUE                    
                        286     LOAD_CONST                      0: None
                        288     STORE_FAST                      2: e
                        290     DELETE_FAST                     2: e
                        292     RERAISE                         1
                        294     RERAISE                         0
                        296     COPY                            3
                        298     POP_EXCEPT                      
                        300     RERAISE                         1
                    [Exception Table]
                        4 to 162 -> 170 [0] 
                        170 to 190 -> 296 [1] lasti
                        190 to 274 -> 286 [1] lasti
                        286 to 296 -> 296 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: read_process_output
                    Qualified Name: ADToolWindow.read_process_output
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'poll'
                        'stdout'
                        'readline'
                        'append_text_signal'
                        'emit'
                        'strip'
                    [Locals+Names]
                        'self'
                        'process'
                        'output'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       1: process
                        4       LOAD_METHOD                     0: poll
                        26      PRECALL                         0
                        30      CALL                            0
                        40      POP_JUMP_FORWARD_IF_NOT_NONE    93 (to 228)
                        42      LOAD_FAST                       1: process
                        44      LOAD_ATTR                       1: stdout
                        54      LOAD_METHOD                     2: readline
                        76      PRECALL                         0
                        80      CALL                            0
                        90      STORE_FAST                      2: output
                        92      LOAD_FAST                       2: output
                        94      POP_JUMP_FORWARD_IF_FALSE       44 (to 184)
                        96      LOAD_FAST                       0: self
                        98      LOAD_ATTR                       3: append_text_signal
                        108     LOAD_METHOD                     4: emit
                        130     LOAD_FAST                       2: output
                        132     LOAD_METHOD                     5: strip
                        154     PRECALL                         0
                        158     CALL                            0
                        168     PRECALL                         1
                        172     CALL                            1
                        182     POP_TOP                         
                        184     LOAD_FAST                       1: process
                        186     LOAD_METHOD                     0: poll
                        208     PRECALL                         0
                        212     CALL                            0
                        222     POP_JUMP_BACKWARD_IF_NONE       91 (to 42)
                        224     LOAD_CONST                      0: None
                        226     RETURN_VALUE                    
                        228     LOAD_CONST                      0: None
                        230     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: append_output_text
                    Qualified Name: ADToolWindow.append_output_text
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'output_text'
                        'setReadOnly'
                        'append'
                        'ensureCursorVisible'
                    [Locals+Names]
                        'self'
                        'text'
                    [Constants]
                        None
                        False
                        True
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: output_text
                        14      LOAD_METHOD                     1: setReadOnly
                        36      LOAD_CONST                      1: False
                        38      PRECALL                         1
                        42      CALL                            1
                        52      POP_TOP                         
                        54      LOAD_FAST                       0: self
                        56      LOAD_ATTR                       0: output_text
                        66      LOAD_METHOD                     2: append
                        88      LOAD_FAST                       1: text
                        90      PRECALL                         1
                        94      CALL                            1
                        104     POP_TOP                         
                        106     LOAD_FAST                       0: self
                        108     LOAD_ATTR                       0: output_text
                        118     LOAD_METHOD                     1: setReadOnly
                        140     LOAD_CONST                      2: True
                        142     PRECALL                         1
                        146     CALL                            1
                        156     POP_TOP                         
                        158     LOAD_FAST                       0: self
                        160     LOAD_ATTR                       0: output_text
                        170     LOAD_METHOD                     3: ensureCursorVisible
                        192     PRECALL                         0
                        196     CALL                            0
                        206     POP_TOP                         
                        208     LOAD_CONST                      0: None
                        210     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: upload_and_execute
                    Qualified Name: ADToolWindow.upload_and_execute
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QFileDialog'
                        'getOpenFileName'
                        'mtd_file_path'
                        'execute_adb_command'
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'QTimer'
                        'singleShot'
                        'execute_dd_commands'
                    [Locals+Names]
                        'self'
                        'mtd_file_path'
                        '_'
                    [Constants]
                        None
                        '选择MTD文件'
                        ''
                        'All Files (*)'
                        'adb shell mount -o remount,rw /'
                        'adb push "'
                        '" /tmp'
                        'flashcp'
                        'screen'
                        1000
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QFileDialog
                        14      LOAD_ATTR                       1: getOpenFileName
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '选择MTD文件'
                        28      LOAD_CONST                      2: ''
                        30      LOAD_CONST                      3: 'All Files (*)'
                        32      PRECALL                         4
                        36      CALL                            4
                        46      UNPACK_SEQUENCE                 2
                        50      STORE_FAST                      1: mtd_file_path
                        52      STORE_FAST                      2: _
                        54      LOAD_FAST                       1: mtd_file_path
                        56      POP_JUMP_FORWARD_IF_TRUE        2 (to 62)
                        58      LOAD_CONST                      0: None
                        60      RETURN_VALUE                    
                        62      LOAD_FAST                       1: mtd_file_path
                        64      LOAD_FAST                       0: self
                        66      STORE_ATTR                      2: mtd_file_path
                        76      LOAD_FAST                       0: self
                        78      LOAD_METHOD                     3: execute_adb_command
                        100     LOAD_CONST                      4: 'adb shell mount -o remount,rw /'
                        102     PRECALL                         1
                        106     CALL                            1
                        116     POP_TOP                         
                        118     LOAD_FAST                       0: self
                        120     LOAD_METHOD                     3: execute_adb_command
                        142     LOAD_CONST                      5: 'adb push "'
                        144     LOAD_FAST                       1: mtd_file_path
                        146     FORMAT_VALUE                    0 (FVC_NONE)
                        148     LOAD_CONST                      6: '" /tmp'
                        150     BUILD_STRING                    3
                        152     PRECALL                         1
                        156     CALL                            1
                        166     POP_TOP                         
                        168     LOAD_FAST                       0: self
                        170     LOAD_METHOD                     3: execute_adb_command
                        192     LOAD_CONST                      5: 'adb push "'
                        194     LOAD_GLOBAL                     8: os
                        206     LOAD_ATTR                       5: path
                        216     LOAD_METHOD                     6: join
                        238     LOAD_FAST                       0: self
                        240     LOAD_ATTR                       7: script_directory
                        250     LOAD_CONST                      7: 'flashcp'
                        252     PRECALL                         2
                        256     CALL                            2
                        266     FORMAT_VALUE                    0 (FVC_NONE)
                        268     LOAD_CONST                      6: '" /tmp'
                        270     BUILD_STRING                    3
                        272     PRECALL                         1
                        276     CALL                            1
                        286     POP_TOP                         
                        288     LOAD_FAST                       0: self
                        290     LOAD_METHOD                     3: execute_adb_command
                        312     LOAD_CONST                      5: 'adb push "'
                        314     LOAD_GLOBAL                     8: os
                        326     LOAD_ATTR                       5: path
                        336     LOAD_METHOD                     6: join
                        358     LOAD_FAST                       0: self
                        360     LOAD_ATTR                       7: script_directory
                        370     LOAD_CONST                      8: 'screen'
                        372     PRECALL                         2
                        376     CALL                            2
                        386     FORMAT_VALUE                    0 (FVC_NONE)
                        388     LOAD_CONST                      6: '" /tmp'
                        390     BUILD_STRING                    3
                        392     PRECALL                         1
                        396     CALL                            1
                        406     POP_TOP                         
                        408     LOAD_GLOBAL                     17: NULL + QTimer
                        420     LOAD_ATTR                       9: singleShot
                        430     LOAD_CONST                      9: 1000
                        432     LOAD_FAST                       0: self
                        434     LOAD_ATTR                       10: execute_dd_commands
                        444     PRECALL                         2
                        448     CALL                            2
                        458     POP_TOP                         
                        460     LOAD_CONST                      0: None
                        462     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: execute_dd_commands
                    Qualified Name: ADToolWindow.execute_dd_commands
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'basename'
                        'mtd_file_path'
                        'execute_shell_command'
                        'QTimer'
                        'singleShot'
                        'check_flash_process'
                    [Locals+Names]
                        'self'
                        'mtd_file_name'
                    [Constants]
                        None
                        'mount -o remount,rw /'
                        'cd /'
                        './sbin/fota_release_space.sh'
                        'cd /tmp'
                        'chmod +x flashcp screen'
                        './screen -dmS mtd_flash ./flashcp ./'
                        ' /dev/mtd4 -v'
                        6000
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: basename
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: mtd_file_path
                        58      PRECALL                         1
                        62      CALL                            1
                        72      STORE_FAST                      1: mtd_file_name
                        74      LOAD_FAST                       0: self
                        76      LOAD_METHOD                     4: execute_shell_command
                        98      LOAD_CONST                      1: 'mount -o remount,rw /'
                        100     PRECALL                         1
                        104     CALL                            1
                        114     POP_TOP                         
                        116     LOAD_FAST                       0: self
                        118     LOAD_METHOD                     4: execute_shell_command
                        140     LOAD_CONST                      2: 'cd /'
                        142     PRECALL                         1
                        146     CALL                            1
                        156     POP_TOP                         
                        158     LOAD_FAST                       0: self
                        160     LOAD_METHOD                     4: execute_shell_command
                        182     LOAD_CONST                      3: './sbin/fota_release_space.sh'
                        184     PRECALL                         1
                        188     CALL                            1
                        198     POP_TOP                         
                        200     LOAD_FAST                       0: self
                        202     LOAD_METHOD                     4: execute_shell_command
                        224     LOAD_CONST                      4: 'cd /tmp'
                        226     PRECALL                         1
                        230     CALL                            1
                        240     POP_TOP                         
                        242     LOAD_FAST                       0: self
                        244     LOAD_METHOD                     4: execute_shell_command
                        266     LOAD_CONST                      5: 'chmod +x flashcp screen'
                        268     PRECALL                         1
                        272     CALL                            1
                        282     POP_TOP                         
                        284     LOAD_FAST                       0: self
                        286     LOAD_METHOD                     4: execute_shell_command
                        308     LOAD_CONST                      6: './screen -dmS mtd_flash ./flashcp ./'
                        310     LOAD_FAST                       1: mtd_file_name
                        312     FORMAT_VALUE                    0 (FVC_NONE)
                        314     LOAD_CONST                      7: ' /dev/mtd4 -v'
                        316     BUILD_STRING                    3
                        318     PRECALL                         1
                        322     CALL                            1
                        332     POP_TOP                         
                        334     LOAD_GLOBAL                     11: NULL + QTimer
                        346     LOAD_ATTR                       6: singleShot
                        356     LOAD_CONST                      8: 6000
                        358     LOAD_FAST                       0: self
                        360     LOAD_ATTR                       7: check_flash_process
                        370     PRECALL                         2
                        374     CALL                            2
                        384     POP_TOP                         
                        386     LOAD_CONST                      0: None
                        388     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: check_flash_process
                    Qualified Name: ADToolWindow.check_flash_process
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'subprocess'
                        'Popen'
                        'PIPE'
                        'CREATE_NO_WINDOW'
                        'communicate'
                        'execute_shell_command'
                        'append_text_signal'
                        'emit'
                        'QTimer'
                        'singleShot'
                        'check_flash_process'
                        'Exception'
                        'str'
                    [Locals+Names]
                        'self'
                        'process'
                        'stdout'
                        'stderr'
                        'e'
                    [Constants]
                        None
                        (
                            'adb'
                            'shell'
                            'cd /tmp && ./screen -ls'
                        )
                        True
                        (
                            'stdout'
                            'stderr'
                            'text'
                            'creationflags'
                        )
                        'No Sockets found'
                        'reboot'
                        '刷写完成，请重启后查看。'
                        '刷写中，请稍候...'
                        6000
                        'Exception occurred while checking flash process: '
                    [Disassembly]
                        0       RESUME                          0
                        2       NOP                             
                        4       LOAD_GLOBAL                     1: NULL + subprocess
                        16      LOAD_ATTR                       1: Popen
                        26      BUILD_LIST                      0
                        28      LOAD_CONST                      1: ('adb', 'shell', 'cd /tmp && ./screen -ls')
                        30      LIST_EXTEND                     1
                        32      LOAD_GLOBAL                     0: subprocess
                        44      LOAD_ATTR                       2: PIPE
                        54      LOAD_GLOBAL                     0: subprocess
                        66      LOAD_ATTR                       2: PIPE
                        76      LOAD_CONST                      2: True
                        78      LOAD_GLOBAL                     0: subprocess
                        90      LOAD_ATTR                       3: CREATE_NO_WINDOW
                        100     KW_NAMES                        3: ('stdout', 'stderr', 'text', 'creationflags')
                        102     PRECALL                         5
                        106     CALL                            5
                        116     STORE_FAST                      1: process
                        118     LOAD_FAST                       1: process
                        120     LOAD_METHOD                     4: communicate
                        142     PRECALL                         0
                        146     CALL                            0
                        156     UNPACK_SEQUENCE                 2
                        160     STORE_FAST                      2: stdout
                        162     STORE_FAST                      3: stderr
                        164     LOAD_CONST                      4: 'No Sockets found'
                        166     LOAD_FAST                       2: stdout
                        168     CONTAINS_OP                     0 (in)
                        170     POP_JUMP_FORWARD_IF_FALSE       49 (to 270)
                        172     LOAD_FAST                       0: self
                        174     LOAD_METHOD                     5: execute_shell_command
                        196     LOAD_CONST                      5: 'reboot'
                        198     PRECALL                         1
                        202     CALL                            1
                        212     POP_TOP                         
                        214     LOAD_FAST                       0: self
                        216     LOAD_ATTR                       6: append_text_signal
                        226     LOAD_METHOD                     7: emit
                        248     LOAD_CONST                      6: '刷写完成，请重启后查看。'
                        250     PRECALL                         1
                        254     CALL                            1
                        264     POP_TOP                         
                        266     LOAD_CONST                      0: None
                        268     RETURN_VALUE                    
                        270     LOAD_FAST                       0: self
                        272     LOAD_ATTR                       6: append_text_signal
                        282     LOAD_METHOD                     7: emit
                        304     LOAD_CONST                      7: '刷写中，请稍候...'
                        306     PRECALL                         1
                        310     CALL                            1
                        320     POP_TOP                         
                        322     LOAD_GLOBAL                     17: NULL + QTimer
                        334     LOAD_ATTR                       9: singleShot
                        344     LOAD_CONST                      8: 6000
                        346     LOAD_FAST                       0: self
                        348     LOAD_ATTR                       10: check_flash_process
                        358     PRECALL                         2
                        362     CALL                            2
                        372     POP_TOP                         
                        374     LOAD_CONST                      0: None
                        376     RETURN_VALUE                    
                        378     PUSH_EXC_INFO                   
                        380     LOAD_GLOBAL                     22: Exception
                        392     CHECK_EXC_MATCH                 
                        394     POP_JUMP_FORWARD_IF_FALSE       53 (to 502)
                        396     STORE_FAST                      4: e
                        398     LOAD_FAST                       0: self
                        400     LOAD_ATTR                       6: append_text_signal
                        410     LOAD_METHOD                     7: emit
                        432     LOAD_CONST                      9: 'Exception occurred while checking flash process: '
                        434     LOAD_GLOBAL                     25: NULL + str
                        446     LOAD_FAST                       4: e
                        448     PRECALL                         1
                        452     CALL                            1
                        462     FORMAT_VALUE                    0 (FVC_NONE)
                        464     BUILD_STRING                    2
                        466     PRECALL                         1
                        470     CALL                            1
                        480     POP_TOP                         
                        482     POP_EXCEPT                      
                        484     LOAD_CONST                      0: None
                        486     STORE_FAST                      4: e
                        488     DELETE_FAST                     4: e
                        490     LOAD_CONST                      0: None
                        492     RETURN_VALUE                    
                        494     LOAD_CONST                      0: None
                        496     STORE_FAST                      4: e
                        498     DELETE_FAST                     4: e
                        500     RERAISE                         1
                        502     RERAISE                         0
                        504     COPY                            3
                        506     POP_EXCEPT                      
                        508     RERAISE                         1
                    [Exception Table]
                        4 to 266 -> 378 [0] 
                        270 to 374 -> 378 [0] 
                        378 to 398 -> 504 [1] lasti
                        398 to 482 -> 494 [1] lasti
                        494 to 504 -> 504 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: start_adb_shell
                    Qualified Name: ADToolWindow.start_adb_shell
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'QProcess'
                        'adb_process'
                        'setProcessChannelMode'
                        'MergedChannels'
                        'readyReadStandardOutput'
                        'connect'
                        'read_output'
                        'start'
                    [Locals+Names]
                        'self'
                        'adb_path'
                    [Constants]
                        None
                        'adb.exe'
                        'shell'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'adb.exe'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      1: adb_path
                        76      LOAD_GLOBAL                     9: NULL + QProcess
                        88      LOAD_FAST                       0: self
                        90      PRECALL                         1
                        94      CALL                            1
                        104     LOAD_FAST                       0: self
                        106     STORE_ATTR                      5: adb_process
                        116     LOAD_FAST                       0: self
                        118     LOAD_ATTR                       5: adb_process
                        128     LOAD_METHOD                     6: setProcessChannelMode
                        150     LOAD_GLOBAL                     8: QProcess
                        162     LOAD_ATTR                       7: MergedChannels
                        172     PRECALL                         1
                        176     CALL                            1
                        186     POP_TOP                         
                        188     LOAD_FAST                       0: self
                        190     LOAD_ATTR                       5: adb_process
                        200     LOAD_ATTR                       8: readyReadStandardOutput
                        210     LOAD_METHOD                     9: connect
                        232     LOAD_FAST                       0: self
                        234     LOAD_ATTR                       10: read_output
                        244     PRECALL                         1
                        248     CALL                            1
                        258     POP_TOP                         
                        260     LOAD_FAST                       0: self
                        262     LOAD_ATTR                       5: adb_process
                        272     LOAD_METHOD                     11: start
                        294     LOAD_FAST                       1: adb_path
                        296     LOAD_CONST                      2: 'shell'
                        298     BUILD_LIST                      1
                        300     PRECALL                         2
                        304     CALL                            2
                        314     POP_TOP                         
                        316     LOAD_CONST                      0: None
                        318     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: read_output
                    Qualified Name: ADToolWindow.read_output
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'adb_process'
                        'readAllStandardOutput'
                        'data'
                        'decode'
                        'append_output_text'
                        'output_text'
                        'ensureCursorVisible'
                    [Locals+Names]
                        'self'
                        'output'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: adb_process
                        14      LOAD_METHOD                     1: readAllStandardOutput
                        36      PRECALL                         0
                        40      CALL                            0
                        50      LOAD_METHOD                     2: data
                        72      PRECALL                         0
                        76      CALL                            0
                        86      LOAD_METHOD                     3: decode
                        108     PRECALL                         0
                        112     CALL                            0
                        122     STORE_FAST                      1: output
                        124     LOAD_FAST                       0: self
                        126     LOAD_METHOD                     4: append_output_text
                        148     LOAD_FAST                       1: output
                        150     PRECALL                         1
                        154     CALL                            1
                        164     POP_TOP                         
                        166     LOAD_FAST                       0: self
                        168     LOAD_ATTR                       5: output_text
                        178     LOAD_METHOD                     6: ensureCursorVisible
                        200     PRECALL                         0
                        204     CALL                            0
                        214     POP_TOP                         
                        216     LOAD_CONST                      0: None
                        218     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: send_adb_command
                    Qualified Name: ADToolWindow.send_adb_command
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'adb_process'
                        'entry'
                        'text'
                        'strip'
                        'write'
                        'encode'
                        'waitForBytesWritten'
                        'clear'
                        'output_text'
                        'ensureCursorVisible'
                    [Locals+Names]
                        'self'
                        'command'
                    [Constants]
                        None
                        '\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: adb_process
                        14      POP_JUMP_FORWARD_IF_FALSE       169 (to 354)
                        16      LOAD_FAST                       0: self
                        18      LOAD_ATTR                       1: entry
                        28      LOAD_METHOD                     2: text
                        50      PRECALL                         0
                        54      CALL                            0
                        64      LOAD_METHOD                     3: strip
                        86      PRECALL                         0
                        90      CALL                            0
                        100     STORE_FAST                      1: command
                        102     LOAD_FAST                       1: command
                        104     POP_JUMP_FORWARD_IF_FALSE       126 (to 358)
                        106     LOAD_FAST                       0: self
                        108     LOAD_ATTR                       0: adb_process
                        118     LOAD_METHOD                     4: write
                        140     LOAD_FAST                       1: command
                        142     LOAD_CONST                      1: '\n'
                        144     BINARY_OP                       0 (+)
                        148     LOAD_METHOD                     5: encode
                        170     PRECALL                         0
                        174     CALL                            0
                        184     PRECALL                         1
                        188     CALL                            1
                        198     POP_TOP                         
                        200     LOAD_FAST                       0: self
                        202     LOAD_ATTR                       0: adb_process
                        212     LOAD_METHOD                     6: waitForBytesWritten
                        234     PRECALL                         0
                        238     CALL                            0
                        248     POP_TOP                         
                        250     LOAD_FAST                       0: self
                        252     LOAD_ATTR                       1: entry
                        262     LOAD_METHOD                     7: clear
                        284     PRECALL                         0
                        288     CALL                            0
                        298     POP_TOP                         
                        300     LOAD_FAST                       0: self
                        302     LOAD_ATTR                       8: output_text
                        312     LOAD_METHOD                     9: ensureCursorVisible
                        334     PRECALL                         0
                        338     CALL                            0
                        348     POP_TOP                         
                        350     LOAD_CONST                      0: None
                        352     RETURN_VALUE                    
                        354     LOAD_CONST                      0: None
                        356     RETURN_VALUE                    
                        358     LOAD_CONST                      0: None
                        360     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: remount_rw
                    Qualified Name: ADToolWindow.remount_rw
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'execute_adb_command'
                    [Locals+Names]
                        'self'
                    [Constants]
                        None
                        'adb shell mount -o remount,rw /'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_METHOD                     0: execute_adb_command
                        26      LOAD_CONST                      1: 'adb shell mount -o remount,rw /'
                        28      PRECALL                         1
                        32      CALL                            1
                        42      POP_TOP                         
                        44      LOAD_CONST                      0: None
                        46      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: closeEvent
                    Qualified Name: ADToolWindow.closeEvent
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 2
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'adb_process'
                        'terminate'
                        'accept'
                    [Locals+Names]
                        'self'
                        'event'
                    [Constants]
                        None
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: adb_process
                        14      POP_JUMP_FORWARD_IF_FALSE       25 (to 66)
                        16      LOAD_FAST                       0: self
                        18      LOAD_ATTR                       0: adb_process
                        28      LOAD_METHOD                     1: terminate
                        50      PRECALL                         0
                        54      CALL                            0
                        64      POP_TOP                         
                        66      LOAD_FAST                       1: event
                        68      LOAD_METHOD                     2: accept
                        90      PRECALL                         0
                        94      CALL                            0
                        104     POP_TOP                         
                        106     LOAD_CONST                      0: None
                        108     RETURN_VALUE                    
                    [Exception Table]
            [Disassembly]
                0       MAKE_CELL                       0: __class__
                2       RESUME                          0
                4       LOAD_NAME                       0: __name__
                6       STORE_NAME                      1: __module__
                8       LOAD_CONST                      0: 'ADToolWindow'
                10      STORE_NAME                      2: __qualname__
                12      PUSH_NULL                       
                14      LOAD_NAME                       3: pyqtSignal
                16      LOAD_NAME                       4: str
                18      PRECALL                         1
                22      CALL                            1
                32      STORE_NAME                      5: append_text_signal
                34      LOAD_CLOSURE                    0: __class__
                36      BUILD_TUPLE                     1
                38      LOAD_CONST                      1: <CODE> __init__
                40      MAKE_FUNCTION                   8
                42      STORE_NAME                      6: __init__
                44      LOAD_CONST                      2: <CODE> set_window_icon
                46      MAKE_FUNCTION                   0
                48      STORE_NAME                      7: set_window_icon
                50      LOAD_CONST                      3: <CODE> init_ui
                52      MAKE_FUNCTION                   0
                54      STORE_NAME                      8: init_ui
                56      LOAD_CONST                      4: <CODE> scan_adb_devices
                58      MAKE_FUNCTION                   0
                60      STORE_NAME                      9: scan_adb_devices
                62      LOAD_CONST                      5: <CODE> set_line_spacing
                64      MAKE_FUNCTION                   0
                66      STORE_NAME                      10: set_line_spacing
                68      LOAD_CONST                      6: <CODE> update_device_status
                70      MAKE_FUNCTION                   0
                72      STORE_NAME                      11: update_device_status
                74      LOAD_CONST                      7: <CODE> execute_adb_command
                76      MAKE_FUNCTION                   0
                78      STORE_NAME                      12: execute_adb_command
                80      LOAD_CONST                      8: <CODE> execute_shell_command
                82      MAKE_FUNCTION                   0
                84      STORE_NAME                      13: execute_shell_command
                86      LOAD_CONST                      9: <CODE> read_process_output
                88      MAKE_FUNCTION                   0
                90      STORE_NAME                      14: read_process_output
                92      LOAD_CONST                      10: <CODE> append_output_text
                94      MAKE_FUNCTION                   0
                96      STORE_NAME                      15: append_output_text
                98      LOAD_CONST                      11: <CODE> upload_and_execute
                100     MAKE_FUNCTION                   0
                102     STORE_NAME                      16: upload_and_execute
                104     LOAD_CONST                      12: <CODE> execute_dd_commands
                106     MAKE_FUNCTION                   0
                108     STORE_NAME                      17: execute_dd_commands
                110     LOAD_CONST                      13: <CODE> check_flash_process
                112     MAKE_FUNCTION                   0
                114     STORE_NAME                      18: check_flash_process
                116     LOAD_CONST                      14: <CODE> start_adb_shell
                118     MAKE_FUNCTION                   0
                120     STORE_NAME                      19: start_adb_shell
                122     LOAD_CONST                      15: <CODE> read_output
                124     MAKE_FUNCTION                   0
                126     STORE_NAME                      20: read_output
                128     LOAD_CONST                      16: <CODE> send_adb_command
                130     MAKE_FUNCTION                   0
                132     STORE_NAME                      21: send_adb_command
                134     LOAD_CONST                      17: <CODE> remount_rw
                136     MAKE_FUNCTION                   0
                138     STORE_NAME                      22: remount_rw
                140     LOAD_CONST                      18: <CODE> closeEvent
                142     MAKE_FUNCTION                   0
                144     STORE_NAME                      23: closeEvent
                146     LOAD_CLOSURE                    0: __class__
                148     COPY                            1
                150     STORE_NAME                      24: __classcell__
                152     RETURN_VALUE                    
            [Exception Table]
        'ADToolWindow'
        [Code]
            File Name: XTOOL_MTD.py
            Object Name: ATToolWindow
            Qualified Name: ATToolWindow
            Arg Count: 0
            Pos Only Arg Count: 0
            KW Only Arg Count: 0
            Stack Size: 2
            Flags: 0x00000000
            [Names]
                '__name__'
                '__module__'
                '__qualname__'
                '__init__'
                'set_window_icon'
                'init_ui'
                'scan_at_serial_ports'
                'send_at_command'
                'set_factory_mode'
                'set_factory_mode_'
                'change_modimei'
                'change_modimei_'
                'change_modimei__'
                '__classcell__'
            [Locals+Names]
                '__class__'
            [Constants]
                'ATToolWindow'
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: __init__
                    Qualified Name: ATToolWindow.__init__
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'super'
                        '__init__'
                        'setWindowTitle'
                        'script_directory'
                        'set_window_icon'
                        'init_ui'
                    [Locals+Names]
                        'self'
                        'script_directory'
                        '__class__'
                    [Constants]
                        None
                        'AT工具'
                    [Disassembly]
                        0       COPY_FREE_VARS                  1
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + super
                        16      PRECALL                         0
                        20      CALL                            0
                        30      LOAD_METHOD                     1: __init__
                        52      PRECALL                         0
                        56      CALL                            0
                        66      POP_TOP                         
                        68      LOAD_FAST                       0: self
                        70      LOAD_METHOD                     2: setWindowTitle
                        92      LOAD_CONST                      1: 'AT工具'
                        94      PRECALL                         1
                        98      CALL                            1
                        108     POP_TOP                         
                        110     LOAD_FAST                       1: script_directory
                        112     LOAD_FAST                       0: self
                        114     STORE_ATTR                      3: script_directory
                        124     LOAD_FAST                       0: self
                        126     LOAD_METHOD                     4: set_window_icon
                        148     PRECALL                         0
                        152     CALL                            0
                        162     POP_TOP                         
                        164     LOAD_FAST                       0: self
                        166     LOAD_METHOD                     5: init_ui
                        188     PRECALL                         0
                        192     CALL                            0
                        202     POP_TOP                         
                        204     LOAD_CONST                      0: None
                        206     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_window_icon
                    Qualified Name: ATToolWindow.set_window_icon
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'os'
                        'path'
                        'join'
                        'script_directory'
                        'exists'
                        'setWindowIcon'
                        'QIcon'
                        'print'
                    [Locals+Names]
                        'self'
                        'icon_path'
                    [Constants]
                        None
                        'u.ico'
                        'Icon file not found:'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     0: os
                        14      LOAD_ATTR                       1: path
                        24      LOAD_METHOD                     2: join
                        46      LOAD_FAST                       0: self
                        48      LOAD_ATTR                       3: script_directory
                        58      LOAD_CONST                      1: 'u.ico'
                        60      PRECALL                         2
                        64      CALL                            2
                        74      STORE_FAST                      1: icon_path
                        76      LOAD_GLOBAL                     0: os
                        88      LOAD_ATTR                       1: path
                        98      LOAD_METHOD                     4: exists
                        120     LOAD_FAST                       1: icon_path
                        122     PRECALL                         1
                        126     CALL                            1
                        136     POP_JUMP_FORWARD_IF_FALSE       36 (to 210)
                        138     LOAD_FAST                       0: self
                        140     LOAD_METHOD                     5: setWindowIcon
                        162     LOAD_GLOBAL                     13: NULL + QIcon
                        174     LOAD_FAST                       1: icon_path
                        176     PRECALL                         1
                        180     CALL                            1
                        190     PRECALL                         1
                        194     CALL                            1
                        204     POP_TOP                         
                        206     LOAD_CONST                      0: None
                        208     RETURN_VALUE                    
                        210     LOAD_GLOBAL                     15: NULL + print
                        222     LOAD_CONST                      2: 'Icon file not found:'
                        224     LOAD_FAST                       1: icon_path
                        226     PRECALL                         2
                        230     CALL                            2
                        240     POP_TOP                         
                        242     LOAD_CONST                      0: None
                        244     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: init_ui
                    Qualified Name: ATToolWindow.init_ui
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 7
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QVBoxLayout'
                        'QTextEdit'
                        'output_text'
                        'setReadOnly'
                        'addWidget'
                        'QHBoxLayout'
                        'QLabel'
                        'setAlignment'
                        'Qt'
                        'AlignLeft'
                        'QComboBox'
                        'port_combo'
                        'addItems'
                        'scan_at_serial_ports'
                        'addLayout'
                        'QGridLayout'
                        'QPushButton'
                        'clicked'
                        'connect'
                        'setSizePolicy'
                        'QSizePolicy'
                        'Expanding'
                        'Preferred'
                        'QLineEdit'
                        'imei_entry'
                        'change_modimei'
                        'imei_entry_2'
                        'change_modimei_'
                        'imei_entry_3'
                        'change_modimei__'
                        'entry'
                        'setLayout'
                    [Locals+Names]
                        'self'
                        'layout'
                        'top_layout'
                        'port_label'
                        'grid_layout'
                        'factory_on_button'
                        'factory_off_button'
                        'query_band_button'
                        'factory_on_button_'
                        'factory_off_button_'
                        'query_band_button_'
                        'imei_label'
                        'change_imei_button'
                        'imei_label_2'
                        'change_imei_button_2'
                        'imei_label_3'
                        'change_imei_button_3'
                        'entry_label'
                        'send_button'
                    [Constants]
                        None
                        True
                        '选择AT串口:'
                        '开启ZXIC工厂模式'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'set_factory_mode'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                1
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: set_factory_mode
                                28      LOAD_CONST                      1: 1
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        0
                        '关闭ZXIC工厂模式'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'set_factory_mode'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                0
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: set_factory_mode
                                28      LOAD_CONST                      1: 0
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        1
                        '查询ZXIC频段'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'send_at_command'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                'AT+ZLTEAMTBAND?'
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: send_at_command
                                28      LOAD_CONST                      1: 'AT+ZLTEAMTBAND?'
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        2
                        '开启A-SR工厂模式'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'set_factory_mode_'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                1
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: set_factory_mode_
                                28      LOAD_CONST                      1: 1
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        '关闭A-SR工厂模式'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'set_factory_mode_'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                0
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: set_factory_mode_
                                28      LOAD_CONST                      1: 0
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        '查询A-SR频段'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 3
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'send_at_command'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                                'AT*BAND?'
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: send_at_command
                                28      LOAD_CONST                      1: 'AT*BAND?'
                                30      PRECALL                         1
                                34      CALL                            1
                                44      RETURN_VALUE                    
                            [Exception Table]
                        ' ZXIC设备改川:'
                        '执行命令'
                        3
                        ' A-SR设备改川:'
                        ' A-SR改序列号:'
                        4
                        ' AT命令输入框:'
                        5
                        '发送命令'
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <lambda>
                            Qualified Name: ATToolWindow.init_ui.<locals>.<lambda>
                            Arg Count: 0
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 4
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'send_at_command'
                                'entry'
                                'text'
                            [Locals+Names]
                                'self'
                            [Constants]
                                None
                            [Disassembly]
                                0       COPY_FREE_VARS                  1
                                2       RESUME                          0
                                4       LOAD_DEREF                      0: self
                                6       LOAD_METHOD                     0: send_at_command
                                28      LOAD_DEREF                      0: self
                                30      LOAD_ATTR                       1: entry
                                40      LOAD_METHOD                     2: text
                                62      PRECALL                         0
                                66      CALL                            0
                                76      PRECALL                         1
                                80      CALL                            1
                                90      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       MAKE_CELL                       0: self
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + QVBoxLayout
                        16      PRECALL                         0
                        20      CALL                            0
                        30      STORE_FAST                      1: layout
                        32      LOAD_GLOBAL                     3: NULL + QTextEdit
                        44      LOAD_DEREF                      0: self
                        46      PRECALL                         1
                        50      CALL                            1
                        60      LOAD_DEREF                      0: self
                        62      STORE_ATTR                      2: output_text
                        72      LOAD_DEREF                      0: self
                        74      LOAD_ATTR                       2: output_text
                        84      LOAD_METHOD                     3: setReadOnly
                        106     LOAD_CONST                      1: True
                        108     PRECALL                         1
                        112     CALL                            1
                        122     POP_TOP                         
                        124     LOAD_FAST                       1: layout
                        126     LOAD_METHOD                     4: addWidget
                        148     LOAD_DEREF                      0: self
                        150     LOAD_ATTR                       2: output_text
                        160     PRECALL                         1
                        164     CALL                            1
                        174     POP_TOP                         
                        176     LOAD_GLOBAL                     11: NULL + QHBoxLayout
                        188     PRECALL                         0
                        192     CALL                            0
                        202     STORE_FAST                      2: top_layout
                        204     LOAD_GLOBAL                     13: NULL + QLabel
                        216     LOAD_CONST                      2: '选择AT串口:'
                        218     PRECALL                         1
                        222     CALL                            1
                        232     STORE_FAST                      3: port_label
                        234     LOAD_FAST                       3: port_label
                        236     LOAD_METHOD                     7: setAlignment
                        258     LOAD_GLOBAL                     16: Qt
                        270     LOAD_ATTR                       9: AlignLeft
                        280     PRECALL                         1
                        284     CALL                            1
                        294     POP_TOP                         
                        296     LOAD_FAST                       2: top_layout
                        298     LOAD_METHOD                     4: addWidget
                        320     LOAD_FAST                       3: port_label
                        322     PRECALL                         1
                        326     CALL                            1
                        336     POP_TOP                         
                        338     LOAD_GLOBAL                     21: NULL + QComboBox
                        350     PRECALL                         0
                        354     CALL                            0
                        364     LOAD_DEREF                      0: self
                        366     STORE_ATTR                      11: port_combo
                        376     LOAD_DEREF                      0: self
                        378     LOAD_ATTR                       11: port_combo
                        388     LOAD_METHOD                     12: addItems
                        410     LOAD_DEREF                      0: self
                        412     LOAD_METHOD                     13: scan_at_serial_ports
                        434     PRECALL                         0
                        438     CALL                            0
                        448     PRECALL                         1
                        452     CALL                            1
                        462     POP_TOP                         
                        464     LOAD_FAST                       2: top_layout
                        466     LOAD_METHOD                     4: addWidget
                        488     LOAD_DEREF                      0: self
                        490     LOAD_ATTR                       11: port_combo
                        500     PRECALL                         1
                        504     CALL                            1
                        514     POP_TOP                         
                        516     LOAD_FAST                       1: layout
                        518     LOAD_METHOD                     14: addLayout
                        540     LOAD_FAST                       2: top_layout
                        542     PRECALL                         1
                        546     CALL                            1
                        556     POP_TOP                         
                        558     LOAD_GLOBAL                     31: NULL + QGridLayout
                        570     PRECALL                         0
                        574     CALL                            0
                        584     STORE_FAST                      4: grid_layout
                        586     LOAD_GLOBAL                     33: NULL + QPushButton
                        598     LOAD_CONST                      3: '开启ZXIC工厂模式'
                        600     PRECALL                         1
                        604     CALL                            1
                        614     STORE_FAST                      5: factory_on_button
                        616     LOAD_FAST                       5: factory_on_button
                        618     LOAD_ATTR                       17: clicked
                        628     LOAD_METHOD                     18: connect
                        650     LOAD_CLOSURE                    0: self
                        652     BUILD_TUPLE                     1
                        654     LOAD_CONST                      4: <CODE> <lambda>
                        656     MAKE_FUNCTION                   8
                        658     PRECALL                         1
                        662     CALL                            1
                        672     POP_TOP                         
                        674     LOAD_FAST                       5: factory_on_button
                        676     LOAD_METHOD                     19: setSizePolicy
                        698     LOAD_GLOBAL                     40: QSizePolicy
                        710     LOAD_ATTR                       21: Expanding
                        720     LOAD_GLOBAL                     40: QSizePolicy
                        732     LOAD_ATTR                       22: Preferred
                        742     PRECALL                         2
                        746     CALL                            2
                        756     POP_TOP                         
                        758     LOAD_FAST                       4: grid_layout
                        760     LOAD_METHOD                     4: addWidget
                        782     LOAD_FAST                       5: factory_on_button
                        784     LOAD_CONST                      5: 0
                        786     LOAD_CONST                      5: 0
                        788     PRECALL                         3
                        792     CALL                            3
                        802     POP_TOP                         
                        804     LOAD_GLOBAL                     33: NULL + QPushButton
                        816     LOAD_CONST                      6: '关闭ZXIC工厂模式'
                        818     PRECALL                         1
                        822     CALL                            1
                        832     STORE_FAST                      6: factory_off_button
                        834     LOAD_FAST                       6: factory_off_button
                        836     LOAD_ATTR                       17: clicked
                        846     LOAD_METHOD                     18: connect
                        868     LOAD_CLOSURE                    0: self
                        870     BUILD_TUPLE                     1
                        872     LOAD_CONST                      7: <CODE> <lambda>
                        874     MAKE_FUNCTION                   8
                        876     PRECALL                         1
                        880     CALL                            1
                        890     POP_TOP                         
                        892     LOAD_FAST                       6: factory_off_button
                        894     LOAD_METHOD                     19: setSizePolicy
                        916     LOAD_GLOBAL                     40: QSizePolicy
                        928     LOAD_ATTR                       21: Expanding
                        938     LOAD_GLOBAL                     40: QSizePolicy
                        950     LOAD_ATTR                       22: Preferred
                        960     PRECALL                         2
                        964     CALL                            2
                        974     POP_TOP                         
                        976     LOAD_FAST                       4: grid_layout
                        978     LOAD_METHOD                     4: addWidget
                        1000    LOAD_FAST                       6: factory_off_button
                        1002    LOAD_CONST                      5: 0
                        1004    LOAD_CONST                      8: 1
                        1006    PRECALL                         3
                        1010    CALL                            3
                        1020    POP_TOP                         
                        1022    LOAD_GLOBAL                     33: NULL + QPushButton
                        1034    LOAD_CONST                      9: '查询ZXIC频段'
                        1036    PRECALL                         1
                        1040    CALL                            1
                        1050    STORE_FAST                      7: query_band_button
                        1052    LOAD_FAST                       7: query_band_button
                        1054    LOAD_ATTR                       17: clicked
                        1064    LOAD_METHOD                     18: connect
                        1086    LOAD_CLOSURE                    0: self
                        1088    BUILD_TUPLE                     1
                        1090    LOAD_CONST                      10: <CODE> <lambda>
                        1092    MAKE_FUNCTION                   8
                        1094    PRECALL                         1
                        1098    CALL                            1
                        1108    POP_TOP                         
                        1110    LOAD_FAST                       7: query_band_button
                        1112    LOAD_METHOD                     19: setSizePolicy
                        1134    LOAD_GLOBAL                     40: QSizePolicy
                        1146    LOAD_ATTR                       21: Expanding
                        1156    LOAD_GLOBAL                     40: QSizePolicy
                        1168    LOAD_ATTR                       22: Preferred
                        1178    PRECALL                         2
                        1182    CALL                            2
                        1192    POP_TOP                         
                        1194    LOAD_FAST                       4: grid_layout
                        1196    LOAD_METHOD                     4: addWidget
                        1218    LOAD_FAST                       7: query_band_button
                        1220    LOAD_CONST                      5: 0
                        1222    LOAD_CONST                      11: 2
                        1224    LOAD_CONST                      8: 1
                        1226    LOAD_CONST                      11: 2
                        1228    PRECALL                         5
                        1232    CALL                            5
                        1242    POP_TOP                         
                        1244    LOAD_GLOBAL                     33: NULL + QPushButton
                        1256    LOAD_CONST                      12: '开启A-SR工厂模式'
                        1258    PRECALL                         1
                        1262    CALL                            1
                        1272    STORE_FAST                      8: factory_on_button_
                        1274    LOAD_FAST                       8: factory_on_button_
                        1276    LOAD_ATTR                       17: clicked
                        1286    LOAD_METHOD                     18: connect
                        1308    LOAD_CLOSURE                    0: self
                        1310    BUILD_TUPLE                     1
                        1312    LOAD_CONST                      13: <CODE> <lambda>
                        1314    MAKE_FUNCTION                   8
                        1316    PRECALL                         1
                        1320    CALL                            1
                        1330    POP_TOP                         
                        1332    LOAD_FAST                       8: factory_on_button_
                        1334    LOAD_METHOD                     19: setSizePolicy
                        1356    LOAD_GLOBAL                     40: QSizePolicy
                        1368    LOAD_ATTR                       21: Expanding
                        1378    LOAD_GLOBAL                     40: QSizePolicy
                        1390    LOAD_ATTR                       22: Preferred
                        1400    PRECALL                         2
                        1404    CALL                            2
                        1414    POP_TOP                         
                        1416    LOAD_FAST                       4: grid_layout
                        1418    LOAD_METHOD                     4: addWidget
                        1440    LOAD_FAST                       8: factory_on_button_
                        1442    LOAD_CONST                      8: 1
                        1444    LOAD_CONST                      5: 0
                        1446    PRECALL                         3
                        1450    CALL                            3
                        1460    POP_TOP                         
                        1462    LOAD_GLOBAL                     33: NULL + QPushButton
                        1474    LOAD_CONST                      14: '关闭A-SR工厂模式'
                        1476    PRECALL                         1
                        1480    CALL                            1
                        1490    STORE_FAST                      9: factory_off_button_
                        1492    LOAD_FAST                       9: factory_off_button_
                        1494    LOAD_ATTR                       17: clicked
                        1504    LOAD_METHOD                     18: connect
                        1526    LOAD_CLOSURE                    0: self
                        1528    BUILD_TUPLE                     1
                        1530    LOAD_CONST                      15: <CODE> <lambda>
                        1532    MAKE_FUNCTION                   8
                        1534    PRECALL                         1
                        1538    CALL                            1
                        1548    POP_TOP                         
                        1550    LOAD_FAST                       9: factory_off_button_
                        1552    LOAD_METHOD                     19: setSizePolicy
                        1574    LOAD_GLOBAL                     40: QSizePolicy
                        1586    LOAD_ATTR                       21: Expanding
                        1596    LOAD_GLOBAL                     40: QSizePolicy
                        1608    LOAD_ATTR                       22: Preferred
                        1618    PRECALL                         2
                        1622    CALL                            2
                        1632    POP_TOP                         
                        1634    LOAD_FAST                       4: grid_layout
                        1636    LOAD_METHOD                     4: addWidget
                        1658    LOAD_FAST                       9: factory_off_button_
                        1660    LOAD_CONST                      8: 1
                        1662    LOAD_CONST                      8: 1
                        1664    PRECALL                         3
                        1668    CALL                            3
                        1678    POP_TOP                         
                        1680    LOAD_GLOBAL                     33: NULL + QPushButton
                        1692    LOAD_CONST                      16: '查询A-SR频段'
                        1694    PRECALL                         1
                        1698    CALL                            1
                        1708    STORE_FAST                      10: query_band_button_
                        1710    LOAD_FAST                       10: query_band_button_
                        1712    LOAD_ATTR                       17: clicked
                        1722    LOAD_METHOD                     18: connect
                        1744    LOAD_CLOSURE                    0: self
                        1746    BUILD_TUPLE                     1
                        1748    LOAD_CONST                      17: <CODE> <lambda>
                        1750    MAKE_FUNCTION                   8
                        1752    PRECALL                         1
                        1756    CALL                            1
                        1766    POP_TOP                         
                        1768    LOAD_FAST                       10: query_band_button_
                        1770    LOAD_METHOD                     19: setSizePolicy
                        1792    LOAD_GLOBAL                     40: QSizePolicy
                        1804    LOAD_ATTR                       21: Expanding
                        1814    LOAD_GLOBAL                     40: QSizePolicy
                        1826    LOAD_ATTR                       22: Preferred
                        1836    PRECALL                         2
                        1840    CALL                            2
                        1850    POP_TOP                         
                        1852    LOAD_FAST                       4: grid_layout
                        1854    LOAD_METHOD                     4: addWidget
                        1876    LOAD_FAST                       10: query_band_button_
                        1878    LOAD_CONST                      8: 1
                        1880    LOAD_CONST                      11: 2
                        1882    LOAD_CONST                      8: 1
                        1884    LOAD_CONST                      11: 2
                        1886    PRECALL                         5
                        1890    CALL                            5
                        1900    POP_TOP                         
                        1902    LOAD_GLOBAL                     13: NULL + QLabel
                        1914    LOAD_CONST                      18: ' ZXIC设备改川:'
                        1916    PRECALL                         1
                        1920    CALL                            1
                        1930    STORE_FAST                      11: imei_label
                        1932    LOAD_FAST                       11: imei_label
                        1934    LOAD_METHOD                     7: setAlignment
                        1956    LOAD_GLOBAL                     16: Qt
                        1968    LOAD_ATTR                       9: AlignLeft
                        1978    PRECALL                         1
                        1982    CALL                            1
                        1992    POP_TOP                         
                        1994    LOAD_FAST                       4: grid_layout
                        1996    LOAD_METHOD                     4: addWidget
                        2018    LOAD_FAST                       11: imei_label
                        2020    LOAD_CONST                      11: 2
                        2022    LOAD_CONST                      5: 0
                        2024    PRECALL                         3
                        2028    CALL                            3
                        2038    POP_TOP                         
                        2040    LOAD_GLOBAL                     47: NULL + QLineEdit
                        2052    PRECALL                         0
                        2056    CALL                            0
                        2066    LOAD_DEREF                      0: self
                        2068    STORE_ATTR                      24: imei_entry
                        2078    LOAD_FAST                       4: grid_layout
                        2080    LOAD_METHOD                     4: addWidget
                        2102    LOAD_DEREF                      0: self
                        2104    LOAD_ATTR                       24: imei_entry
                        2114    LOAD_CONST                      11: 2
                        2116    LOAD_CONST                      8: 1
                        2118    LOAD_CONST                      8: 1
                        2120    LOAD_CONST                      11: 2
                        2122    PRECALL                         5
                        2126    CALL                            5
                        2136    POP_TOP                         
                        2138    LOAD_GLOBAL                     33: NULL + QPushButton
                        2150    LOAD_CONST                      19: '执行命令'
                        2152    PRECALL                         1
                        2156    CALL                            1
                        2166    STORE_FAST                      12: change_imei_button
                        2168    LOAD_FAST                       12: change_imei_button
                        2170    LOAD_ATTR                       17: clicked
                        2180    LOAD_METHOD                     18: connect
                        2202    LOAD_DEREF                      0: self
                        2204    LOAD_ATTR                       25: change_modimei
                        2214    PRECALL                         1
                        2218    CALL                            1
                        2228    POP_TOP                         
                        2230    LOAD_FAST                       4: grid_layout
                        2232    LOAD_METHOD                     4: addWidget
                        2254    LOAD_FAST                       12: change_imei_button
                        2256    LOAD_CONST                      11: 2
                        2258    LOAD_CONST                      20: 3
                        2260    PRECALL                         3
                        2264    CALL                            3
                        2274    POP_TOP                         
                        2276    LOAD_GLOBAL                     13: NULL + QLabel
                        2288    LOAD_CONST                      21: ' A-SR设备改川:'
                        2290    PRECALL                         1
                        2294    CALL                            1
                        2304    STORE_FAST                      13: imei_label_2
                        2306    LOAD_FAST                       13: imei_label_2
                        2308    LOAD_METHOD                     7: setAlignment
                        2330    LOAD_GLOBAL                     16: Qt
                        2342    LOAD_ATTR                       9: AlignLeft
                        2352    PRECALL                         1
                        2356    CALL                            1
                        2366    POP_TOP                         
                        2368    LOAD_FAST                       4: grid_layout
                        2370    LOAD_METHOD                     4: addWidget
                        2392    LOAD_FAST                       13: imei_label_2
                        2394    LOAD_CONST                      20: 3
                        2396    LOAD_CONST                      5: 0
                        2398    PRECALL                         3
                        2402    CALL                            3
                        2412    POP_TOP                         
                        2414    LOAD_GLOBAL                     47: NULL + QLineEdit
                        2426    PRECALL                         0
                        2430    CALL                            0
                        2440    LOAD_DEREF                      0: self
                        2442    STORE_ATTR                      26: imei_entry_2
                        2452    LOAD_FAST                       4: grid_layout
                        2454    LOAD_METHOD                     4: addWidget
                        2476    LOAD_DEREF                      0: self
                        2478    LOAD_ATTR                       26: imei_entry_2
                        2488    LOAD_CONST                      20: 3
                        2490    LOAD_CONST                      8: 1
                        2492    LOAD_CONST                      8: 1
                        2494    LOAD_CONST                      11: 2
                        2496    PRECALL                         5
                        2500    CALL                            5
                        2510    POP_TOP                         
                        2512    LOAD_GLOBAL                     33: NULL + QPushButton
                        2524    LOAD_CONST                      19: '执行命令'
                        2526    PRECALL                         1
                        2530    CALL                            1
                        2540    STORE_FAST                      14: change_imei_button_2
                        2542    LOAD_FAST                       14: change_imei_button_2
                        2544    LOAD_ATTR                       17: clicked
                        2554    LOAD_METHOD                     18: connect
                        2576    LOAD_DEREF                      0: self
                        2578    LOAD_ATTR                       27: change_modimei_
                        2588    PRECALL                         1
                        2592    CALL                            1
                        2602    POP_TOP                         
                        2604    LOAD_FAST                       4: grid_layout
                        2606    LOAD_METHOD                     4: addWidget
                        2628    LOAD_FAST                       14: change_imei_button_2
                        2630    LOAD_CONST                      20: 3
                        2632    LOAD_CONST                      20: 3
                        2634    PRECALL                         3
                        2638    CALL                            3
                        2648    POP_TOP                         
                        2650    LOAD_GLOBAL                     13: NULL + QLabel
                        2662    LOAD_CONST                      22: ' A-SR改序列号:'
                        2664    PRECALL                         1
                        2668    CALL                            1
                        2678    STORE_FAST                      15: imei_label_3
                        2680    LOAD_FAST                       15: imei_label_3
                        2682    LOAD_METHOD                     7: setAlignment
                        2704    LOAD_GLOBAL                     16: Qt
                        2716    LOAD_ATTR                       9: AlignLeft
                        2726    PRECALL                         1
                        2730    CALL                            1
                        2740    POP_TOP                         
                        2742    LOAD_FAST                       4: grid_layout
                        2744    LOAD_METHOD                     4: addWidget
                        2766    LOAD_FAST                       15: imei_label_3
                        2768    LOAD_CONST                      23: 4
                        2770    LOAD_CONST                      5: 0
                        2772    PRECALL                         3
                        2776    CALL                            3
                        2786    POP_TOP                         
                        2788    LOAD_GLOBAL                     47: NULL + QLineEdit
                        2800    PRECALL                         0
                        2804    CALL                            0
                        2814    LOAD_DEREF                      0: self
                        2816    STORE_ATTR                      28: imei_entry_3
                        2826    LOAD_FAST                       4: grid_layout
                        2828    LOAD_METHOD                     4: addWidget
                        2850    LOAD_DEREF                      0: self
                        2852    LOAD_ATTR                       28: imei_entry_3
                        2862    LOAD_CONST                      23: 4
                        2864    LOAD_CONST                      8: 1
                        2866    LOAD_CONST                      8: 1
                        2868    LOAD_CONST                      11: 2
                        2870    PRECALL                         5
                        2874    CALL                            5
                        2884    POP_TOP                         
                        2886    LOAD_GLOBAL                     33: NULL + QPushButton
                        2898    LOAD_CONST                      19: '执行命令'
                        2900    PRECALL                         1
                        2904    CALL                            1
                        2914    STORE_FAST                      16: change_imei_button_3
                        2916    LOAD_FAST                       16: change_imei_button_3
                        2918    LOAD_ATTR                       17: clicked
                        2928    LOAD_METHOD                     18: connect
                        2950    LOAD_DEREF                      0: self
                        2952    LOAD_ATTR                       29: change_modimei__
                        2962    PRECALL                         1
                        2966    CALL                            1
                        2976    POP_TOP                         
                        2978    LOAD_FAST                       4: grid_layout
                        2980    LOAD_METHOD                     4: addWidget
                        3002    LOAD_FAST                       16: change_imei_button_3
                        3004    LOAD_CONST                      23: 4
                        3006    LOAD_CONST                      20: 3
                        3008    PRECALL                         3
                        3012    CALL                            3
                        3022    POP_TOP                         
                        3024    LOAD_GLOBAL                     13: NULL + QLabel
                        3036    LOAD_CONST                      24: ' AT命令输入框:'
                        3038    PRECALL                         1
                        3042    CALL                            1
                        3052    STORE_FAST                      17: entry_label
                        3054    LOAD_FAST                       17: entry_label
                        3056    LOAD_METHOD                     7: setAlignment
                        3078    LOAD_GLOBAL                     16: Qt
                        3090    LOAD_ATTR                       9: AlignLeft
                        3100    PRECALL                         1
                        3104    CALL                            1
                        3114    POP_TOP                         
                        3116    LOAD_FAST                       4: grid_layout
                        3118    LOAD_METHOD                     4: addWidget
                        3140    LOAD_FAST                       17: entry_label
                        3142    LOAD_CONST                      25: 5
                        3144    LOAD_CONST                      5: 0
                        3146    PRECALL                         3
                        3150    CALL                            3
                        3160    POP_TOP                         
                        3162    LOAD_GLOBAL                     47: NULL + QLineEdit
                        3174    PRECALL                         0
                        3178    CALL                            0
                        3188    LOAD_DEREF                      0: self
                        3190    STORE_ATTR                      30: entry
                        3200    LOAD_FAST                       4: grid_layout
                        3202    LOAD_METHOD                     4: addWidget
                        3224    LOAD_DEREF                      0: self
                        3226    LOAD_ATTR                       30: entry
                        3236    LOAD_CONST                      25: 5
                        3238    LOAD_CONST                      8: 1
                        3240    LOAD_CONST                      8: 1
                        3242    LOAD_CONST                      11: 2
                        3244    PRECALL                         5
                        3248    CALL                            5
                        3258    POP_TOP                         
                        3260    LOAD_GLOBAL                     33: NULL + QPushButton
                        3272    LOAD_CONST                      26: '发送命令'
                        3274    PRECALL                         1
                        3278    CALL                            1
                        3288    STORE_FAST                      18: send_button
                        3290    LOAD_FAST                       18: send_button
                        3292    LOAD_ATTR                       17: clicked
                        3302    LOAD_METHOD                     18: connect
                        3324    LOAD_CLOSURE                    0: self
                        3326    BUILD_TUPLE                     1
                        3328    LOAD_CONST                      27: <CODE> <lambda>
                        3330    MAKE_FUNCTION                   8
                        3332    PRECALL                         1
                        3336    CALL                            1
                        3346    POP_TOP                         
                        3348    LOAD_FAST                       4: grid_layout
                        3350    LOAD_METHOD                     4: addWidget
                        3372    LOAD_FAST                       18: send_button
                        3374    LOAD_CONST                      25: 5
                        3376    LOAD_CONST                      20: 3
                        3378    PRECALL                         3
                        3382    CALL                            3
                        3392    POP_TOP                         
                        3394    LOAD_FAST                       1: layout
                        3396    LOAD_METHOD                     14: addLayout
                        3418    LOAD_FAST                       4: grid_layout
                        3420    PRECALL                         1
                        3424    CALL                            1
                        3434    POP_TOP                         
                        3436    LOAD_DEREF                      0: self
                        3438    LOAD_METHOD                     31: setLayout
                        3460    LOAD_FAST                       1: layout
                        3462    PRECALL                         1
                        3466    CALL                            1
                        3476    POP_TOP                         
                        3478    LOAD_CONST                      0: None
                        3480    RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: scan_at_serial_ports
                    Qualified Name: ATToolWindow.scan_at_serial_ports
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 3
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'list_ports'
                        'comports'
                    [Locals+Names]
                        'self'
                        'at_port_list'
                    [Constants]
                        None
                        [Code]
                            File Name: XTOOL_MTD.py
                            Object Name: <listcomp>
                            Qualified Name: ATToolWindow.scan_at_serial_ports.<locals>.<listcomp>
                            Arg Count: 1
                            Pos Only Arg Count: 0
                            KW Only Arg Count: 0
                            Stack Size: 5
                            Flags: 0x00000013 (CO_OPTIMIZED | CO_NEWLOCALS | CO_NESTED)
                            [Names]
                                'description'
                                'upper'
                                'device'
                            [Locals+Names]
                                '.0'
                                'port'
                            [Constants]
                                'AT'
                            [Disassembly]
                                0       RESUME                          0
                                2       BUILD_LIST                      0
                                4       LOAD_FAST                       0: .0
                                6       FOR_ITER                        36 (to 80)
                                8       STORE_FAST                      1: port
                                10      LOAD_CONST                      0: 'AT'
                                12      LOAD_FAST                       1: port
                                14      LOAD_ATTR                       0: description
                                24      LOAD_METHOD                     1: upper
                                46      PRECALL                         0
                                50      CALL                            0
                                60      CONTAINS_OP                     0 (in)
                                62      POP_JUMP_BACKWARD_IF_FALSE      29 (to 6)
                                64      LOAD_FAST                       1: port
                                66      LOAD_ATTR                       2: device
                                76      LIST_APPEND                     2
                                78      JUMP_BACKWARD                   37 (to 6)
                                80      RETURN_VALUE                    
                            [Exception Table]
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_CONST                      1: <CODE> <listcomp>
                        4       MAKE_FUNCTION                   0
                        6       LOAD_GLOBAL                     1: NULL + list_ports
                        18      LOAD_ATTR                       1: comports
                        28      PRECALL                         0
                        32      CALL                            0
                        42      GET_ITER                        
                        44      PRECALL                         0
                        48      CALL                            0
                        58      STORE_FAST                      1: at_port_list
                        60      LOAD_FAST                       1: at_port_list
                        62      RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: send_at_command
                    Qualified Name: ATToolWindow.send_at_command
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 8
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'port_combo'
                        'currentText'
                        'output_text'
                        'setReadOnly'
                        'clear'
                        'serial'
                        'Serial'
                        'isOpen'
                        'write'
                        'encode'
                        'read'
                        'decode'
                        'append'
                        'SerialException'
                    [Locals+Names]
                        'self'
                        'command'
                        'selected_port'
                        'ser'
                        'response'
                        'e'
                    [Constants]
                        None
                        False
                        9600
                        1
                        (
                            'baudrate'
                            'timeout'
                        )
                        '\r\n'
                        100
                        'utf-8'
                        'ignore'
                        '发送的指令: '
                        '\n'
                        '收到的响应: '
                        '无法打开串口 '
                        '串口 '
                        ' 打开失败: '
                        True
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: port_combo
                        14      LOAD_METHOD                     1: currentText
                        36      PRECALL                         0
                        40      CALL                            0
                        50      STORE_FAST                      2: selected_port
                        52      LOAD_FAST                       0: self
                        54      LOAD_ATTR                       2: output_text
                        64      LOAD_METHOD                     3: setReadOnly
                        86      LOAD_CONST                      1: False
                        88      PRECALL                         1
                        92      CALL                            1
                        102     POP_TOP                         
                        104     LOAD_FAST                       0: self
                        106     LOAD_ATTR                       2: output_text
                        116     LOAD_METHOD                     4: clear
                        138     PRECALL                         0
                        142     CALL                            0
                        152     POP_TOP                         
                        154     NOP                             
                        156     LOAD_GLOBAL                     11: NULL + serial
                        168     LOAD_ATTR                       6: Serial
                        178     LOAD_FAST                       2: selected_port
                        180     LOAD_CONST                      2: 9600
                        182     LOAD_CONST                      3: 1
                        184     KW_NAMES                        4: ('baudrate', 'timeout')
                        186     PRECALL                         3
                        190     CALL                            3
                        200     BEFORE_WITH                     
                        202     STORE_FAST                      3: ser
                        204     LOAD_FAST                       3: ser
                        206     LOAD_METHOD                     7: isOpen
                        228     PRECALL                         0
                        232     CALL                            0
                        242     POP_JUMP_FORWARD_IF_FALSE       144 (to 532)
                        244     LOAD_FAST                       3: ser
                        246     LOAD_METHOD                     8: write
                        268     LOAD_FAST                       1: command
                        270     LOAD_CONST                      5: '\r\n'
                        272     BINARY_OP                       0 (+)
                        276     LOAD_METHOD                     9: encode
                        298     PRECALL                         0
                        302     CALL                            0
                        312     PRECALL                         1
                        316     CALL                            1
                        326     POP_TOP                         
                        328     LOAD_FAST                       3: ser
                        330     LOAD_METHOD                     10: read
                        352     LOAD_CONST                      6: 100
                        354     PRECALL                         1
                        358     CALL                            1
                        368     LOAD_METHOD                     11: decode
                        390     LOAD_CONST                      7: 'utf-8'
                        392     LOAD_CONST                      8: 'ignore'
                        394     PRECALL                         2
                        398     CALL                            2
                        408     STORE_FAST                      4: response
                        410     LOAD_FAST                       0: self
                        412     LOAD_ATTR                       2: output_text
                        422     LOAD_METHOD                     12: append
                        444     LOAD_CONST                      9: '发送的指令: '
                        446     LOAD_FAST                       1: command
                        448     FORMAT_VALUE                    0 (FVC_NONE)
                        450     LOAD_CONST                      10: '\n'
                        452     BUILD_STRING                    3
                        454     PRECALL                         1
                        458     CALL                            1
                        468     POP_TOP                         
                        470     LOAD_FAST                       0: self
                        472     LOAD_ATTR                       2: output_text
                        482     LOAD_METHOD                     12: append
                        504     LOAD_CONST                      11: '收到的响应: '
                        506     LOAD_FAST                       4: response
                        508     FORMAT_VALUE                    0 (FVC_NONE)
                        510     LOAD_CONST                      10: '\n'
                        512     BUILD_STRING                    3
                        514     PRECALL                         1
                        518     CALL                            1
                        528     POP_TOP                         
                        530     JUMP_FORWARD                    30 (to 592)
                        532     LOAD_FAST                       0: self
                        534     LOAD_ATTR                       2: output_text
                        544     LOAD_METHOD                     12: append
                        566     LOAD_CONST                      12: '无法打开串口 '
                        568     LOAD_FAST                       2: selected_port
                        570     FORMAT_VALUE                    0 (FVC_NONE)
                        572     LOAD_CONST                      10: '\n'
                        574     BUILD_STRING                    3
                        576     PRECALL                         1
                        580     CALL                            1
                        590     POP_TOP                         
                        592     LOAD_CONST                      0: None
                        594     LOAD_CONST                      0: None
                        596     LOAD_CONST                      0: None
                        598     PRECALL                         2
                        602     CALL                            2
                        612     POP_TOP                         
                        614     JUMP_FORWARD                    11 (to 638)
                        616     PUSH_EXC_INFO                   
                        618     WITH_EXCEPT_START               
                        620     POP_JUMP_FORWARD_IF_TRUE        4 (to 630)
                        622     RERAISE                         2
                        624     COPY                            3
                        626     POP_EXCEPT                      
                        628     RERAISE                         1
                        630     POP_TOP                         
                        632     POP_EXCEPT                      
                        634     POP_TOP                         
                        636     POP_TOP                         
                        638     JUMP_FORWARD                    61 (to 762)
                        640     PUSH_EXC_INFO                   
                        642     LOAD_GLOBAL                     10: serial
                        654     LOAD_ATTR                       13: SerialException
                        664     CHECK_EXC_MATCH                 
                        666     POP_JUMP_FORWARD_IF_FALSE       43 (to 754)
                        668     STORE_FAST                      5: e
                        670     LOAD_FAST                       0: self
                        672     LOAD_ATTR                       2: output_text
                        682     LOAD_METHOD                     12: append
                        704     LOAD_CONST                      13: '串口 '
                        706     LOAD_FAST                       2: selected_port
                        708     FORMAT_VALUE                    0 (FVC_NONE)
                        710     LOAD_CONST                      14: ' 打开失败: '
                        712     LOAD_FAST                       5: e
                        714     FORMAT_VALUE                    0 (FVC_NONE)
                        716     LOAD_CONST                      10: '\n'
                        718     BUILD_STRING                    5
                        720     PRECALL                         1
                        724     CALL                            1
                        734     POP_TOP                         
                        736     POP_EXCEPT                      
                        738     LOAD_CONST                      0: None
                        740     STORE_FAST                      5: e
                        742     DELETE_FAST                     5: e
                        744     JUMP_FORWARD                    8 (to 762)
                        746     LOAD_CONST                      0: None
                        748     STORE_FAST                      5: e
                        750     DELETE_FAST                     5: e
                        752     RERAISE                         1
                        754     RERAISE                         0
                        756     COPY                            3
                        758     POP_EXCEPT                      
                        760     RERAISE                         1
                        762     LOAD_FAST                       0: self
                        764     LOAD_ATTR                       2: output_text
                        774     LOAD_METHOD                     3: setReadOnly
                        796     LOAD_CONST                      15: True
                        798     PRECALL                         1
                        802     CALL                            1
                        812     POP_TOP                         
                        814     LOAD_CONST                      0: None
                        816     RETURN_VALUE                    
                    [Exception Table]
                        156 to 202 -> 640 [0] 
                        202 to 592 -> 616 [1] lasti
                        592 to 616 -> 640 [0] 
                        616 to 624 -> 624 [3] lasti
                        624 to 630 -> 640 [0] 
                        630 to 632 -> 624 [3] lasti
                        632 to 638 -> 640 [0] 
                        640 to 670 -> 756 [1] lasti
                        670 to 736 -> 746 [1] lasti
                        746 to 756 -> 756 [1] lasti
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_factory_mode
                    Qualified Name: ATToolWindow.set_factory_mode
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'send_at_command'
                        'output_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'mode'
                        'command'
                        'mode_text'
                    [Constants]
                        None
                        1
                        'AT+ZMODE=1'
                        'AT+ZMODE=0'
                        '开启'
                        '关闭'
                        '工厂模式\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       1: mode
                        4       LOAD_CONST                      1: 1
                        6       COMPARE_OP                      2 (==)
                        12      POP_JUMP_FORWARD_IF_FALSE       2 (to 18)
                        14      LOAD_CONST                      2: 'AT+ZMODE=1'
                        16      JUMP_FORWARD                    1 (to 20)
                        18      LOAD_CONST                      3: 'AT+ZMODE=0'
                        20      STORE_FAST                      2: command
                        22      LOAD_FAST                       0: self
                        24      LOAD_METHOD                     0: send_at_command
                        46      LOAD_FAST                       2: command
                        48      PRECALL                         1
                        52      CALL                            1
                        62      POP_TOP                         
                        64      LOAD_FAST                       1: mode
                        66      LOAD_CONST                      1: 1
                        68      COMPARE_OP                      2 (==)
                        74      POP_JUMP_FORWARD_IF_FALSE       2 (to 80)
                        76      LOAD_CONST                      4: '开启'
                        78      JUMP_FORWARD                    1 (to 82)
                        80      LOAD_CONST                      5: '关闭'
                        82      STORE_FAST                      3: mode_text
                        84      LOAD_FAST                       0: self
                        86      LOAD_ATTR                       1: output_text
                        96      LOAD_METHOD                     2: append
                        118     LOAD_FAST                       3: mode_text
                        120     FORMAT_VALUE                    0 (FVC_NONE)
                        122     LOAD_CONST                      6: '工厂模式\n'
                        124     BUILD_STRING                    2
                        126     PRECALL                         1
                        130     CALL                            1
                        140     POP_TOP                         
                        142     LOAD_CONST                      0: None
                        144     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: set_factory_mode_
                    Qualified Name: ATToolWindow.set_factory_mode_
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'send_at_command'
                        'output_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'mode'
                        'command'
                        'mode_text'
                    [Constants]
                        None
                        1
                        'AT*PROD=1'
                        'AT*PROD=0'
                        '开启'
                        '关闭'
                        '工厂模式\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       1: mode
                        4       LOAD_CONST                      1: 1
                        6       COMPARE_OP                      2 (==)
                        12      POP_JUMP_FORWARD_IF_FALSE       2 (to 18)
                        14      LOAD_CONST                      2: 'AT*PROD=1'
                        16      JUMP_FORWARD                    1 (to 20)
                        18      LOAD_CONST                      3: 'AT*PROD=0'
                        20      STORE_FAST                      2: command
                        22      LOAD_FAST                       0: self
                        24      LOAD_METHOD                     0: send_at_command
                        46      LOAD_FAST                       2: command
                        48      PRECALL                         1
                        52      CALL                            1
                        62      POP_TOP                         
                        64      LOAD_FAST                       1: mode
                        66      LOAD_CONST                      1: 1
                        68      COMPARE_OP                      2 (==)
                        74      POP_JUMP_FORWARD_IF_FALSE       2 (to 80)
                        76      LOAD_CONST                      4: '开启'
                        78      JUMP_FORWARD                    1 (to 82)
                        80      LOAD_CONST                      5: '关闭'
                        82      STORE_FAST                      3: mode_text
                        84      LOAD_FAST                       0: self
                        86      LOAD_ATTR                       1: output_text
                        96      LOAD_METHOD                     2: append
                        118     LOAD_FAST                       3: mode_text
                        120     FORMAT_VALUE                    0 (FVC_NONE)
                        122     LOAD_CONST                      6: '工厂模式\n'
                        124     BUILD_STRING                    2
                        126     PRECALL                         1
                        130     CALL                            1
                        140     POP_TOP                         
                        142     LOAD_CONST                      0: None
                        144     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: change_modimei
                    Qualified Name: ATToolWindow.change_modimei
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'imei_entry'
                        'text'
                        'strip'
                        'send_at_command'
                        'output_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'imei'
                    [Constants]
                        None
                        'AT+MODIMEI='
                        '已发送命令: '
                        '\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: imei_entry
                        14      LOAD_METHOD                     1: text
                        36      PRECALL                         0
                        40      CALL                            0
                        50      LOAD_METHOD                     2: strip
                        72      PRECALL                         0
                        76      CALL                            0
                        86      STORE_FAST                      1: imei
                        88      LOAD_FAST                       1: imei
                        90      POP_JUMP_FORWARD_IF_FALSE       56 (to 204)
                        92      LOAD_FAST                       0: self
                        94      LOAD_METHOD                     3: send_at_command
                        116     LOAD_CONST                      1: 'AT+MODIMEI='
                        118     LOAD_FAST                       1: imei
                        120     FORMAT_VALUE                    0 (FVC_NONE)
                        122     BUILD_STRING                    2
                        124     PRECALL                         1
                        128     CALL                            1
                        138     POP_TOP                         
                        140     LOAD_FAST                       0: self
                        142     LOAD_ATTR                       4: output_text
                        152     LOAD_METHOD                     5: append
                        174     LOAD_CONST                      2: '已发送命令: '
                        176     LOAD_FAST                       1: imei
                        178     FORMAT_VALUE                    0 (FVC_NONE)
                        180     LOAD_CONST                      3: '\n'
                        182     BUILD_STRING                    3
                        184     PRECALL                         1
                        188     CALL                            1
                        198     POP_TOP                         
                        200     LOAD_CONST                      0: None
                        202     RETURN_VALUE                    
                        204     LOAD_CONST                      0: None
                        206     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: change_modimei_
                    Qualified Name: ATToolWindow.change_modimei_
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'imei_entry_2'
                        'text'
                        'strip'
                        'send_at_command'
                        'output_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'imei'
                    [Constants]
                        None
                        'AT*MRD_IMEI=W,0,01JAN1970,'
                        '已发送命令: '
                        '\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: imei_entry_2
                        14      LOAD_METHOD                     1: text
                        36      PRECALL                         0
                        40      CALL                            0
                        50      LOAD_METHOD                     2: strip
                        72      PRECALL                         0
                        76      CALL                            0
                        86      STORE_FAST                      1: imei
                        88      LOAD_FAST                       1: imei
                        90      POP_JUMP_FORWARD_IF_FALSE       56 (to 204)
                        92      LOAD_FAST                       0: self
                        94      LOAD_METHOD                     3: send_at_command
                        116     LOAD_CONST                      1: 'AT*MRD_IMEI=W,0,01JAN1970,'
                        118     LOAD_FAST                       1: imei
                        120     FORMAT_VALUE                    0 (FVC_NONE)
                        122     BUILD_STRING                    2
                        124     PRECALL                         1
                        128     CALL                            1
                        138     POP_TOP                         
                        140     LOAD_FAST                       0: self
                        142     LOAD_ATTR                       4: output_text
                        152     LOAD_METHOD                     5: append
                        174     LOAD_CONST                      2: '已发送命令: '
                        176     LOAD_FAST                       1: imei
                        178     FORMAT_VALUE                    0 (FVC_NONE)
                        180     LOAD_CONST                      3: '\n'
                        182     BUILD_STRING                    3
                        184     PRECALL                         1
                        188     CALL                            1
                        198     POP_TOP                         
                        200     LOAD_CONST                      0: None
                        202     RETURN_VALUE                    
                        204     LOAD_CONST                      0: None
                        206     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: change_modimei__
                    Qualified Name: ATToolWindow.change_modimei__
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 5
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'imei_entry_3'
                        'text'
                        'strip'
                        'send_at_command'
                        'output_text'
                        'append'
                    [Locals+Names]
                        'self'
                        'imei'
                    [Constants]
                        None
                        'AT*MRD_SN=,'
                        '已发送命令: '
                        '\n'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_FAST                       0: self
                        4       LOAD_ATTR                       0: imei_entry_3
                        14      LOAD_METHOD                     1: text
                        36      PRECALL                         0
                        40      CALL                            0
                        50      LOAD_METHOD                     2: strip
                        72      PRECALL                         0
                        76      CALL                            0
                        86      STORE_FAST                      1: imei
                        88      LOAD_FAST                       1: imei
                        90      POP_JUMP_FORWARD_IF_FALSE       56 (to 204)
                        92      LOAD_FAST                       0: self
                        94      LOAD_METHOD                     3: send_at_command
                        116     LOAD_CONST                      1: 'AT*MRD_SN=,'
                        118     LOAD_FAST                       1: imei
                        120     FORMAT_VALUE                    0 (FVC_NONE)
                        122     BUILD_STRING                    2
                        124     PRECALL                         1
                        128     CALL                            1
                        138     POP_TOP                         
                        140     LOAD_FAST                       0: self
                        142     LOAD_ATTR                       4: output_text
                        152     LOAD_METHOD                     5: append
                        174     LOAD_CONST                      2: '已发送命令: '
                        176     LOAD_FAST                       1: imei
                        178     FORMAT_VALUE                    0 (FVC_NONE)
                        180     LOAD_CONST                      3: '\n'
                        182     BUILD_STRING                    3
                        184     PRECALL                         1
                        188     CALL                            1
                        198     POP_TOP                         
                        200     LOAD_CONST                      0: None
                        202     RETURN_VALUE                    
                        204     LOAD_CONST                      0: None
                        206     RETURN_VALUE                    
                    [Exception Table]
            [Disassembly]
                0       MAKE_CELL                       0: __class__
                2       RESUME                          0
                4       LOAD_NAME                       0: __name__
                6       STORE_NAME                      1: __module__
                8       LOAD_CONST                      0: 'ATToolWindow'
                10      STORE_NAME                      2: __qualname__
                12      LOAD_CLOSURE                    0: __class__
                14      BUILD_TUPLE                     1
                16      LOAD_CONST                      1: <CODE> __init__
                18      MAKE_FUNCTION                   8
                20      STORE_NAME                      3: __init__
                22      LOAD_CONST                      2: <CODE> set_window_icon
                24      MAKE_FUNCTION                   0
                26      STORE_NAME                      4: set_window_icon
                28      LOAD_CONST                      3: <CODE> init_ui
                30      MAKE_FUNCTION                   0
                32      STORE_NAME                      5: init_ui
                34      LOAD_CONST                      4: <CODE> scan_at_serial_ports
                36      MAKE_FUNCTION                   0
                38      STORE_NAME                      6: scan_at_serial_ports
                40      LOAD_CONST                      5: <CODE> send_at_command
                42      MAKE_FUNCTION                   0
                44      STORE_NAME                      7: send_at_command
                46      LOAD_CONST                      6: <CODE> set_factory_mode
                48      MAKE_FUNCTION                   0
                50      STORE_NAME                      8: set_factory_mode
                52      LOAD_CONST                      7: <CODE> set_factory_mode_
                54      MAKE_FUNCTION                   0
                56      STORE_NAME                      9: set_factory_mode_
                58      LOAD_CONST                      8: <CODE> change_modimei
                60      MAKE_FUNCTION                   0
                62      STORE_NAME                      10: change_modimei
                64      LOAD_CONST                      9: <CODE> change_modimei_
                66      MAKE_FUNCTION                   0
                68      STORE_NAME                      11: change_modimei_
                70      LOAD_CONST                      10: <CODE> change_modimei__
                72      MAKE_FUNCTION                   0
                74      STORE_NAME                      12: change_modimei__
                76      LOAD_CLOSURE                    0: __class__
                78      COPY                            1
                80      STORE_NAME                      13: __classcell__
                82      RETURN_VALUE                    
            [Exception Table]
        'ATToolWindow'
        [Code]
            File Name: XTOOL_MTD.py
            Object Name: CommandDialog
            Qualified Name: CommandDialog
            Arg Count: 0
            Pos Only Arg Count: 0
            KW Only Arg Count: 0
            Stack Size: 3
            Flags: 0x00000000
            [Names]
                '__name__'
                '__module__'
                '__qualname__'
                '__init__'
                'backup_clicked'
                'loading_clicked'
                '__classcell__'
            [Locals+Names]
                '__class__'
            [Constants]
                'CommandDialog'
                None
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: __init__
                    Qualified Name: CommandDialog.__init__
                    Arg Count: 2
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'super'
                        '__init__'
                        'setWindowTitle'
                        'setFixedSize'
                        'QVBoxLayout'
                        'QPushButton'
                        'clicked'
                        'connect'
                        'backup_clicked'
                        'addWidget'
                        'loading_clicked'
                        'setLayout'
                        'directory_path'
                        'operation'
                    [Locals+Names]
                        'self'
                        'parent'
                        'layout'
                        'backup_button'
                        'loading_button'
                        '__class__'
                    [Constants]
                        None
                        '选择'
                        200
                        100
                        '备份web后台'
                        '刷入web后台'
                    [Disassembly]
                        0       COPY_FREE_VARS                  1
                        2       RESUME                          0
                        4       LOAD_GLOBAL                     1: NULL + super
                        16      PRECALL                         0
                        20      CALL                            0
                        30      LOAD_METHOD                     1: __init__
                        52      LOAD_FAST                       1: parent
                        54      PRECALL                         1
                        58      CALL                            1
                        68      POP_TOP                         
                        70      LOAD_FAST                       0: self
                        72      LOAD_METHOD                     2: setWindowTitle
                        94      LOAD_CONST                      1: '选择'
                        96      PRECALL                         1
                        100     CALL                            1
                        110     POP_TOP                         
                        112     LOAD_FAST                       0: self
                        114     LOAD_METHOD                     3: setFixedSize
                        136     LOAD_CONST                      2: 200
                        138     LOAD_CONST                      3: 100
                        140     PRECALL                         2
                        144     CALL                            2
                        154     POP_TOP                         
                        156     LOAD_GLOBAL                     9: NULL + QVBoxLayout
                        168     PRECALL                         0
                        172     CALL                            0
                        182     STORE_FAST                      2: layout
                        184     LOAD_GLOBAL                     11: NULL + QPushButton
                        196     LOAD_CONST                      4: '备份web后台'
                        198     PRECALL                         1
                        202     CALL                            1
                        212     STORE_FAST                      3: backup_button
                        214     LOAD_FAST                       3: backup_button
                        216     LOAD_ATTR                       6: clicked
                        226     LOAD_METHOD                     7: connect
                        248     LOAD_FAST                       0: self
                        250     LOAD_ATTR                       8: backup_clicked
                        260     PRECALL                         1
                        264     CALL                            1
                        274     POP_TOP                         
                        276     LOAD_FAST                       2: layout
                        278     LOAD_METHOD                     9: addWidget
                        300     LOAD_FAST                       3: backup_button
                        302     PRECALL                         1
                        306     CALL                            1
                        316     POP_TOP                         
                        318     LOAD_GLOBAL                     11: NULL + QPushButton
                        330     LOAD_CONST                      5: '刷入web后台'
                        332     PRECALL                         1
                        336     CALL                            1
                        346     STORE_FAST                      4: loading_button
                        348     LOAD_FAST                       4: loading_button
                        350     LOAD_ATTR                       6: clicked
                        360     LOAD_METHOD                     7: connect
                        382     LOAD_FAST                       0: self
                        384     LOAD_ATTR                       10: loading_clicked
                        394     PRECALL                         1
                        398     CALL                            1
                        408     POP_TOP                         
                        410     LOAD_FAST                       2: layout
                        412     LOAD_METHOD                     9: addWidget
                        434     LOAD_FAST                       4: loading_button
                        436     PRECALL                         1
                        440     CALL                            1
                        450     POP_TOP                         
                        452     LOAD_FAST                       0: self
                        454     LOAD_METHOD                     11: setLayout
                        476     LOAD_FAST                       2: layout
                        478     PRECALL                         1
                        482     CALL                            1
                        492     POP_TOP                         
                        494     LOAD_CONST                      0: None
                        496     LOAD_FAST                       0: self
                        498     STORE_ATTR                      12: directory_path
                        508     LOAD_CONST                      0: None
                        510     LOAD_FAST                       0: self
                        512     STORE_ATTR                      13: operation
                        522     LOAD_CONST                      0: None
                        524     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: backup_clicked
                    Qualified Name: CommandDialog.backup_clicked
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 4
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QFileDialog'
                        'getExistingDirectory'
                        'directory_path'
                        'operation'
                        'accept'
                    [Locals+Names]
                        'self'
                    [Constants]
                        None
                        '选择备份地址'
                        'Backup'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QFileDialog
                        14      LOAD_ATTR                       1: getExistingDirectory
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '选择备份地址'
                        28      PRECALL                         2
                        32      CALL                            2
                        42      LOAD_FAST                       0: self
                        44      STORE_ATTR                      2: directory_path
                        54      LOAD_FAST                       0: self
                        56      LOAD_ATTR                       2: directory_path
                        66      POP_JUMP_FORWARD_IF_FALSE       29 (to 126)
                        68      LOAD_CONST                      2: 'Backup'
                        70      LOAD_FAST                       0: self
                        72      STORE_ATTR                      3: operation
                        82      LOAD_FAST                       0: self
                        84      LOAD_METHOD                     4: accept
                        106     PRECALL                         0
                        110     CALL                            0
                        120     POP_TOP                         
                        122     LOAD_CONST                      0: None
                        124     RETURN_VALUE                    
                        126     LOAD_CONST                      0: None
                        128     RETURN_VALUE                    
                    [Exception Table]
                [Code]
                    File Name: XTOOL_MTD.py
                    Object Name: loading_clicked
                    Qualified Name: CommandDialog.loading_clicked
                    Arg Count: 1
                    Pos Only Arg Count: 0
                    KW Only Arg Count: 0
                    Stack Size: 8
                    Flags: 0x00000003 (CO_OPTIMIZED | CO_NEWLOCALS)
                    [Names]
                        'QInputDialog'
                        'getItem'
                        'QFileDialog'
                        'getExistingDirectory'
                        'directory_path'
                        'Options'
                        'getOpenFileName'
                        'operation'
                        'accept'
                    [Locals+Names]
                        'self'
                        'choice'
                        'ok'
                        'options'
                        '_'
                    [Constants]
                        None
                        '选择操作'
                        '请选择web类型:'
                        '文件夹'
                        '压缩包'
                        0
                        False
                        '选择web地址'
                        ''
                        '压缩文件 (*.zip *.tar *.gz *.tgz);;所有文件 (*)'
                        (
                            'options'
                        )
                        'Loading'
                    [Disassembly]
                        0       RESUME                          0
                        2       LOAD_GLOBAL                     1: NULL + QInputDialog
                        14      LOAD_ATTR                       1: getItem
                        24      LOAD_FAST                       0: self
                        26      LOAD_CONST                      1: '选择操作'
                        28      LOAD_CONST                      2: '请选择web类型:'
                        30      LOAD_CONST                      3: '文件夹'
                        32      LOAD_CONST                      4: '压缩包'
                        34      BUILD_LIST                      2
                        36      LOAD_CONST                      5: 0
                        38      LOAD_CONST                      6: False
                        40      PRECALL                         6
                        44      CALL                            6
                        54      UNPACK_SEQUENCE                 2
                        58      STORE_FAST                      1: choice
                        60      STORE_FAST                      2: ok
                        62      LOAD_FAST                       2: ok
                        64      POP_JUMP_FORWARD_IF_FALSE       123 (to 312)
                        66      LOAD_FAST                       1: choice
                        68      POP_JUMP_FORWARD_IF_FALSE       123 (to 316)
                        70      LOAD_FAST                       1: choice
                        72      LOAD_CONST                      3: '文件夹'
                        74      COMPARE_OP                      2 (==)
                        80      POP_JUMP_FORWARD_IF_FALSE       27 (to 136)
                        82      LOAD_GLOBAL                     5: NULL + QFileDialog
                        94      LOAD_ATTR                       3: getExistingDirectory
                        104     LOAD_FAST                       0: self
                        106     LOAD_CONST                      7: '选择web地址'
                        108     PRECALL                         2
                        112     CALL                            2
                        122     LOAD_FAST                       0: self
                        124     STORE_ATTR                      4: directory_path
                        134     JUMP_FORWARD                    52 (to 240)
                        136     LOAD_GLOBAL                     5: NULL + QFileDialog
                        148     LOAD_ATTR                       5: Options
                        158     PRECALL                         0
                        162     CALL                            0
                        172     STORE_FAST                      3: options
                        174     LOAD_GLOBAL                     5: NULL + QFileDialog
                        186     LOAD_ATTR                       6: getOpenFileName
                        196     LOAD_FAST                       0: self
                        198     LOAD_CONST                      7: '选择web地址'
                        200     LOAD_CONST                      8: ''
                        202     LOAD_CONST                      9: '压缩文件 (*.zip *.tar *.gz *.tgz);;所有文件 (*)'
                        204     LOAD_FAST                       3: options
                        206     KW_NAMES                        10: ('options',)
                        208     PRECALL                         5
                        212     CALL                            5
                        222     UNPACK_SEQUENCE                 2
                        226     LOAD_FAST                       0: self
                        228     STORE_ATTR                      4: directory_path
                        238     STORE_FAST                      4: _
                        240     LOAD_FAST                       0: self
                        242     LOAD_ATTR                       4: directory_path
                        252     POP_JUMP_FORWARD_IF_FALSE       33 (to 320)
                        254     LOAD_CONST                      11: 'Loading'
                        256     LOAD_FAST                       0: self
                        258     STORE_ATTR                      7: operation
                        268     LOAD_FAST                       0: self
                        270     LOAD_METHOD                     8: accept
                        292     PRECALL                         0
                        296     CALL                            0
                        306     POP_TOP                         
                        308     LOAD_CONST                      0: None
                        310     RETURN_VALUE                    
                        312     LOAD_CONST                      0: None
                        314     RETURN_VALUE                    
                        316     LOAD_CONST                      0: None
                        318     RETURN_VALUE                    
                        320     LOAD_CONST                      0: None
                        322     RETURN_VALUE                    
                    [Exception Table]
                (
                    None
                )
            [Disassembly]
                0       MAKE_CELL                       0: __class__
                2       RESUME                          0
                4       LOAD_NAME                       0: __name__
                6       STORE_NAME                      1: __module__
                8       LOAD_CONST                      0: 'CommandDialog'
                10      STORE_NAME                      2: __qualname__
                12      LOAD_CONST                      5: (None,)
                14      LOAD_CLOSURE                    0: __class__
                16      BUILD_TUPLE                     1
                18      LOAD_CONST                      2: <CODE> __init__
                20      MAKE_FUNCTION                   9
                22      STORE_NAME                      3: __init__
                24      LOAD_CONST                      3: <CODE> backup_clicked
                26      MAKE_FUNCTION                   0
                28      STORE_NAME                      4: backup_clicked
                30      LOAD_CONST                      4: <CODE> loading_clicked
                32      MAKE_FUNCTION                   0
                34      STORE_NAME                      5: loading_clicked
                36      LOAD_CLOSURE                    0: __class__
                38      COPY                            1
                40      STORE_NAME                      6: __classcell__
                42      RETURN_VALUE                    
            [Exception Table]
        'CommandDialog'
        '__main__'
    [Disassembly]
        0       RESUME                          0
        2       LOAD_CONST                      0: 0
        4       LOAD_CONST                      1: None
        6       IMPORT_NAME                     0: os
        8       STORE_NAME                      0: os
        10      LOAD_CONST                      0: 0
        12      LOAD_CONST                      1: None
        14      IMPORT_NAME                     1: base64
        16      STORE_NAME                      1: base64
        18      LOAD_CONST                      0: 0
        20      LOAD_CONST                      1: None
        22      IMPORT_NAME                     2: subprocess
        24      STORE_NAME                      2: subprocess
        26      LOAD_CONST                      0: 0
        28      LOAD_CONST                      1: None
        30      IMPORT_NAME                     3: time
        32      STORE_NAME                      3: time
        34      LOAD_CONST                      0: 0
        36      LOAD_CONST                      1: None
        38      IMPORT_NAME                     4: sys
        40      STORE_NAME                      4: sys
        42      LOAD_CONST                      0: 0
        44      LOAD_CONST                      1: None
        46      IMPORT_NAME                     5: requests
        48      STORE_NAME                      5: requests
        50      LOAD_CONST                      0: 0
        52      LOAD_CONST                      1: None
        54      IMPORT_NAME                     6: serial
        56      STORE_NAME                      6: serial
        58      LOAD_CONST                      0: 0
        60      LOAD_CONST                      1: None
        62      IMPORT_NAME                     7: threading
        64      STORE_NAME                      7: threading
        66      LOAD_CONST                      0: 0
        68      LOAD_CONST                      2: ('list_ports',)
        70      IMPORT_NAME                     8: serial.tools
        72      IMPORT_FROM                     9: list_ports
        74      STORE_NAME                      9: list_ports
        76      POP_TOP                         
        78      LOAD_CONST                      0: 0
        80      LOAD_CONST                      3: ('QApplication', 'QMainWindow', 'QWidget', 'QVBoxLayout', 'QHBoxLayout', 'QGridLayout', 'QPushButton', 'QTextEdit', 'QMessageBox', 'QInputDialog', 'QComboBox', 'QSizePolicy', 'QLabel', 'QLineEdit', 'QDialog', 'QFileDialog', 'QDialogButtonBox')
        82      IMPORT_NAME                     10: PyQt5.QtWidgets
        84      IMPORT_FROM                     11: QApplication
        86      STORE_NAME                      11: QApplication
        88      IMPORT_FROM                     12: QMainWindow
        90      STORE_NAME                      12: QMainWindow
        92      IMPORT_FROM                     13: QWidget
        94      STORE_NAME                      13: QWidget
        96      IMPORT_FROM                     14: QVBoxLayout
        98      STORE_NAME                      14: QVBoxLayout
        100     IMPORT_FROM                     15: QHBoxLayout
        102     STORE_NAME                      15: QHBoxLayout
        104     IMPORT_FROM                     16: QGridLayout
        106     STORE_NAME                      16: QGridLayout
        108     IMPORT_FROM                     17: QPushButton
        110     STORE_NAME                      17: QPushButton
        112     IMPORT_FROM                     18: QTextEdit
        114     STORE_NAME                      18: QTextEdit
        116     IMPORT_FROM                     19: QMessageBox
        118     STORE_NAME                      19: QMessageBox
        120     IMPORT_FROM                     20: QInputDialog
        122     STORE_NAME                      20: QInputDialog
        124     IMPORT_FROM                     21: QComboBox
        126     STORE_NAME                      21: QComboBox
        128     IMPORT_FROM                     22: QSizePolicy
        130     STORE_NAME                      22: QSizePolicy
        132     IMPORT_FROM                     23: QLabel
        134     STORE_NAME                      23: QLabel
        136     IMPORT_FROM                     24: QLineEdit
        138     STORE_NAME                      24: QLineEdit
        140     IMPORT_FROM                     25: QDialog
        142     STORE_NAME                      25: QDialog
        144     IMPORT_FROM                     26: QFileDialog
        146     STORE_NAME                      26: QFileDialog
        148     IMPORT_FROM                     27: QDialogButtonBox
        150     STORE_NAME                      27: QDialogButtonBox
        152     POP_TOP                         
        154     LOAD_CONST                      0: 0
        156     LOAD_CONST                      4: ('QIcon', 'QFont', 'QTextCursor', 'QTextBlockFormat')
        158     IMPORT_NAME                     28: PyQt5.QtGui
        160     IMPORT_FROM                     29: QIcon
        162     STORE_NAME                      29: QIcon
        164     IMPORT_FROM                     30: QFont
        166     STORE_NAME                      30: QFont
        168     IMPORT_FROM                     31: QTextCursor
        170     STORE_NAME                      31: QTextCursor
        172     IMPORT_FROM                     32: QTextBlockFormat
        174     STORE_NAME                      32: QTextBlockFormat
        176     POP_TOP                         
        178     LOAD_CONST                      0: 0
        180     LOAD_CONST                      5: ('Qt', 'QProcess', 'QThread', 'pyqtSignal', 'QTimer')
        182     IMPORT_NAME                     33: PyQt5.QtCore
        184     IMPORT_FROM                     34: Qt
        186     STORE_NAME                      34: Qt
        188     IMPORT_FROM                     35: QProcess
        190     STORE_NAME                      35: QProcess
        192     IMPORT_FROM                     36: QThread
        194     STORE_NAME                      36: QThread
        196     IMPORT_FROM                     37: pyqtSignal
        198     STORE_NAME                      37: pyqtSignal
        200     IMPORT_FROM                     38: QTimer
        202     STORE_NAME                      38: QTimer
        204     POP_TOP                         
        206     PUSH_NULL                       
        208     LOAD_BUILD_CLASS                
        210     LOAD_CONST                      6: <CODE> AdbCommandThread
        212     MAKE_FUNCTION                   0
        214     LOAD_CONST                      7: 'AdbCommandThread'
        216     LOAD_NAME                       36: QThread
        218     PRECALL                         3
        222     CALL                            3
        232     STORE_NAME                      39: AdbCommandThread
        234     PUSH_NULL                       
        236     LOAD_BUILD_CLASS                
        238     LOAD_CONST                      8: <CODE> ADBTool
        240     MAKE_FUNCTION                   0
        242     LOAD_CONST                      9: 'ADBTool'
        244     LOAD_NAME                       12: QMainWindow
        246     PRECALL                         3
        250     CALL                            3
        260     STORE_NAME                      40: ADBTool
        262     PUSH_NULL                       
        264     LOAD_BUILD_CLASS                
        266     LOAD_CONST                      10: <CODE> ADToolWindow
        268     MAKE_FUNCTION                   0
        270     LOAD_CONST                      11: 'ADToolWindow'
        272     LOAD_NAME                       13: QWidget
        274     PRECALL                         3
        278     CALL                            3
        288     STORE_NAME                      41: ADToolWindow
        290     PUSH_NULL                       
        292     LOAD_BUILD_CLASS                
        294     LOAD_CONST                      12: <CODE> ATToolWindow
        296     MAKE_FUNCTION                   0
        298     LOAD_CONST                      13: 'ATToolWindow'
        300     LOAD_NAME                       13: QWidget
        302     PRECALL                         3
        306     CALL                            3
        316     STORE_NAME                      42: ATToolWindow
        318     PUSH_NULL                       
        320     LOAD_BUILD_CLASS                
        322     LOAD_CONST                      14: <CODE> CommandDialog
        324     MAKE_FUNCTION                   0
        326     LOAD_CONST                      15: 'CommandDialog'
        328     LOAD_NAME                       25: QDialog
        330     PRECALL                         3
        334     CALL                            3
        344     STORE_NAME                      43: CommandDialog
        346     LOAD_NAME                       44: __name__
        348     LOAD_CONST                      16: '__main__'
        350     COMPARE_OP                      2 (==)
        356     POP_JUMP_FORWARD_IF_FALSE       82 (to 522)
        358     PUSH_NULL                       
        360     LOAD_NAME                       11: QApplication
        362     LOAD_NAME                       4: sys
        364     LOAD_ATTR                       45: argv
        374     PRECALL                         1
        378     CALL                            1
        388     STORE_NAME                      46: app
        390     PUSH_NULL                       
        392     LOAD_NAME                       40: ADBTool
        394     PRECALL                         0
        398     CALL                            0
        408     STORE_NAME                      47: main_window
        410     LOAD_NAME                       47: main_window
        412     LOAD_METHOD                     48: show
        434     PRECALL                         0
        438     CALL                            0
        448     POP_TOP                         
        450     PUSH_NULL                       
        452     LOAD_NAME                       4: sys
        454     LOAD_ATTR                       49: exit
        464     LOAD_NAME                       46: app
        466     LOAD_METHOD                     50: exec_
        488     PRECALL                         0
        492     CALL                            0
        502     PRECALL                         1
        506     CALL                            1
        516     POP_TOP                         
        518     LOAD_CONST                      1: None
        520     RETURN_VALUE                    
        522     LOAD_CONST                      1: None
        524     RETURN_VALUE                    
    [Exception Table]
