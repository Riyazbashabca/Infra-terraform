pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Auto apply?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Action')
    }

    environment {
        ARM_CLIENT_ID       = credentials('azure-client-id')
        ARM_CLIENT_SECRET   = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_TENANT_ID       = credentials('azure-tenant-id')
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/YOUR-REPO.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Apply / Destroy') {
            steps {
                script {

                    if (params.action == 'apply') {

                        if (!params.autoApprove) {
                            def plan = readFile 'tfplan.txt'
                            input message: "Approve Terraform Apply?",
                                  parameters: [text(name: 'Plan', defaultValue: plan)]
                        }

                        sh "terraform apply -input=false tfplan"

                    } else {
                        input message: "Confirm DESTROY?"
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
    }
}