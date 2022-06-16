pipeline {
    agent {
        label "linux"
    }

    environment{
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
            when {
                branch 'dev'
            }
            steps {
                sh 'terraform import aws_s3_bucket.backend'
                // sh 'terraform apply --auto-approve'
                // script {
                //     S3_BUCKET = sh(returnStdout: true, script: "terraform output s3-bucket-name").trim()
                //     echo S3_BUCKET
                // }
            }
        }

        stage('Terraform Destroy') {
            when {
                branch 'destroy'
            }
            steps {
                sh 'terraform destroy --auto-approve'
                echo 'bucket destroy'
            }
        }
    }
}
