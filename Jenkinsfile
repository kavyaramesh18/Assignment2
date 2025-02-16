pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://gitlab.com/your-repo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-maven-app .'
            }
        }
        stage('Run Maven Build') {
            steps {
                sh 'docker run --rm my-maven-app'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        stage('Execute Post-Build Script') {
            steps {
                sh './post_build.sh'
            }
        }
    }
}
