pipeline {

    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {

        stage('Terraform Init') {
            steps {
                dir('environments/dev') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('environments/dev') {
                    bat 'terraform validate'
                }
            }
        }
stage('Check AWS Environment') {
    steps {
        withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'aws-creds',
             accessKeyVariable: 'AWS_ACCESS_KEY_ID',
             secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
        ]) {
            bat '''
            echo AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID%
            echo AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY%
            '''
        }
    }
}
        stage('Terraform Plan') {
    steps {
        withAWS(credentials: 'aws-creds', region: 'us-east-1') {
            dir('environments/dev') {
                bat 'terraform plan'
            }
        }
    }
}
        stage('Terraform Apply') {
            steps {
                dir('environments/dev') {
                    bat 'terraform apply -auto-approve'
                }
            }
        }

    }
}
