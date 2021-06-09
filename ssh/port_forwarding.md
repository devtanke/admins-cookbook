# SSH - Port forwarding

To get access of an internal port (e.g. a port of a docker-container on a remote machine), you can use the following command.

```bash
ssh -L 127.0.0.1:81:172.1.0.1:8081 remote.server.com
```

This will bind the remote port 8081 of the container with the ip 172.1.0.1 to your local port 81. You can also add the parameters `-p` and `-l` to add username and an alternative port.

```bash
ssh -luser4211 -p44022 -L 127.0.0.1:81:172.1.0.1:8081 remote.server.com
```