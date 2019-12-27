+++
title = "Prerequisites"
date = 2019-07-08T13:08:10+01:00
weight = 1
chapter = true
pre = "<b>0. </b>"
draft = false
+++

# Prerequisites

Before we can start today's lab, we need to set a few things up. Let's get going!

### Getting access to your AWS account

For the purposes of today's session, we've provided you with an AWS account. In all but a small number of very specific ways, this account is exactly the same as if you were to open it yourself via the AWS website. Specifically, you don't need to enter billing details, wait for account verification or register for support plans. Further, the account is - in some small ways - restricted. None of these features are required to complete today's session.

You should have already been provided with a twelve character Team Hash by the session team. If not, raise your hand and ask! Each individual attendee should have their own Team Hash.

1. Visit https://dashboard.eventengine.run, and enter your Team Hash.
2. Click the AWS Console button in the console to find a link to the AWS Console, as well as IAM credentials.
3. Open the AWS Console.

For today's session, note that we are working in **EU (Ireland) (eu-west-1)**. Access to other regions is not needed.

### Architecture

#### Infrastructure

The AWS account you're using today has some infrastructure pre-provisioned inside, as detailed in the diagram below. It's important to understand what we're working with if we're going to extend it further.

- A VPC containing a public subnet in a single AZ
- An `m5.large` EC2 instance, running [Jenkins](https://jenkins.io), with an attached Elastic IP address

#### Build

Our 'build architecture' is the software deployed, and the pipelines configured within this software, to deploy our vulnerable software. The build architecture is what we'll be updating and using for the majority of this workshop, as we look to stop the deployment of our known-vulnerable software as soon as possible!

To make use of Jenkins, which acts as the main entry point in to our pipelines, we need to get hold of the Elastic IP address associated with the server. To do this:

1. Open the AWS Console
1. Open the EC2 Console, at https://console.aws.amazon.com/ec2
1. Click Instances on the left, then find the instance named `Jenkins`
1. In the bottom pane, find the Elastic IPv4 address attached to the instance
1. You can connect to Jenkins at http://<elastic_ip>:8080
