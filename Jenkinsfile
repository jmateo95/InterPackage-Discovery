pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }

    stages {
        stage('Build jar') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jmateo95/InterPackage-Discovery']])
                sh 'mvn clean install -DskipTests'
            }
        }
        stage ('Build docker image'){
            steps{
                script{
                    sh 'docker build -t jmateo/discover .'
                }
            }
            
        }
    }
}