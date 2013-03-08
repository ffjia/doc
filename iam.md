# EC2 IAM tools

## Setup

    $ cat <<EOF > $HOME/.aws-credentials-master
    AWSAccessKeyId=<Write your AWS access ID>
    AWSSecretKey=<Write your AWS secret key>
    EOF

    $ chmod 600 $HOME/.aws-credentials-master

## List groups

    $ iam-userlistgroups --aws-credential-file ~/.aws-credentials-stage -u 'user@domain.tld'
    arn:aws:iam::xxxxxxxxxxxx:group/Operations
    IsTruncated: false

## SSL certificate

    $ iam-servercertupload --aws-credential-file ~/access-credential.properties -b domain.crt -k domain.key -c domain.keychain -s my_domain
    $ iam-servercertgetattributes --aws-credential-file ~/access-credential.properties -s my_domain
    arn:aws:iam::xxxxxxxxxxxx:server-certificate/my_domain
    RRRRRRRRRRRRRRRRRRRRR

    # Create SSL ELB listener
    $ elb-set-lb-listener-ssl-cert lb-name --aws-credential-file ~/aws-credential.properties --region eu-west-1 --lb-port 443 --cert-id arn:aws:iam::xxxxxxxxxxxx:server-certificate/my_domain

    $ iam-servercertlistbypath --aws-credential-file ~/.aws-credentials-stage
    arn:aws:iam::xxxxxxxxxxxx:server-certificate/my_domain
    arn:aws:iam::yyyyyyyyyyyy:server-certificate/Self_signed_cert
    IsTruncated: false
