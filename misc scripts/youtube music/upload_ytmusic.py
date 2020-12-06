""" This script uploads created music files in directories to youtube music library """

import time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
from ytmusicapi import YTMusic

filetypes = ['.mp3', 'flac', '.wma', '.m4a', '.ogg']  # only last four elements
directories = ['D:\Kwan\Desktop', 'D:\Kwan\내 음악']
# torrent folder is not allowed due to slow download (> 60 s)


def on_created(event):
    """ This function gets executed when a file is created in directories being monitored """
    fn = event.src_path
    print(f'fn is {fn} and extension is {fn[-4:]}')
    if fn[-4:] in filetypes:
        time.sleep(30)  # Wait until download is done
        try:
            ytmusic.upload_song(fn)
        except:
            print('File does not exist')
            pass


if __name__ == "__main__":

    ytmusic = YTMusic('ytmusic_auth.json')

    patterns = "*"
    ignore_patterns = ""
    ignore_directories = False
    case_sensitive = True
    my_event_handler = PatternMatchingEventHandler(patterns, ignore_patterns, ignore_directories, case_sensitive)

    my_event_handler.on_created = on_created

    my_observer = Observer()
    for path in directories:
        my_observer.schedule(my_event_handler, path, recursive=True)

    my_observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        my_observer.stop()
        my_observer.join()
