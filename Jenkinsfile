pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                 git branch: 'main', url: 'https://github.com/kavyaramesh18/Assignment2.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-maven-app .'
            }
        }
        stage('Run Maven Build') {
            steps {
                bat 'docker run --rm my-maven-app'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        stage('Execute Post-Build Script') {
            steps {
                bat 'bash post_build.sh'
            }
        }
    }
}
