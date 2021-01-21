#!/bin/bash
MD=`which mkdir`
LINK=`which ln`
TF_13_CMD=`which terraform-13`
STRUCT="src/terraform"
SOURCE_LN="modules"

function SetupDirStructurevnet() {
         ${MD} -p "${WORKSPACE}/${JOB_NAME}/${STRUCT}" 
         ${LINK} -s "${WORKSPACE}/modules"  "${WORKSPACE}/${JOB_NAME}/${STRUCT}/modules" 
	 ${LINK} -s "${WORKSPACE}/vnetstatefiles/${ENV}/backend.tf" "${WORKSPACE}/${JOB_NAME}/backend.tf"
	 export ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
	 export env.ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
}

function SetupDirStructuresimple() {
         ${MD} -p "${WORKSPACE}/${JOB_NAME}/${STRUCT}"
         ${LINK} -s "${WORKSPACE}/modules"  "${WORKSPACE}/${JOB_NAME}/${STRUCT}/modules"
	 ${LINK} -s "${WORKSPACE}/projectvnetdatalookup/${ENV}/sdlc-common.tf"   "${WORKSPACE}/${JOB_NAME}/sdlc-common.tf"
	 ${LINK} -s "${WORKSPACE}/${JOB_NAME}/env/${ENV}/project-backend.tf"         "${WORKSPACE}/${JOB_NAME}/project-backend.tf"
	 export ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
	 export env.ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
}



function Tf_Init() {
	export ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
 	cd ${JOB_NAME} && ${TF_13_CMD} init -reconfigure

}


function Tf_Plan() {
    export ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
    cd ${JOB_NAME} && ${TF_13_CMD} plan -var-file="env/${ENV}/variables.tfvars"

}

function Tf_Apply() {
    export ARM_ACCESS_KEY=ARM_ACCESS_KEY_{ENV}
    cd ${JOB_NAME} && ${TF_13_CMD} apply -var-file="env/${ENV}/variables.tfvars" -auto-approve

}

"$@"

#SetupDirStructure
#Tf_Init
#pwd
#Tf_Plan
