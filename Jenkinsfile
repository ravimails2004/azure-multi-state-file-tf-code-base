pipeline {
         agent any
        environment {
          ARM_CLIENT_ID     = credentials('ARM_CLIENT_ID')
          ARM_CLIENT_SECRET = credentials('ARM_CLIENT_SECRET')
          ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
          ARM_TENANT_ID = credentials('ARM_TENANT_ID')
          ARM_ACCESS_KEY = credentials('ARM_ACCESS_KEY')
        }

         stages {
                 stage('SetupDirStructure') {
                 steps {
                     echo 'Setting up Directory Structure'
  	             sh ". ./execute-tf.sh; SetupDirStructure"
                 }
                 }
                 stage('yesorno') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 
                 stage('proceed') {
                 steps {
                    echo('yes')
                 }
                 }
}
}

