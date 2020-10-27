import os
import zipfile
import datetime
from datetime import date

today = date.today()
zip_arhiv = zipfile.ZipFile('D:\\zipout\\' + str(today.year) + '_' + str(today.month) + '.zip', 'w')

for folder, subfolder, files in os.walk('D:\\zip'):   
    for file in files:
        if file.endswith('.CSV'):
            zip_arhiv.write(os.path.join(folder, file), file, compress_type = zipfile.ZIP_DEFLATED)
zip_arhiv.close()