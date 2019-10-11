pipeline {
    agent {
        docker {
            image 'maven:3-jdk-8' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'agent-server.veracode-iast.io', port: '10010']) {
                steps {
                    sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/iast-ci.sh | sh'
                    sh 'mvn test'
                }
            }
        }
        stage('Deploy') { 
            steps {
                sh 'mvn install'
            }
    }
    }
}