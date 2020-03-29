# Create the initial bucket
aws cloudformation create-stack --stack-name flask-cicd-bucket --template-body file://infra/bucket.yaml

# Upload the code for the codecommit repo
cd code && zip -r -D ../repo-contents.zip * -x '*.git*' -x '*pycache*'&& cd ..
aws s3 cp repo-contents.zip s3://flask-app-cicd-bucket-arongeerts/repo-contents.zip

# Cloudformation build the resources
aws cloudformation create-stack --stack-name flask-cicd-main --template-body file://infra/main.yaml --capabilities CAPABILITY_IAM