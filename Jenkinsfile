pipeline {
    agent {
        label "linux"
    }

    environment{
        ACTION = "destroy"
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


        stage('Terraform status') {
            when {
                branch 'dev'
            }
            steps {
                script{
                    if(ACTION == "apply"){
                        sh 'terraform ${ACTION} --auto-approve'
                        S3_BUCKET = sh(returnStdout: true, script: "terraform output s3-bucket-name").trim()
                        echo S3_BUCKET
                    }else{
                        sh 'terraform ${ACTION} --auto-approve'
                        echo "Bucket destroy"
                    }
                }
            }
        }
    }
}
