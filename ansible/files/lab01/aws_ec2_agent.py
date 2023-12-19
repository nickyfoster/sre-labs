import os
import sys
import random
import string
import concurrent.futures

def create_dir_if_not_exists(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def create_small_file(file_path, size_in_mb=10):
    chunk_size = 1024 * 1024  # 1 MB
    with open(file_path, 'wb') as file:
        file.write(b'\0' * chunk_size * size_in_mb)

def generate_random_filename(length=10):
    random_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"log_{random_str}.log"

def file_creation_task(directory, file_size):
    file_name = generate_random_filename()
    file_path = os.path.join(directory, file_name)
    create_small_file(file_path, file_size)
    print(f"File created: {file_path}")
    return open(file_path, 'rb')

def create_small_files(directory, number_of_files=5, file_size=10):
    create_dir_if_not_exists(directory)
    file_handles = []

    with concurrent.futures.ThreadPoolExecutor() as executor:
        futures = [executor.submit(file_creation_task, directory, file_size) for _ in range(number_of_files)]
        for future in concurrent.futures.as_completed(futures):
            file_handles.append(future.result())

    print("All files created. Keeping them open indefinitely...")

    try:
        while True:
            pass
    finally:
        for file in file_handles:
            file.close()

def main():
    args = sys.argv[1:]
    if not args or len(args) < 2:
        print("Usage: python script.py <file_count> <file_size>")
        sys.exit(1)
    
    file_count = int(args[0])
    file_size = int(args[1])

    base_directory = "/data/logs"
    create_small_files(base_directory, file_count, file_size)

if __name__ == "__main__":
    main()
