## Basic

    $ elb-register-instances-with-lb test-lb --instances i-xxxxxxxx,i-xxxxxxxx,i-xxxxxxxx
    $ elb-enable-zones-for-lb test-lb --availability-zones us-east-1d
    $ elb-disable-zones-for-lb test-lb --availability-zones us-east-1b
    $ elb-deregister-instances-from-lb test-lb --instances *
    $ elb-describe-instance-health test-lb

    $ elb-create-lb-listeners test-lb --headers --listener "lb-port=443,instance-port=443,protocol=TCP"
    OK-Creating LoadBalancer Listener

    $ elb-delete-lb-listeners test-lb  --lb-ports 443

        Warning: Deleting a LoadBalancer listener can lead to service disruption to
        any customers connected to the LoadBalancer listener. Are you sure you want
        to delete this LoadBalancer listener? [Ny]y
    OK-Deleting LoadBalancer Listener


## Sticky Session

### HTTP

    # http://shlomoswidler.com/2010/04/elastic-load-balancing-with-sticky-sessions.html
    You need to use an HTTP listener in order to be able to set up a session stickiness policy. Your elb-create-lb command should have “http” instead of “tcp”:

    $ elb-create-lb c2 –availability-zones us-east-1a –listener “protocol=http, lb-port=80, instance-port=80″

    $ elb-create-app-cookie-stickiness-policy myLoadBalancer --cookie-name PHPSESSID --policy-name followPHPPolicy
    $ elb-set-lb-policies-of-listener myLoadBalancer --lb-port 80 --policy-names followPHPPolicy

    $ elb-create-lb-cookie-stickiness-policy myLoadBalancer --policy-name fifteenMinutesPolicy --expiration-period 900
    $ elb-set-lb-policies-of-listener myLoadBalancer --lb-port 80 --policy-names fifteenMinutesPolicy

### HTTPS

    # http://kkpradeeban.blogspot.com/2011/03/amazon-elb-https-stickiness.html
    $ elb-create-lb-listeners test-lb --headers --listener "lb-port=443,instance-port=443,protocol=https"
