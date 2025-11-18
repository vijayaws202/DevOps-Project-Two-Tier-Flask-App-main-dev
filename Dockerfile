# Multistage Docker file to slim the image

# -----As Builder -----
    
FROM python:3.11-slim As builder

# ---- Install Build Dependancy --

RUN apt-get update  && apt-get install -y gcc deafult-mylibsqlclient-dev pkg-config && apt-get clean && rm -rf /var/lib/apt/list/*

# Set working Directory

WORKDIR /app 

# copy requirements file to image

COPY requirements.txt .

# --- Install python dependancy from requirements.txt 

RUN pip install --prefix=/install --no-cache-dir -r requirements.txt

# --- stage 2 --final- image

#  base image

FROM python:3.11-slim

# Set working directory

WORKDIR /app

# copy installed packages from builder

COPY f--from=builder /install /usr/local

# Copyy application code

COPY . .

# Run the application

CMD ["python", "app.py"]



    

