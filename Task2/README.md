My Exadel Task 2 project
======================================================

Important moments:
------------------
1. Read about Cloud Services. Pros and Cons, Cloud VS Bare Metal infrastructure? I have read about it [here](https://www.volico.com/bare-metal-server-or-cloud-servers-whats-the-difference/)
2. Read about Region, Zone in AWS. What are they for? Which one will you use and why? I have read about it [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)
3. Read about Security best practices in IAM. I have read about it [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
4. Read about AWS EC2, what is it, what is it useful for? I have read about it [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
5. Read about AWS VPC (SG, Route, Internet Gateway). I have read about it [here](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
6. Read about AWS Cloud storage, Route 53, CloudFront and CloudWatch. I have read about [AWS Cloud storage](https://aws.amazon.com/ru/products/storage/), [Route 53](https://aws.amazon.com/ru/route53/), [CloudFront and CloudWatch](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/monitoring-using-cloudwatch.html)
7. If you sign up in AWS for the first time, you will have the opportunity to use SOME AWS services for free (free tier) for 1 year. To register, you need a credit card from which it will be debited and returned 1-2$. *I have done this. It costs about $1 for billing purpose*
8. Read about AWS Free Tier. **Be aware what is free for new users and what is paid by your own money. Be sure and attentive.** *Yes there is limit for free tier*
9. **Pay attention to the Billing & Cost Management Dashboard in your account.** *Thanks*

Mandatory tasks
---------------

1. Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI. *Answer: I signed up for AWS, and familiarized with the basic of the Home Console GUI. The address is https://console.aws.amazon.com/* 
2. Explore AWS Billing for checking current costs. *Answer: I saw billing and costs from [AWS Billing Dashbord](https://console.aws.amazon.com/billing/home)*
3. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate. *Answer: I created two EC2 Instance t2.micro with Amazon linux and Ubuntu and tried to stop with Stop instance, restart with Reboot instance, delete with 
   Terminate instance, recreate with Terminate instance and Launch instance (or Launch instance from template).*
   ![created ec2 instances](./images/1.png)
4. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it? *Answer: By befault SSH connection added in rules (PS: added http and https rules in Security Group, I used http only in my exmples), so SSH connection work perfectly between my host and EC2. 
   Public ip for Amazon linux is 3.142.166.10 and private ip is 172.31.1.137. Public if for Ubuntu linux is 3.19.67.215 and private ip is 172.31.31.123*
5. Make sure  ping and SSH are allowed from one instance to another in both ways. Configure SSH connectivity between instances using SSH keys. *Answer: ping and SSH passed, they are worked and created key with name iskandarsamazon.pem and copied all instances and connected between instances with this key like ssh -i "iskandarsamazon.pem" ec2-user@ec2-3-142-166-10.us-east-2.compute.amazonaws.com and ssh -i "iskandarsamazon.pem" ubuntu@ec2-3-19-67-215.us-east-2.compute.amazonaws.com, before you should run chmod command chmod 400 iskandarsamazon.pem*
6. Install web server (nginx/apache) to one instance;
   - Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
   - Make sure your web server is accessible from the internet and you can see your web page in your browser;
   - Make sure on the instance without nginx/apache you also may see the content of your webpage from instance with nginx/apache.
   
   *Answer: Installed web server Nginx to Ubuntu instance* 
   - *created web page with text "Hello world" and additional information about OS version, free disk space,  free/used memory in the system and about all running processes(used commands like lsb_release -a, df -h, du -h, ps -aux)*
   - *Web server is accessible from the internet and web page is [here](http://ec2-3-19-67-215.us-east-2.compute.amazonaws.com/)*
     ![created ec2 instances](./images/2.png)
   - *I tested on the instance without nginx to see my instance which has nginx with command curl http://ec2-3-19-67-215.us-east-2.compute.amazonaws.com*
     ![created ec2 instances](./images/3.png)



EXTRA (optional):
-----------------

1. Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP). *Answer: I created a new VPC in VPC dashboard in AWS with name Iskandars VPC.
   ![created ec2 instances](./images/4.png) Then, created Internet Gateway and attached to my Iskandars VPC (for connection to the internet).
   ![created ec2 instances](./images/5.png) Next, I created two public and two private subnets, which in availability zone A and availability zone B with one public and private subnets accordingly 
   (for public subnets enable assigning public IPv4 addresses).![created ec2 instances](./images/6.png) Then I modified Route tables for public subnets to grant them access to the internet. Added new 0.0.0.0/0 route which will be pointed towards my Internet Gateway. ![created ec2 instances](./images/7.png) 
According to the fact that my private subnets don't have public IPs I will need to attach them to NAT Gateway because they will not be able to go through Internet Gateway without Public IP. So first thing I will do is to create two NAT Gateways one for Private Subnet A and another one For 
   Private Subnet B. NAT Gateway also requires an elastic IP. then create a private Route Table which will be pointed towards my NAT Gateway. ![created ec2 instances](./images/8.png)
Now to Test out my VPC I will launch two instances one will be auto scaled in public subnets A and B so if it goes
   down for some reason it will automatically scale back to one and one in private subnet and I will SSH from public
   instance to the private one and see if private instance has connection to the internet. I created a Launch Template with Amazon linux instance and User Data to start Apache Web Server and serve HTML static page. Then, I created Auto Scale Group choosing launch template and following network.
   options![created ec2 instances](./images/10.png) And here can be seen that instance started with all checks.![created ec2 instances](./images/11.png) Now, Check Static page and Static page is reachable.![created ec2 instances](./images/12.png) Then, I created new instance from Ubuntu in 
   Private Subnet B. ![created ec2 instances](./images/13.png) I configured Security Group for only SSH. ![created ec2 instances](./images/14.png) Then, I passed via SSH to public host and then from it passed to private host via SSH.![created ec2 instances](./images/15.png)*
2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version. *Answer: [Install.sh](./Install.sh) BASH script for installing web server with "Hello World" and OS information.*
3. Run step.6 without “manual” EC2 SSH connection. *Answer: I used User data section to run without "manual" EC2 SSH connection* ![created ec2 instances](./images/9.png)

EXTRA (optional optional):
--------------------------

1. Make a screenshot only of your web page сontent from your browser.
2. Create your S3 bucket and place your screenshot there.
3. Make your screenshot visible on the internet for everyone and make sure it works.

**As a result of this task should be a link in your github on the your “Hello World” web page. After task check by your mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually.**
