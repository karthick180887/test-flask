pipeline {
    agent {
        label 'node1'  // Your AWS node (must have Docker installed
    }
    environment {
        VENV = 'venv'
        DOCKER_IMAGE = "karthick180887/test-flask:latest"
    }
    stages {
        // Stage 1: Checkout code
        stage('Checkout git') {
            steps {
                git branch: 'main', url: 'https://github.com/karthick180887/test-flask'
            }
        }

        // Stage 2: Python virtualenv setup & tests
        stage('Set up the venv') {
            steps {
                sh '''
                    python3 -m venv ${VENV}
                    ${VENV}/bin/python -m pip install --upgrade pip
                    ${VENV}/bin/pip install -r requirements.txt
                '''
            }
        }

        // Stage 3: Run Python tests
        stage('Run the tests') {
            steps {
                sh '${VENV}/bin/python -m unittest discover -s tests'
            }
        }

        // Stage 4: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        // Stage 5: Deploy container
        stage('Deploy') {
            steps {
                sh '''
                    docker stop test-flask || true
                    docker rm test-flask || true
                    docker run -d --name test-flask -p 5000:5000 ${DOCKER_IMAGE}
                '''
            }
        }
    }
}
