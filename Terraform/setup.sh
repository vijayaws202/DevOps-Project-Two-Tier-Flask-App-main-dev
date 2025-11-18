
# **Update System Packages:**
sudo apt update && sudo apt upgrade -y

# Install Git, Docker, and Docker Compose:**
    
    sudo apt install git docker.io docker-compose-v2 -y

# **Start and Enable Docker:**
    
    sudo systemctl start docker
    sudo systemctl enable docker
    

# **Add User to Docker Group (to run docker without sudo):**
    
    sudo usermod -aG docker $USER
    newgrp docker
    

 # **5. Step 3: Jenkins Installation and Setup**

 # **Install Java (OpenJDK 17):**
    
    sudo apt install openjdk-17-jdk -y


    
 # **Add Jenkins Repository and Install:**
    
    sudo apt install curl -y 
    curl -fsSL [https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key](https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key) | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] [https://pkg.jenkins.io/debian-stable](https://pkg.jenkins.io/debian-stable) binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install jenkins -y
    
# ** Add GPG key

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

 # Add jenkins Repo 

 echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

 # Update and install jenkins

sudo apt-get update
sudo apt-get install jenkins -y

# Start & enable the jenkins service

sudo systemctl start jenkins
sudo systemctl enable jenkins

# **Initial Jenkins Setup:**
# * Retrieve the initial admin password:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# see like this on terminal: 8fd91619fc7840fc9c09064795f5f1d8

# **Grant Jenkins Docker Permissions:**
    
    sudo usermod -aG docker jenkins
    sudo systemctl restart jenkins
    
