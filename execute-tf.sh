#!/bin/bash
MD=`which mkdir`
LINK=`which ln`
TF_13_CMD=`which terraform-13`
STRUCT="src/terraform"
SOURCE_LN="modules"

function SetupDirStructure() {
         ${MD} -p "${WORKSPACE}/${JOB_NAME}/${STRUCT}" 
         ${LINK} -s "${WORKSPACE}/modules"  "${WORKSPACE}/${JOB_NAME}/${STRUCT}/modules" 
}

function Tf_Init() {
 	cd ${JOB_NAME} && ${TF_13_CMD} init

}


function Tf_Plan() {
    cd ${JOB_NAME} && ${TF_13_CMD} plan -var-file="env/${ENV}/variables.tfvars"

}

"$@"

#SetupDirStructure
#Tf_Init
#pwd
#Tf_Plan
