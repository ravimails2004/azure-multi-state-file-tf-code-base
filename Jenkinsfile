pipeline {
         agent any
        environment {
          ARM_CLIENT_ID     = credentials('ARM_CLIENT_ID')
          ARM_CLIENT_SECRET = credentials('ARM_CLIENT_SECRET')
          ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
          ARM_TENANT_ID = credentials('ARM_TENANT_ID')
          dev = credentials('ARM_ACCESS_KEY_DEV')
          preprod = credentials('ARM_ACCESS_KEY_PREPROD')
          prod = credentials('ARM_ACCESS_KEY_PROD')
              ARM_ACCESS_KEY = {ENV}
         
        }

         stages {
                 stage('SetupDirStructure') {
                 steps {
                   script {
                   echo "Doing env print ${ARM_ACCESS_KEY}"
                  if ( env.project_type == 'vnet' ) {
                     echo "Executing according to vnet"
                     sh 'chmod +x execute-tf.sh'
                     sh './execute-tf.sh SetupDirStructurevnet'
                    }
                  else {
                     echo "Executing according to simple project"
                     sh 'chmod +x execute-tf.sh'
                     sh './execute-tf.sh SetupDirStructuresimple'
                                             
                    }
                  }
                }
              }
              stage('Initialize tf-13') {
                 steps {
                    echo 'initializing tf 13'
                    sh './execute-tf.sh Tf_Init'
                 }
                 }

                 stage('Displaying tf-13 plan') {
                 steps {
                    echo 'Displaying the tf-13 planning'
                    sh './execute-tf.sh Tf_Plan'
                 }
                 }
                stage('Approval Phase1') {
                   steps {
                   input ('Do you want to proceed?')
                 }
                 }
                stage('Displaying tf-13 apply auto-approve') {
                 steps {
                    echo 'Displaying the tf-13 apply'
                    sh './execute-tf.sh Tf_Apply'
                 }
                 }
}
post {
        always {
            cleanWs()
        }
    }
}
