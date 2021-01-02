#!/bin/bash
MD=`which mkdir`
LINK=`which ln`
TF_13_CMD=`which terraform-13`
STRUCT="src/terraform"
SOURCE_LN="modules"

function SetupDirStructure() {
	 pushd $JOB_NAME
         ${MD} -p "{STRUCT}" 
         ${LINK} -s ${SOURCE_LN} "${STRUCT}/modules" 
}

function Tf_Init() {
	${TF_13_CMD} init

}


function Tf_Plan() {
      ${TF_13_CMD} plan -var-file="env/${ENV}/variables.tfvars"

}
