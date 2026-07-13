pipeline {

    agent any

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
             credentialsId: 'aws-creds']
        ]) {
            bat '''
            echo AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID%
            echo AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY%
            echo AWS_SESSION_TOKEN=%AWS_SESSION_TOKEN%
            '''
        }
    }
}
        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds']
                ]) {
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
