pipeline {
    agent {
        label "linux"
    }

    environment{
        ACTION = "apply"
        S3_BUCKET = ""
    }

    stages {
        stage('Validating terraform') {
            steps {
                sh '''
                terraform init
                terraform validate
                terraform plan
                '''
            }
        }

        stage('Apply Terraform') {
            steps {
                sh '''
                terraform ${ACTION} --auto-approve
                '''
            }
        }

        stage('Terraform OutPut') {
            steps {
                script{
                    if(ACTION == "apply"){
                        S3_BUCKET = sh(returnStdout: true, script: "terraform output s3-bucket-name").trim()
                        sh 'echo ${S3_BUCKET}'
                    }else{
                        echo "Bucket destroy"
                    }
                }
            }
        }
    }
}
