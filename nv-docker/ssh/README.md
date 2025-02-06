# NVIDIA Docker as SSH

Use ssh as example:

## Dockerfile
you need ```nvidia/cuda:12.2.0-base-ubuntu22.04```

<div class="load_as_code_session" data-url="Dockerfile">
  Loading content...
</div>

the file entrypoint.sh:
<div class="load_as_code_session" data-url="entrypoint.sh">
  Loading content...
</div>


use the Dockerfile:  
```bash
docker build -t nv-ssh --build-arg SSH_USERNAME=<name> --build-arg SSH_PASSWORD=<pw> .
docker create --gpus all -it -p 5566:22 -v "$(pwd)":/home/<name>/app -w /home/<name>/app --name test nv-ssh /bin/bash
docker start test
docker attach test

```

## Docker Compose
docker-compose.yml

<div class="load_as_code_session" data-url="docker-compose.yml">
  Loading content...
</div>


<script src="https://posetmage.com/cdn/js/LoadAsCodeSession.js"></script>
