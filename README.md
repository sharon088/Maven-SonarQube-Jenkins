# Calculator Project

## Project Overview

This project is a Java-based calculator application that utilizes **Maven** for building, **SonarQube** for code quality analysis, and **Artifactory** for artifact storage. The repository also includes Docker and Jenkins configurations to automate the build, test, and deployment processes.

## Features

- **Java Calculator Application**: A simple calculator application built with Java.
- **CI/CD Pipeline**: Integrated Jenkins pipeline for automating build, test, and deployment steps.
- **Dockerized**: The application can be built and run in Docker containers.
- **SonarQube Integration**: Performs code quality checks using SonarQube.
- **Artifact Deployment**: Deploys the application artifact (JAR) to Artifactory.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Java**: JDK 11 or higher.
- **Maven**: Version 3.9.9 or higher.
- **Docker**: To build and run the application in a container.
- **Jenkins**: For continuous integration and deployment.
- **SonarQube**: Set up SonarQube for code analysis.
- **Artifactory**: Set up a repository to upload the JAR artifact.

## Setup and Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/calculator-project.git
    cd calculator-project
    ```

2. **Build the application locally**:

    You can build the project locally using Maven:

    ```bash
    mvn clean package
    ```

3. **Docker Setup**:

    To build and run the application using Docker, use the following commands:

    - Build the Docker image:

        ```bash
        docker build -t calculator-app .
        ```

    - Run the application:

        ```bash
        docker run -d -p 8080:8080 calculator-app
        ```

4. **Jenkins Setup**:

    The project contains a `Jenkinsfile` for automating the build and deployment process. You can set up a Jenkins pipeline by following these steps:

    - Create a new pipeline in Jenkins.
    - Link the pipeline to your GitHub repository.
    - Make sure that the Jenkins instance has access to **SonarQube** and **Artifactory**.
    - The pipeline will run the following stages:
      - **Install Dependencies**: Installs necessary dependencies like `xvfb`.
      - **Set Up Xvfb**: Sets up a virtual display for headless builds.
      - **Build with Maven**: Builds the project using Maven.
      - **SonarQube Analysis**: Runs SonarQube for code quality analysis.
      - **Deploy to Artifactory**: Deploys the generated JAR file to the Artifactory repository.

## Jenkins Pipeline Configuration

The project includes a `Jenkinsfile` for automating the CI/CD process. This file defines the stages for building, testing, analyzing, and deploying the application. It also includes notifications for build success and failure via email.

**Pipeline Stages**:
1. **Install Dependencies**: Installs necessary packages like `xvfb` to ensure the build can run headless.
2. **Set Up Xvfb**: Starts a virtual frame buffer for headless execution.
3. **Build with Maven**: Runs `mvn clean package` to build the project.
4. **SonarQube Analysis**: Runs SonarQube analysis to check the code quality.
5. **Deploy to Artifactory**: Uploads the resulting JAR file to an Artifactory repository.

## Dockerfile Explanation

The Dockerfile in this project is divided into multiple stages:

1. **Build Stage**: Uses Maven to compile and package the application.
2. **SonarQube Analysis**: Runs SonarQube for code quality analysis.
3. **Final Stage**: Builds a minimal Docker image and deploys the packaged JAR file to an Artifactory repository.

## Environment Variables

- **SONAR_HOST_URL**: The URL of your SonarQube server.
- **SONAR_LOGIN**: Your SonarQube authentication token.
- **ARTIFACTORY_URL**: The URL of your Artifactory server.
- **ARTIFACTORY_TOKEN**: Your Artifactory API token.

## Contributing

1. Fork this repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

