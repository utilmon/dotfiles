import subprocess as sp
import sys
import os

output_dir = "/Users/j/Downloads"


class get_input:
    def link() -> str:

        if len(sys.argv) == 2:  # if link is given as an argument
            return sys.argv[1]

        print("Input youtube link:")
        return input()

    def audio_type() -> int:
        print(
            "What type of youtube audio is this? 1 (default: single track), 2 (multiple chapters/tracks), or 3 (playlist)"
        )
        output = input()
        if output == "":
            output = 1
        return int(output)


class dl_audio:
    def __init__(
        self,
        yt_link=get_input.link(),
        audio_type=get_input.audio_type(),
        output_dir=".",
    ) -> None:
        self.yt_link = yt_link
        self.audio_type = audio_type
        self.out_dir = output_dir

    def track(self) -> None:
        sts = sp.Popen(
            [
                "yt-dlp",  # yt-dlp used due to speed issue
                "-f",
                "bestaudio[ext=m4a]",
                "--embed-thumbnail",
                "--add-metadata",
                "--windows-filenames",
                "-o",
                f"{self.out_dir}/%(title)s.%(ext)s",
                self.yt_link,
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

    def playlist(self) -> None:
        sts = sp.Popen(
            [
                "yt-dlp",  # yt-dlp used due to speed issue
                "-f",
                "bestaudio[ext=m4a]",
                "--embed-thumbnail",
                "--add-metadata",
                "--windows-filenames",
                "-o",
                f"{self.out_dir}/%(playlist_title)s/%(title)s.%(ext)s",
                self.yt_link,
            ]
        )
        sts.wait()

    def chapters(self) -> None:
        sts = sp.Popen(
            [
                "yt-dlp",
                "-f",
                "bestaudio[ext=m4a]",
                "--embed-thumbnail",
                # "--add-metadata",
                "--split-chapters",
                "--windows-filenames",
                "-o",
                f"chapter:{self.out_dir}/%(title)s/%(section_title)s.%(ext)s",
                "-o",
                "temp.%(ext)s",
                self.yt_link,
            ]
        )

        sts.wait()
        os.remove("temp.m4a")


if __name__ == "__main__":

    dl = dl_audio(output_dir=output_dir)

    if dl.audio_type == 1:
        dl.track()
    elif dl.audio_type == 2:
        dl.chapters()
    elif dl.audio_type == 3:
        dl.playlist()
