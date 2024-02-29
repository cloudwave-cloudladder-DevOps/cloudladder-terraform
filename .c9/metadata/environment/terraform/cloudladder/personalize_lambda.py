{"filter":false,"title":"personalize_lambda.py","tooltip":"/terraform/cloudladder/personalize_lambda.py","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":0,"column":0},"end":{"row":50,"column":4},"action":"insert","lines":["import boto3","ec2 = boto3.resource('ec2')","","def lambda_handler(event, context):","    a_value = event['user_id']","    b_value = event['item_id']","    bucket_name = event['downloadfrom']","    ","    user_data = f'''#!/bin/bash","    aws s3 cp s3://{bucket_name}/items.csv ./items.csv","    aws s3 cp s3://{bucket_name}/2_lambda_foru.py ./lambda2.py","    aws s3 cp s3://{bucket_name}/upload.py ./upload.py","","    sudo yum install python3 -y","    sudo yum install python3-pip -y","    sudo pip3 install pandas","    sudo pip3 install Pyarrow","    sudo pip3 install numpy","    sudo pip3 install python-dateutil","    sudo pip3 install boto3","    echo \"a = '{a_value}'\" > config.py","    echo \"b = '{b_value}'\" >> config.py","    python3 lambda2.py","    sleep 5","    python3 upload.py","    sleep 30","    sudo shutdown now -h","    ","    '''","    ","    instance = ec2.create_instances(","        ImageId='ami-097bf0ec147165215',","        MinCount=1,","        MaxCount=1,","        KeyName='cloudladder',","        UserData=user_data,","        InstanceType='t2.nano',","        NetworkInterfaces=[","            {","                'AssociatePublicIpAddress': True,","                'DeviceIndex': 0,","                'Groups': ['sg-0cdbb15456fa2e5bd'],","                'SubnetId': 'subnet-088f26655bda2b608',","            }","        ],","        IamInstanceProfile={","            'Arn': 'arn:aws:iam::611155787285:instance-profile/2_lambda_ec2make', ","        }","    )","    ","    "],"id":1}],[{"start":{"row":50,"column":0},"end":{"row":50,"column":4},"action":"remove","lines":["    "],"id":2},{"start":{"row":49,"column":4},"end":{"row":50,"column":0},"action":"remove","lines":["",""]},{"start":{"row":49,"column":0},"end":{"row":49,"column":4},"action":"remove","lines":["    "]},{"start":{"row":48,"column":5},"end":{"row":49,"column":0},"action":"remove","lines":["",""]}]]},"ace":{"folds":[],"scrolltop":165,"scrollleft":0,"selection":{"start":{"row":48,"column":5},"end":{"row":48,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":7,"state":"start","mode":"ace/mode/python"}},"timestamp":1708961702564,"hash":"050dd6077ca792827bf31159230373bfd220de6c"}