from shutil import move
with open("MTDs/name.txt", 'r', encoding='utf-8') as f:
    name = f.read()
move("MTDs", "z." + name.replace(" ", "."))