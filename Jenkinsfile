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
                   script {
                  if ( ${project_type} == 'vnet' ) {
                     echo "Executing according to vnet"
                    }
                  else {
                     echo "Executing according to simple project"
                                             
                    }
                  }
                }
              }
}
}
