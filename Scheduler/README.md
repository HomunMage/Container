# Scheduler

In this guide, we'll demonstrate how to automate daily tasks using Docker, featuring an example with cryptocurrency trading using the CCXT library. This setup allows you to run a daily cron job without the hassle of managing your environment manually.

Your project can following structure:

```
/project-root
├── ccxt
│   ├── Dockerfile
│   ├── daily.sh
│   ├── setting.sh
│   ├── entrypoint.sh
│   └── src
│       └── *.py (your Python scripts)
└── docker-compose.yml

```
1. **Dockerfile** - Defines the Docker image.
2. **Docker Compose** - Orchestrates the Docker container.
3. **daily.sh** - The script that executes your trading strategy daily.
4. **setting.sh** - Contains cron settings for scheduling the task.
5. **entrypoint.sh** - Serves as the entry point for the Docker container.



### Dockerfile

The **Dockerfile** is responsible for setting up the environment where your scripts will run. Here’s how you structure it:

<div class="load_as_code_session" data-url="ccxt/Dockerfile">
  Loading content...
</div>

### docker compose

The **docker-compose.yml** file simplifies the process of running multiple containers and helps in managing the volume mounts for your source code, such mount ```- ./ccxt/src:/app/src/``` .

Here's an example of how it can be structured:

<div class="load_as_code_session" data-url="docker-compose.yml">
  Loading content...
</div>


### daily.sh

The **daily.sh** script contains the logic for the daily task. For this demo, it serves as a placeholder for your trading operations. Customize it according to your specific needs.

<div class="load_as_code_session" data-url="ccxt/daily.sh">
  Loading content...
</div>

### setting.sh

This script is designed for dynamic configuration of your cron jobs without a full rebuild your Docker image whenever you want to modify the scheduling or logging. 

Here’s the cron job format:  
```58 23 * * * /app/daily.sh >> /app/src/workspace/cron.log 2>&1" ```

The **setting.sh** script sets up a cron job. For example, to run **daily.sh** every day at 11:58 PM, logging the output for monitoring. 

<div class="load_as_code_session" data-url="ccxt/setting.sh">
  Loading content...
</div>

### entrypoint.sh

The **entrypoint.sh** script acts as the entry point for your Docker container, executing setting.sh to initiate the scheduling of your daily tasks. 

<div class="load_as_code_session" data-url="ccxt/entrypoint.sh">
  Loading content...
</div>

<script src="https://posetmage.com/assets/js/LoadAsCodeSession.js"></script>
