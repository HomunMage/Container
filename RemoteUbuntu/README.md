## Remote Ubuntu

for create a docker that can use ssh to remote into this container

### prerequisite
* authorized_keys

### Dockerfile
<div class="load_as_code_session" data-url="Dockerfile" lang="docker">
  Loading content...
</div>

* supervisord.conf
  * <div class="load_as_code_session" data-url="supervisord.conf">
  Loading content...
</div>

<div class="load_as_code_session" data-url="docker-compose.yml" lang="yml">
  Loading content...
</div>

### Usage for docker
```bash
docker compose build
docker compose up
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
