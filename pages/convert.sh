#!/bin/bash
# desc: Convert hls to mp4 

echo -n > media.txt

for f in $(ls -tr *.ts); do
	echo "file $f" >> media.txt
done

ffmpeg -f concat -i media.txt -c copy all.ts 

ffmpeg -i all.ts -acodec copy -vcodec copy new.mp4

rm all.ts

