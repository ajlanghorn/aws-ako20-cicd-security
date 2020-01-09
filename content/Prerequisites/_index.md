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
- you have adequate knowledge of using a terminal emulator, such as iTerm, Terminal or PowerShell;
- you have access to an Isengard-vended AWS account.

# Prerequisites

Before we can start today's lab, we need to set a few things up. Let's get going!

### AWS account

For the purposes of today's session, we're going to make use of existing accounts via [Isengard](https://isengard.amazon.com). In future, we aim to make use of other ways to create and vend accounts, especially when we present this session to external audiences.

If you already have an account that you wish to use, then feel free to skip this section. Otherwise, create a new account in Isengard, remembering to set the following attributes:

- `Account Type`: `Individual`
- `Data Classification`: `Account is not used for production`

There is no need to change S3 Public Access settings or to opt-in to any newer regions. As long as you stick to the same region consistently, you are able to make use of any commercial region for today's session.

### CloudFormation

We need some base infrastructure to be set up, which is contained within [this](https://github.com/ajlanghorn/aws-ako20-cicd-security/blob/master/cloudformation/template.json) CloudFormation template.

1. Clone [this repository](https://github.com/ajlanghorn/aws-ako20-cicd-security) locally
1. Open the CloudFormation console, at https://console.aws.amazon.com/cloudformation
1. Click `Create Stack`, then choose the option to create the stack with new resources
1. Under `Prerequisites`, choose `Template is ready`
1. Under `Specify Template`, choose `Upload a template file`, and navigate to `cloudformation/template.json` in your cloned repository. Click Next.
1. Enter a descriptive, but short, stack name. Stuck for ideas? Use `ako20`.
1. Leave the parameters as their default setting
1. Click Next, then Next again
1. Scroll to the bottom, and click to confirm that you acknowledge that CloudFormation might create IAM resources
1. Click Create Stack

This process takes between five and ten minutes to complete. You can monitor completion in the Resources tab, or by checking for the stack status itself to turn to complete.

### Repositories

Next, you'll need to fork [this repository](https://github.com/ajlanghorn/dvja) to your own GitHub.com account. You can do this by visiting the repository in a browser, and clicking Fork along the top. Take a note of the resulting repository URL, as you'll need this later on.

For example, given a GitHub.com username of `jeff`, then your forked repository's URL would be `https://github.com/jeff/dvja`.

At this point, you should also clone the forked repository locally, too - you'll be making changes in today's session and pushing them back to the repository.

### Jenkins

1. Open the AWS Console
1. Open the CloudFormation console, at https://console.aws.amazon.com/cloudformation.
1. Open the AKO stack, and choose the Outputs tab.
1. Make a note of the URL provided - this is the DNS name for the ALB in front of Jenkins
1. Visit the URL, and authenticate with the username `bigco` and the passphrase `bigco`
