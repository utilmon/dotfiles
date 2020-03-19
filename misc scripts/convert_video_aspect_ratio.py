import os
import subprocess

for root, dirs, files in os.walk('.'):
    for fn in files:
        if fn[-4:] == '.mp4':
            os.rename(fn, fn[9:11] + '.mp4') # Had to do this because fn was in korean
            subprocess.call('ffmpeg -i ' + fn[9:11] +
                            '.mp4 -aspect 720:540 -c copy ' + fn[9:11] + '_out.mp4')
            os.rename(fn[9:11] + '_out.mp4', fn)
