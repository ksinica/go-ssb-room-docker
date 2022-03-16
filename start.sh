$!/bin/sh
if [ -z "$SSB_ROOM_DOMAIN" ]
then
    echo "SSB_ROOM_DOMAIN variable is not set"
    exit 1
fi

[ -z "$SSB_ROOM_MODE" ]; SSB_ROOM_MODE="restricted"
REPO_PATH=$HOME/ssb-go-room

if [ ! -f "$HOME/.init" ]; then
    if [ -z "$SSB_ROOM_ADMIN_KEY" ]
    then
        echo "SSB_ROOM_ADMIN_KEY variable is not set"
        exit 1
    fi
    touch "$HOME/.init"
    PASSWD=$(pwgen -s -1 16)
    $HOME/init-admin.expect $SSB_ROOM_ADMIN_KEY $REPO_PATH $PASSWD
    echo "!!! Password for $SSB_ROOM_ADMIN_KEY is $PASSWD !!!"
fi
server -lismux :8008 -lishttp :3000 -repo $REPO_PATH -mode $SSB_ROOM_MODE -https-domain $SSB_ROOM_DOMAIN
