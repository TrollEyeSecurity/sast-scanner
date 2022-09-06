pipeline {
    agent any
    stages {
        stage('Build and push image') {
            steps {
                echo 'Starting to build docker image'
                script {
                    sh 'docker rmi "trolleye/sast-scanner:2022-Q3" || echo "trolleye/sast-scanner:2022-Q3 image does not exist"'
                    docker.withRegistry('https://index.docker.io/v1/', 'DockerHub') {
                    def customImage = docker.build("trolleye/sast-scanner:2022-Q3")
                    customImage.push()
                    }
                }
            }
        }
    }
}