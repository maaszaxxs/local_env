FROM python:3.7.13-alpine3.16

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . /flask_app/app.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 8080

# Run app.py at container launch
CMD ["python", "app.py"]
