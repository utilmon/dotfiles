import subprocess as sp
import sys
import os

output_dir = "/Users/j/Downloads"


def get_link():

    if len(sys.argv) == 1:
        print("Input youtube link:")
        output = input()
    else:
        output = sys.argv[1]

    return output


def ask_type():
    print(
        "What type of youtube audio is this? 1 (default: single track), 2 (multiple chapters/tracks), or 3 (playlist)"
    )
    output = input()
    if output == "":
        output = 1
    return int(output)


def dl_audio(link: str, out_dir: str = "."):
    sts = sp.Popen(
        [
            "yt-dlp",  # yt-dlp used due to speed issue
            "-f",
            "bestaudio[ext=m4a]",
            "--embed-thumbnail",
            "--add-metadata",
            "--windows-filenames",
            "-o",
            f"{out_dir}/%(title)s.%(ext)s",
            link,
        ]
    )
    ## for opus file see below
    # sts = sp.Popen(
    #    [
    #        "yt-dlp",
    #        "-f",
    #        "bestaudio",
    #        "--extract-audio",
    #        "--embed-thumbnail",
    #        "--add-metadata",
    #        "-o",
    #        f"{out_dir}/%(title)s.%(ext)s",
    #        link,
    #    ]
    # )

    sts.wait()

def dl_audio_playlist(link: str, out_dir: str = "."):
    sts = sp.Popen(
        [
            "yt-dlp",  # yt-dlp used due to speed issue
            "-f",
            "bestaudio[ext=m4a]",
            "--embed-thumbnail",
            "--add-metadata",
            "--windows-filenames",
            "-o",
            f"{out_dir}/%(playlist_title)s/%(title)s.%(ext)s",
            link,
        ]
    )
    sts.wait()

def dl_audio_chapters(link: str, out_dir: str = "."):
    sts = sp.Popen(
        [
            "yt-dlp",
            "-f",
            "bestaudio[ext=m4a]",
            "--embed-thumbnail",
            "--add-metadata",
            "--split-chapters",
            "--windows-filenames",
            "-o",
            f"chapter:{out_dir}/%(title)s/%(section_title)s.%(ext)s",
            "-o",
            "temp.%(ext)s",
            link,
        ]
    )

    sts.wait()


if __name__ == "__main__":

    yt_link = get_link()
    audio_type = ask_type()
    if audio_type == 1:
        dl_audio(yt_link, out_dir=output_dir)
    elif audio_type == 2:
        dl_audio_chapters(yt_link, out_dir=output_dir)
        os.remove("temp.m4a")
    elif audio_type == 3:
        dl_audio_playlist(yt_link, out_dir=output_dir)
