## Remote Ubuntu

for create a docker that can use ssh to remote into this container

### prerequisite
* authorized_keys

### Dockerfile
<div class="load_as_code_session" data-url="Dockerfile">
  Loading content...
</div>

* supervisord.conf
  * <div class="load_as_code_session" data-url="supervisord.conf">
  Loading content...
</div>

### Usage for docker
```bash
docker build -t ubuntu-ssh --build-arg SSH_USERNAME=<name> --build-arg SSH_PASSWORD=<password> .
docker create -it -p 5566:22 -v "$(pwd)":<mnt_source_path> -w /home/<name>/app --name ubuntu-container ubuntu-ssh /bin/bash
docker start ubuntu-container
ssh -i /path/to/your/private_key -p 5566 <name>@127.0.0.1

```
### Usage for podman

k8s yaml
<div class="load_as_code_session" data-url="hold.yaml">
  Loading content...
</div>

```bash
podman pod rm -f ubuntu-ssh-pod

podman play kube hold.yaml

podman exec -it ubuntu-ssh-pod-ubuntu-ssh-container bash

```





<script src="https://posetmage.com/cdn/js/LoadAsCodeSession.js"></script>
