# Selenium in Container with Custom Firefox Profile

## 🐳 Architecture

* **selenium-driver**: A standalone Firefox WebDriver container (from [selenium/standalone-firefox](https://hub.docker.com/r/selenium/standalone-firefox)).
* **selenium**: Your application container, running Python Selenium code and using a mounted Firefox profile.

These containers communicate over a shared Docker network.

## 🗂 Directory Structure


```docker-compose.yml```
<div class="load_as_code_session" data-url="docker-compose.yml">
  Loading content...
</div>


```src/main.py```
<div class="load_as_code_session" data-url="main.py">
  Loading content...
</div>


<script src="https://posetmage.com/cdn/js/LoadAsCodeSession.js"></script>
