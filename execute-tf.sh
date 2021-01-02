#!/bin/bash
MD=`which mkdir`
TF_13_CMD=`which terraform-13`
STRUCT="src/terraform"

function SetupDirStructure() {
         ${MD} -p ${STRUCT} 

}

function Tf_Init() {
	${TF_13_CMD} init

}


function Tf_Plan() {
      ${TF_13_CMD} plan -var-file="env/${ENV}/variables.tfvars"

}
