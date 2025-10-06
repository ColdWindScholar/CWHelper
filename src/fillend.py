import os

def fill(file_path, desired_size, fill_char = None):
    if not fill_char:
        fill_char = b'\xff'
    if not os.path.exists(file_path):
        open(file_path, 'w').close()
    current_size = os.path.getsize(file_path)
    bytes_to_fill = desired_size - current_size
    if bytes_to_fill > 0:
        with open(file_path, 'r+b') as file:
            while bytes_to_fill > 0:
                chunk_size = min(bytes_to_fill, 16)
                file.write(fill_char * chunk_size)
                bytes_to_fill -= chunk_size



