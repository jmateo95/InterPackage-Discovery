pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }

    stages {
        stage('Crear JAR') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jmateo95/InterPackage-Discovery']])
                sh 'ssh root@167.172.108.85 "cd /home/Interpackage/InterPackage-Discovery-Server && git pull origin main && mvn clean install -DskipTests"'
                sh 'ssh root@167.172.108.85 "cd /home/Interpackage/InterPackage-Discovery-Server && git pull origin main && mvn clean install -DskipTests"'
            }
        }

        stage('Detener el contenedor de docker') {
            steps {
                sh 'ssh root@167.172.108.85 "docker stop docker-interpackage-service-discovery"'
                sh 'ssh root@167.172.108.85 "docker rm docker-interpackage-service-discovery"'
            }
        }

        stage ('Desplegar imagen de docker'){
            steps{
                script{
                    sh 'ssh root@167.172.108.85 "cd /home/Interpackage/docker && docker-compose up -d --build interpackage-service-discovery"'
                }
            }  
        }
    }
}