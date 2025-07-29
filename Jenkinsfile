pipeline {
    agent {
        label 'node1' // Your AWS node label
    }
    environment {
        VENV = 'venv'
    }
    stages {
        stage('Checkout git') {
            steps {
                git branch: 'main', url: 'https://github.com/karthick180887/test-flask'
            }
        }
        stage('Set up the venv') {
            steps {
                sh 'python -m venv ${VENV}'
                sh '${VENV}/bin/python -m pip install --upgrade pip'
                sh '${VENV}/bin/pip install -r requirements.txt'
            }
        }
        stage('Run the tests') {
            steps {
                sh '${VENV}/bin/python -m unittest discover -s tests'
            }
        }
    }
}
