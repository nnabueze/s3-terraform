pipeline {
    agent {
        label "linux"
    }

    stages {
        stage('Validating terraform') {
            steps {
                sh '''
                terraform init
                terraform validate
                '''
            }
        }

        stage('Applying Terraform') {
            steps {
                sh '''
                aws --version
                '''
            }
        }

        stage('Terraform OutPut to Parameter') {
            steps {
                sh '''
                aws --version
                '''
            }
        }

        stage('Excuting downstream') {
            steps {
                sh '''
                aws --version
                '''
            }
        }
    }
}
