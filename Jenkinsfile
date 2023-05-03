pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }

    stages {
        stage('Crear jar') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jmateo95/InterPackage-Discovery']])
                sh 'mvn clean install -DskipTests'
            }
        }
        stage ('Crear imagen de docker'){
            steps{
                script{
                    sh 'docker build -t jmateo/discover .'
                }
            }  
        }
        
        stage('Desplegar imagen de docker') {
            steps {
                sh 'docker stop discover || true'
                sh 'docker rm discover || true'
                sh 'docker run -d -p 8761:8761 --name discover jmateo/discover'
            }
        }
    }
}