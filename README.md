This project demonstrates how to containerize and deploy a Java application using Docker. The application is packaged as a JAR file and deployed inside a Docker container for portability, scalability, and environment consistency.

This setup can be extended for deployment to:

AWS EC2

AWS ECR

AWS ECS

Kubernetes

CI/CD pipelines (GitHub Actions / AWS CodePipeline)

🛠️ Tech Stack

Java (JDK 17 / 11)

Maven

Docker

Git & GitHub

📂 Project Structure
java-docker-app/
│
├── src/
├── pom.xml
├── Dockerfile
├── target/
│   └── app.jar
└── README.md

⚙️ Prerequisites

Make sure you have the following installed:

Java (JDK 11 or 17)

Maven

Docker

Git

Check installation:

java -version
mvn -version
docker --version

🔨 Step 1: Build the Java Application

Use Maven to package the application:

mvn clean package


After successful build, JAR file will be generated in:

target/app.jar

🐳 Step 2: Create Dockerfile

Create a file named Dockerfile in the root directory.

# Use official OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy jar file into container
COPY target/app.jar app.jar

# Expose application port (change if needed)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

🏗️ Step 3: Build Docker Image

Run the following command in project root:

docker build -t java-docker-app:v1 .


Verify image:

docker images

▶️ Step 4: Run Docker Container
docker run -d -p 8080:8080 --name java-app-container java-docker-app:v1


Check running containers:

docker ps


Open in browser:

http://localhost:8080

🛑 Stop and Remove Container
docker stop java-app-container
docker rm java-app-container

🗑️ Remove Docker Image
docker rmi java-docker-app:v1

☁️ (Optional) Push Image to Docker Hub
1️⃣ Login
docker login

2️⃣ Tag Image
docker tag java-docker-app:v1 yourdockerhubusername/java-docker-app:latest

3️⃣ Push Image
docker push yourdockerhubusername/java-docker-app:latest

☁️ (Optional) Push Image to AWS ECR
1️⃣ Authenticate Docker with ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.ap-south-1.amazonaws.com

2️⃣ Tag Image
docker tag java-docker-app:v1 <account-id>.dkr.ecr.ap-south-1.amazonaws.com/java-docker-app:latest

3️⃣ Push Image
docker push <account-id>.dkr.ecr.ap-south-1.amazonaws.com/java-docker-app:latest
