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
   - Create a web page with the text ???Hello World??? and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
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
   ![created ec2 instances](./images/4.png) Then, I created subnet for this VPC. ![created ec2 instances](./images/17.png) I created two instances, first one with public host and has connection external and Web Server installing with User Data in default VPS, second one with private host and has 
   connection internal in my created Iskandars VPC. ![created ec2 instances](./images/19.png) Then, I created peering connection with requester VPC is default and accepter is Iskandars VPC. ![created ec2 instances](./images/20.png) Then, I added route in Route tables in default VPC with 
   destination to 10.0.0.46/32 (private IP) and target to our peering connection. ![created ec2 instances](./images/21.png) Then, I tested connection between them, firstly, connected to public host (Amazon linux) via SSH and from it connected to private host (Ubuntu). 
![created ec2 instances](./images/22.png)*
2. Write BASH script for installing web server (nginx/apache) and creating web pages with text ???Hello World???, and information about OS version. *Answer: [Install.sh](./Install.sh) BASH script for installing web server with "Hello World" and OS information.![created ec2 instances](./images/18.png)*
3. Run step.6 without ???manual??? EC2 SSH connection. *Answer: I used User data section to run without "manual" EC2 SSH connection* ![created ec2 instances](./images/16.png)

EXTRA (optional optional):
--------------------------

1. Make a screenshot only of your web page ??ontent from your browser. *Answer: I made a screenshot my page content from my browser*
2. Create your S3 bucket and place your screenshot there. *Answer: I created my S3 bucket from AWS S3 service in section "Create bucket" and configured from [S3 console dashboard](https://s3.console.aws.amazon.com/) (Can be blocked all public acces or not).*
3. Make your screenshot visible on the internet for everyone and make sure it works. *Answer: I made screenshot visible with action "Share with a presigned URL" with one day. The [link](https://iskandarsbucket.s3.us-east-2.amazonaws.com/12.png?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCmFwLXNvdXRoLTEiRjBEAiABIbafhTavHZSq3N5TnmLfid0bx86FeyxIMFiUQAOGgAIgcWBh8OnxPHWV2s3PQjzla3%2BCpA9bNkGG72J34StQqHEq5AIIFxAAGgwxNjQ4ODc0NzQxODMiDEAuVrYqg6Z6CHQd7SrBAhTX56cLFoF25wCgJcSc9Vlqi2YqdCkgxiU4u3aqAN0JG8OXA9jGRa9veNJXkfwdEbz5yqo3oC7%2FyyGY321%2BV3QYe8s7xyb54TgQww6qbxeYK6d%2Bpv0Ck5H2t%2BR577Z0tXrnVMOqw2x8bZSKbZQZPoD68%2BZ6%2FZHePv%2Fo1%2B7d4MHRw%2FrwAFgLPUfK8%2FfLut4Ls68MWNRJyaHbXEfgC4XSiSQr14pCbatWYtYMExlec%2Fw4YN%2FjuLhNzesQn702Jc3l%2FTi3RunXdiYeSv0aBmy8na4Nb%2BVA1Tax7dJOloS2PXonwEWFk2DmyGpiNhnq2dB%2BD2gkiBXcZGRH8s97wwgJKre7xdAuQ5z%2BSAPg4VF9eQ4o0O4Wp%2FthDtLF0LqxxpHYIZUi3RAqG4xl4USERJ05h3TIiGzEhyxbCczaRcXfPmxEDzDSwMOQBjq0AgFdGfG3McqhVCVGZgjekd5xNEZtgYAKgkP2HnUexwrspbopOxzmOKFKuxHJxbLiuU%2B6n1EDBub2qvQT%2FusZ%2BjCrPqCpXqy3Qpsc7gXgY0YDLw5%2B3Sgygg72%2FmRCtqDj6vMWIOGbTvSJuKf%2FHMC3c%2FjV%2FD8K5u%2BFi1Lyp2HpcegD6hjxoXf0cCmDDhkM350oa1pCdUBw25lpcUn2xVNjiZ089xtWnIG8dT%2Bc%2BnW5rAPxVqWVGndEBZ7zPzKVENfWggv9xqHdhYkHo2BbYEWI%2BoJqhxhH2yAIQNHD0StoBhR%2BIptObtXkN0cI2e%2FzdBw%2BWDSzdgNQnr54dn5rskNEqYi2tvdeuQtWEUUl87QPCW36qMba2CTbR8jurh9FF6PAkegKVjuvAf%2BDJleiZITOa1R7bGUy&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220219T140307Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=ASIASMZAPGAD25J54QCA%2F20220219%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Signature=470fe4cdb7aa3ca4415f043f76a508986465639c9084f15358daaa553689c38d) for my screenshot*

**As a result of this task should be a link in your github on the your ???Hello World??? web page. After task check by your mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually.**
