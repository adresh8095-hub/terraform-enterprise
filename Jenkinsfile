pipeline {

    agent any

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

        stage('Terraform Plan') {

            steps {

                dir('environments/dev') {

                    bat 'terraform plan'

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
