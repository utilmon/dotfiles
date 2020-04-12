import os
import subprocess

os.mkdir('output')
for fn in next(os.walk('.'))[2]:
    if fn[-4:] == '.mkv':
        os.rename(fn, 'temp.mkv')
        subprocess.call('ffmpeg -y -i temp.mkv -map 0:1 -acodec copy temp.flac')
        os.rename('temp.flac', './output/' + fn[:-4] + '.flac')
        os.rename('temp.mkv', fn)
