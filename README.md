## Docker Demo

In this project, you will learn how to deploy a simple flask application to a docker container. When running the container will supply a url for displaying `hello world`.

### Instructions

#### 1.Setup Your Environment:

You will find a `Makefile`, with instructions to setup a virtual environment venv and install the dependencies from the `requirements.txt`. The flask package will be installed. The `Makefile` helps use run the `make` commands that bundle commands together.

Use the command `make setup` to run `python3 -m venv venv` that creates a virtual environment venv. To activate the virtual environment run `source venv/bin/activate`, the terminal should change to `(venv)` meaning that you are inside the virtual environment. Install the dependencies using the `make install` command that runs `pip install --upgrade pip &&\ pip install -r requirements.txt`. The first pip install upgrades pip (the package installer for python) and the second pip install installs the packages mentioned in `requirements.txt`.

#### 2.Create Docker Image:

Build the docker image using the `Dockerfile`. It contains the docker image pull in the `FROM python:3.7.13-alpine3.16` that loads an alpine 3.16 image. The `WORKDIR /app` sets the working directory. The `COPY . /flask_app/app.py /app/` copies app.py from flask_app directory to the working directory. The `RUN` installs dependencies for upgrading pip and from `requirements.txt`. `EXPOSE 8080` exposes port 8080 to the external environment. The `CMD ["python", "app.py"]` runs app.py when the container is running with a python interpreter.

Run the command `docker build -t [tag_name] .` to build a docker image. Replace the `tag_name` with a suitable tag for the image. Verify that your image is created with a `docker image ls` command that list docker images.

#### 3.Run the Container:

Run the command `docker run -it [tag_name]` to start the container. It should display:
 ```
 * Serving Flask app 'app' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:8080
 * Running on http://172.17.0.2:8080 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 112-478-073
```
Use the second url starting with 172, when you test on a browse it should display `Hello, World!`
