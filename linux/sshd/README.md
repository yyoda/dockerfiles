# Launch SSHD service.

* see https://docs.docker.com/engine/examples/running_ssh_service/

```sh
docker build --build-arg pswd=YOUR_PASSWORD -t sshd .
docker run -d --name sshd -p 6000:22 sshd
```
