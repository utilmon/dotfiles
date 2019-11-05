#!/usr/bin/env bash

#kill if running
pkill fsearch

# enable startup update
conf=$HOME/.config/fsearch/fsearch.conf
sed -i 's/update_database_on_launch=false/update_database_on_launch=true/' $conf

# run update, watch stdout
command="fsearch"
log="$HOME/.config/fsearch/update.log"
match="update_database"

rm -f $log
stdbuf -oL $command > "$log"  &
pid=$!

while sleep 1
do
    if fgrep --quiet "$match" "$log"
    then
        sleep 1
        kill $pid
        # disable startup update
        sed -i 's/update_database_on_launch=true/update_database_on_launch=false/' $conf
        exit 0
    fi
done
