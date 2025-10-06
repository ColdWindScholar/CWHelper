import os


def fill(file_path, desired_size, fill_char=None):
    fill_char = fill_char or b'\xff'
    if not os.path.exists(file_path):
        open(file_path, 'w').close()
    bytes_to_fill = desired_size - os.path.getsize(file_path)
    if bytes_to_fill > 0:
        with open(file_path, 'a+b') as file:
            file.seek(0, 2)
            while bytes_to_fill > 0:
                chunk_size = min(bytes_to_fill, 16)
                file.write(fill_char * chunk_size)
                bytes_to_fill -= chunk_size
