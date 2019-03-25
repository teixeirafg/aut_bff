properties([parameters([choice(choices: ['cb', 'pf'], description: 'Loja que será executado o teste', name: 'STORE'), choice(choices: ['dev', 'hlg', 'stg', 'prd'], description: 'Ambiente que será executado o teste', name: 'ENV')])])

pipeline{
    agent any
    stages {
        stage ('Git glone'){
            steps{
                git credentialsId: '162867e6-c39e-4528-8aa1-9198bccd5e9e', url: 'http://andre.moreira@bitbucket.viavarejo.com.br/scm/frqa/vv-aut-app-bff-rest.git'
            }
        }
        stage ('Bundle configuration') {
                steps {
                    bat 'bundle install'
                }
        }
        stage ('Acceptance test with Cucumber') {
            steps {
                bat 'cucumber -p %STORE% -p %ENV% -p json_report -t @banners'
            }
        }
    }

    post {
        success {
           script {
             cucumber fileIncludePattern: 'reports/*.json', sortingMethod: 'ALPHABETICAL'
           }
        }

        failure {
          script {
            cucumber fileIncludePattern: 'reports/*.json', sortingMethod: 'ALPHABETICAL'
            }
         }
    }
}
