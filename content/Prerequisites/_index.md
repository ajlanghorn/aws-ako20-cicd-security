+++
title = "Prerequisites"
date = 2019-07-08T13:08:10+01:00
weight = 1
chapter = true
pre = "<b>0. </b>"
draft = false
+++

# Assumptions

Today's session assumes:

- you have your laptop with you;
- your laptop has Git installed;
- you have access to a GitHub.com account of your own;
- you have basic familiarity of Git, including committing, pushing, pulling and cloning;
- you have adequate knowledge of using a terminal emulator, such as iTerm, Terminal or PowerShell.

# Prerequisites

Before we can start today's lab, we need to set a few things up. Let's get going!

### AWS account

For the purposes of today's session, we've provided you with an AWS account. In all but a small number of very specific ways, this account is exactly the same as if you were to open it yourself via the AWS website. Specifically, you don't need to enter billing details, wait for account verification or register for support plans. Further, the account is - in some small ways - restricted. None of these features are required to complete today's session.

You should have already been provided with a twelve character Team Hash by the session team. If not, raise your hand and ask! Each individual attendee should have their own Team Hash.

1. Visit https://dashboard.eventengine.run, and enter your Team Hash.
2. Click the AWS Console button in the console to find a link to the AWS Console, as well as IAM credentials.
3. Open the AWS Console.

For today's session, note that we are working in **EU (Ireland)**. Access to other regions is not needed.

### Repositories

Before we begin, you'll need to fork [this repository](https://github.com/ajlanghorn/dvja) to your own GitHub.com account. You can do this by visiting the repository in a browser, and clicking Fork along the top. Take a note of the resulting repository URL, as you'll need this later on.

For example, given a GitHub.com username of `jeff`, then your forked repository's URL would be `https://github.com/jeff/dvja`.

At this point, you should also clone the forked repository locally, too - you'll be making changes in today's session and pushing them back to the repository.

### Jenkins

1. Open the AWS Console
1. Open the CloudFormation console, at https://console.aws.amazon.com/cloudformation.
1. Open the AKO stack, and choose the Outputs tab.
1. Make a note of the URL provided - this is the DNS name for the ALB in front of Jenkins.
1. Authenticate with the username `bigco` and the passphrase `bigco`
