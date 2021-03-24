/* import shared library */
@Library('test-shared-library')_

pipeline {
     environment {
       IMAGE_NAME = "staticwebsite"
       IMAGE_TAG = "latest"
       STAGING = "stef-staging"
       PRODUCTION = "stef-production"
     }
     agent none
     stages {
         stage('Build image') {
             agent any
             steps {
                script {
                  sh 'docker build -t stef/$IMAGE_NAME:$IMAGE_TAG .'
                }
             }
        }
        stage('Run container based on builded image') {
            agent any
            steps {
               script {
                 sh '''
                    docker run --name $IMAGE_NAME -d -p 80:8000 -e PORT=8000 stef/$IMAGE_NAME:$IMAGE_TAG
                    sleep 5
                 '''
               }
            }
       }
  }
   post {
       always {
       script {
         slackNotifier currentBuild.result
     }
    }  
    }
}
