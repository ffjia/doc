# EC2 API tools

## Volume

    $ ec2-create-volume --region us-east-1 --availability-zone us-east-1c --size 1024
    $ ec2-attach-volume --region us-east-1 vol-xxxxxxxx --instance i-xxxxxxxx --device /dev/sdb

    # Remove all the "available" volumes
    for i in `ec2-describe-volumes --filter "status=available" | awk '{print $2}'`
    do
        ec2-delete-volume $i
    done

## Image

    $ ec2-create-image --region us-east-1 --name My-Image-20110419 --description My-Image-20110419 --no-reboot i-xxxxxxxx
    $ ec2-modify-image-attribute --region eu-west-1 ami-xxxxxxxx -l --add 111111111111
    $ ec2-modify-image-attribute --region eu-west-1 ami-xxxxxxxx -l --remove 111111111111

## Misc

    $ ec2-get-password --region ap-southeast-1 i-xxxxxxxx -k .ec2-keys/keypair.pem

    $ ec2-run-instances ami-xxxxxxxx --region us-east-1 --instance-type m1.small --key mykey --group group1 --group group2 --availability-zone us-east-1c --block-device-mapping /dev/sda1=:30 --instance-count 1
    $ ec2-run-instances -b '/dev/sdb=ephemeral0' -b '/dev/sdc=ephemeral1'

    $ ec2-describe-group --filter ip-permission.cidr=11.11.11.11/32

    # http://docs.amazonwebservices.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-ImportKeyPair.html
    $ ec2-import-keypair --region $region keyname --public-key-file keyname.ppk


## Related Links

http://docs.amazonwebservices.com/AWSEC2/latest/CommandLineReference/
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Filtering.html
http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-volumes.html
