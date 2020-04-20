#!/bin/bash
######################################
#                                    #
# This script is an interactive tool #
#     to setup the demo project      #
#                                    #
######################################

echo '
######################################
#                                    #
#    Welcome to the DevOps demo!     #
#                                    #
######################################
'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "Running with:${YELLOW}
BUCKET_NAME=${BUCKET_NAME}
VPC_ID=${VPC_ID}
REGION=${REGION}${NC}
"

# CREATE THE INITIAL BUCKET
echo "First we will create an S3 Bucket using CloudFormation"
CMD="aws cloudformation deploy
        --stack-name flask-cicd-bucket
        --template-file infra/bucket.yaml
        --parameter-overrides BucketName=$BUCKET_NAME
        --region $REGION"

echo "Running:
${RED}${CMD}${NC}"
$CMD > /dev/null

echo "This bucket is needed to store some files for our main stack, such as the code of our application as a zip, let us upload that code to the bucket"


# Upload the code for the codecommit repo
cd code && zip -r -D ../repo-contents.zip * -x '*.git*' -x '*pycache*' > /dev/null && cd ..
aws s3 cp repo-contents.zip s3://$BUCKET_NAME/repo-contents.zip

# CREATE THE MAIN STACK
CMD="aws cloudformation deploy
        --stack-name flask-cicd-main
        --template-file infra/main.yaml
        --capabilities CAPABILITY_IAM
        --parameter-overrides BucketName=$BUCKET_NAME VpcId=$VPC_ID
        --region $REGION"

echo "Now we have everything in place to create the main stack! we will create it by running
${RED}${CMD}${NC}"
$CMD > /dev/null


