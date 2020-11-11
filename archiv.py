import os
import zipfile
import datetime
from datetime import date
today = date.today()

# Читаем файл содержащий пути для архивирования
with open('paths.txt', 'r') as f:
    paths = f.read().splitlines()

os.chdir(paths[0])

pathForArchiv = '.\\'
pathArchiv = '..\\zipout\\'

zip_arhiv = zipfile.ZipFile(pathArchiv + str(today.year) + '_' + str(today.month) + '.zip', 'w')

for folder, subfolder, files in os.walk(pathForArchiv):   
    for file in files:
        if file.endswith('.CSV'):
            zip_arhiv.write(os.path.join(folder, file), file, compress_type = zipfile.ZIP_DEFLATED)

zip_arhiv.close()

fileInZip = zipfile.ZipFile(pathArchiv + str(today.year) + '_' + str(today.month) + '.zip', 'r')

for file in fileInZip.namelist():
    zipFileName = file
    for folder, subfolder, files in os.walk(pathForArchiv):
        for file in files:
            file_path = os.path.join(folder, file)
            if file == zipFileName:
                os.remove(file_path)

fileInZip.close() 