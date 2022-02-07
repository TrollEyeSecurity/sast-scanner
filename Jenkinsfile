pipeline {
    agent any
    stages {
        stage('Build and push image') {
            steps {
                echo 'Starting to build docker image'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DockerHub') {
                    def customImage = docker.build("trolleye/sast-scanner:2022-Q4")
                    customImage.push()
                    }
                }
            }
        }
    }
}