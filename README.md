# go-ssb-room-docker
Docker image definition for [go-ssb-room](https://github.sre.pub/ssb-ngi-pointer/go-ssb-room). It will automatically create an admin user at first start with a random password, so take notice.

Environment variables that need to be set:
```
SSB_ROOM_MODE=restricted
SSB_ROOM_ADMIN_KEY="@Bp5Z5TQKv6E/Y+QZn/3LiDWMPi63EP8MHsXZ4tiIb2w=.ed25519"
SSB_ROOM_DOMAIN=test.example.com
```

The service is exposing two TCP ports: 8008 and 3000.

Built Docker images are pushed to [docker.io/ksinica/go-ssb-room](https://hub.docker.com/r/ksinica/go-ssb-room/tags).