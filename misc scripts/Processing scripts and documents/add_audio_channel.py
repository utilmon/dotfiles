import os
import subprocess

for fn in next(os.walk('.'))[2]:
    if fn[-4:] == '.mkv':
        os.rename(fn, 'temp.mkv')
        os.rename('./input/' + fn[:-4] + '.flac', 'temp.flac')
        subprocess.call('ffmpeg -y -i temp.mkv -i temp.flac -map 0:v:0 -map 1:a:0 -map 0:a:0 -map 0:a:1? -map 0:a:2? -disposition:a:0 default -disposition:a:1 original -metadata:s:a:0 language=jpn -metadata:s:a:0 title="Processed" -metadata:s:a:1 title="Original" -metadata:s:a:2 title="Commentary - Cast Side" -metadata:s:a:3 title="Commentary - Staff Side" -c copy output.mkv')
        os.rename('output.mkv', fn)
        os.remove('temp.mkv')
        os.rename('temp.flac', './input/' + fn[:-4] + '.flac')