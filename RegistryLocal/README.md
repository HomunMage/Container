# Hold Image Registry at local

It's strongly discouraged to expose this registry to a public network due to security concerns. The examples provided here focus on making the registry accessible only via `localhost`. This approach keeps your images secure while allowing you to easily test Docker builds and deployments locally.

## Hold and Mount

#### docker solution:
```bash
docker run --rm -d -p 127.0.0.1:7000:5000 -v "$(pwd)/images:/var/lib/registry" --name registry registry:latest
```

#### k8s solution:

<div class="load_as_code_session" data-url="local-registry.yaml">
  Loading content...
</div>

command:
```bash
kubectl apply -f local-registry.yaml
tmux new -s registry-forward
kubectl port-forward --address 127.0.0.1 service/local-registry 7000:5000
```

## try and use

```bash
curl -v http://127.0.0.1:7000/v2/
curl -v http://127.0.0.1:7000/v2/_catalog
```

example push command
```bash
docker compose build
docker tag langgraph-gui-frontend:latest 127.0.0.1:7000/langgraph-gui-frontend:latest
docker push 127.0.0.1:7000/langgraph-gui-frontend:latest
```

<script src="https://posetmage.com/cdn/js/LoadAsCodeSession.js"></script>
