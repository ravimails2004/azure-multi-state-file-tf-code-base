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
}

function SetupDirStructuresimple() {
         ${MD} -p "${WORKSPACE}/${JOB_NAME}/${STRUCT}"
         ${LINK} -s "${WORKSPACE}/modules"  "${WORKSPACE}/${JOB_NAME}/${STRUCT}/modules"
	 ${LINK} -s "${WORKSPACE}/projectvnetdatalookup/${ENV}/sdlc-common.tf"   "${WORKSPACE}/${JOB_NAME}/sdlc-common.tf"
	 ${LINK} -s "${WORKSPACE}/${JOB_NAME}/env/${ENV}/project-backend.tf"         "${WORKSPACE}/${JOB_NAME}/project-backend.tf"
}



function Tf_Init() {
 	cd ${JOB_NAME} && ${TF_13_CMD} init 

}


function Tf_Plan() {
    cd ${JOB_NAME} && ${TF_13_CMD} plan -var-file="env/${ENV}/variables.tfvars"

}

function Tf_Apply() {
    cd ${JOB_NAME} && ${TF_13_CMD} apply -var-file="env/${ENV}/variables.tfvars" -auto-approve

}

function Tf_Destroy() {
     cd ${JOB_NAME} && ${TF_13_CMD} destroy -auto-approve
}

"$@"

#SetupDirStructure
#Tf_Init
#pwd
#Tf_Plan
