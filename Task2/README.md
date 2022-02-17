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
7. If you sign up in AWS for the first time, you will have the opportunity to use SOME AWS services for free (free tier) for 1 year. To register, you need a credit card from which it will be debited and returned 1-2$. *I have done this*
8. Read about AWS Free Tier. **Be aware what is free for new users and what is paid by your own money. Be sure and attentive.** *Yes there is limit for free tier*
9. **Pay attention to the Billing & Cost Management Dashboard in your account.** *Thanks*

Mandatory tasks
---------------

1. Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
2. Explore AWS Billing for checking current costs.
3. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
4. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
5. Make sure  ping and SSH are allowed from one instance to another in both ways. Configure SSH connectivity between instances using SSH keys.
6. Install web server (nginx/apache) to one instance;
   - Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
   - Make sure your web server is accessible from the internet and you can see your web page in your browser;
   - Make sure on the instance without nginx/apache you also maysee the content of your webpage from instance with nginx/apache.



EXTRA (optional):
-----------------

1. Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)
2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
3. Run step.6 without “manual” EC2 SSH connection.

EXTRA (optional optional):
--------------------------

1. Make a screenshot only of your web page сontent from your browser.
2. Create your S3 bucket and place your screenshot there.
3. Make your screenshot visible on the internet for everyone and make sure it works.

**As a result of this task should be a link in your github on the your “Hello World” web page. After task check by your mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually.**
