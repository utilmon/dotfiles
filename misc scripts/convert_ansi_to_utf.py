import codecs
import os
import sys

# Path to the folder with files to convert
filePathSrc = "D:\Kwan\Desktop\Code Geass Hangyaku no Lelouch (2006)\Code_Geass_TV"
filePathSrc = os.getcwd()  # Current directory
for root, dirs, files in os.walk(filePathSrc):
    for fn in files:
        if fn[-4:] == '.smi':  # Specify type of the files
            filename = root + "\\" + fn
            with codecs.open(filename, 'r', encoding="cp949") as f:
                text = f.read()
                # process Unicode text
            with codecs.open(filename, 'w', encoding='utf8') as f:
                # f.write(u'\uFEFF') # BOM mark optional
                f.write(text)
