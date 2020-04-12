# Audio filters
- A low-pass filter passes everything below cutoff and cuts everything above cutoff. You'd use a low-pass filter for a subwoofer.

- A bandpass filter passes a range of frequencies and cuts everything above & below. A bandpass filter can make a recording sound like it's coming over the telephone. You can make a bandpass filter by combining high-pass & low-pass, or you can run one and then run other.

- A bandstop filter cuts a range of frequencies, passing everything above & below. These are rarely used in audio. Sometimes an equalizer is used to reduce and band of frequencies, but we rarely filter-out a wide band completely.

- A very narrow-band bandstop filter is called a notch filter. In this case, only the center frequency is specified. For example, you could use a 60Hz notch filter to "notch-out" 60Hz power-line hum. You can get nearly infinite reduction at the center frequency, but of course no filter is perfect... There are -3dB points and they depend on the steepness of the filter.

# Processing done

- For R1 files, a notch filter was applied at 15734 Hz with 100 q-factor.
- For R2 files, a notch filter was applied at 15734 Hz with 10 q-factor.

A low q-factor implies wider width of the filter. Appropriate q-factor is determined by the amplitude of the noise to be cut off.

Note 15734 Hz corresponds to whining noise of NTSC television for some reason.

# How to use Scripts
1. Put extract_audio.py in a folder with videos to be processed.
2. The script will put extracted audio files in 'output' folder.
3. Use audacity to process the audio files.
    1. Go to Tools -> Macros
    2. Make a new macro with (Select All -> Notch filter -> Export as FLAC -> End)
    3. Set Notch filter parameters.
    4. Click Files and select extracted FLAC files.
4. Put processed audio files into 'input' folder in the video directory.
5. Running add_audio_channel.py will add the processed audio into the default channel.

# FFMPEG explanation
```ffmpeg -y -i temp.mkv -map 0:1 -acodec copy temp.flac```
- ```-y``` always yes on questions.
- ```-i temp.mkv``` input temp.mkv
- ```-map 0:1``` First audio channel (note 0:0 is video channel)
- ```-acodec copy temp.flac``` output audio file by copying without encoding.


```ffmpeg -y -i temp.mkv -i temp.flac -map 0:v:0 -map 1:a:0 -map 0:a:0 -map 0:a:1? -map 0:a:2? -disposition:a:0 default -disposition:a:1 original -metadata:s:a:0 language=jpn -metadata:s:a:0 title="Processed" -metadata:s:a:1 title="Original" -metadata:s:a:2 title="Commentary - Cast Side" -metadata:s:a:3 title="Commentary - Staff Side" -c copy output.mkv```

- ```-map 0:v:0``` Map input 0 (first input file) video source (channel 0) to channel 0
- ```-map 1:a:0``` Map input 1 (second input file) audio source to channel 1 (since it comes after ```-map 0:v:0```)
- ```-map 0:a:0``` Map input 0's first audio source (audio channel 0) to channel 2. '?' implies skip if the channel doesn't exist.
- ```-disposition:a:0 default``` mark first channel with default flag.
- ```-metadata:s:a:0,1,2``` description of the audio channels.
- ```-c copy ``` codec = copy.