pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {

                git url: 'https://github.com/adresh8095-hub/terraform-enterprise.git'

            }

        }

        stage('Terraform Init') {

            steps {

                dir('environments/dev') {

                    sh 'terraform init'

                }

            }

        }

        stage('Terraform Validate') {

            steps {

                dir('environments/dev') {

                    sh 'terraform validate'

                }

            }

        }

        stage('Terraform Plan') {

            steps {

                dir('environments/dev') {

                    sh 'terraform plan'

                }

            }

        }

        stage('Terraform Apply') {

            steps {

                dir('environments/dev') {

                    sh 'terraform apply -auto-approve'

                }

            }

        }

    }

}
