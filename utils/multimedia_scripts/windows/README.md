# audio_to_mp4.ps1
A script to convert a directory of audiofiles to seprate .mp4 files using FFmpeg.
It autodetects what GPU your using (currently supporting NVENC and AMF) if it dosen't find a gpu it will default to libx264.

The script requires arguemnts to work.

For the first argument specifies the the audio format.
The valid arguments are so:
- -w (for .wav)
- -f (for .flac)
- -3 (for .mp3)
- -o (for .ogg)
For the second argument it directs to the image (any format should work) to use for the .mp4 files.
For example:
```powershell
.\audio_to_mp4.ps1 -f cover.png
```
