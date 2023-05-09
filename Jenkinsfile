pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }

    stages {
        stage('Test Y Creacion De Jar') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jmateo95/InterPackage-Discovery']])
                sh 'ssh root@137.184.209.89 "cd /home/Interpackage/InterPackage-Discovery-Server && git pull origin main && mvn clean install -DskipTests"'
            }
        }

        stage('Detener El Servicio Docker') {
            steps {
                sh 'ssh root@137.184.209.89 "docker stop docker-interpackage-service-discovery-1"'
                sh 'ssh root@137.184.209.89 "docker rm docker-interpackage-service-discovery-1"'
            }
        }

        stage ('Desplegar Imgen de Docker'){
            steps{
                script{
                    sh 'ssh root@137.184.209.89 "cd /home/Interpackage/docker && docker-compose up -d --build interpackage-service-discovery"'
                }
            }  
        }
    }
}