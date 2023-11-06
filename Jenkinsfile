pipeline{
    environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    
    agent any
     parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
    }
    
    
    stages{
        stage("clone") {
            steps {
            echo "cloning the code"
            git url:"https://github.com/darshanchavan1211/terraform-jenkins.git" , branch: "main"
            }
        }
        stage("paln") {
            steps {
                sh "terraform init"
                sh "terraform plan -out tfplan"
                sh "terraform show -no-color tfplan > tfplan.txt"
                
            }
            
        }
       stage('Apply / Destroy') {
            steps {
                script {
                    if (params.action == 'apply') {
                

                       // sh 'terraform ${action} -input=false tfplan'
                           sh 'terraform ${action} '
                    } else if (params.action == 'destroy') {
                        sh 'terraform ${action} --auto=approve '
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                }
            }
            
       }
    }
}





