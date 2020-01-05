+++
title = "Pipelines-as-Code"
date = 2019-07-08T13:08:10+01:00
weight = 4
chapter = true
pre = "<b>3. </b>"
draft = false
+++

At BigCo, the phrase "you build it, you run it" is very much taken to heart. The software engineering community inside the organisation have created a list of responsibilities that each team within BigCo needs to adhere to. Amongst there is the idea that the continuous integration server each team uses is solely the responsibility of that team - if it breaks, they need to fix it!

BigCo's software teams have a long history of using [Jenkins](https://jenkins.io), due to its popularity within the industry. Teams then hand-cranked their specific installations to install plug-ins relevant to them, push configuration left, right and centre and more. One day, a physical disk drive stopped working, and - since then - teams have started to migrate their Jenkins configuration and pipeline definitions to code.

### Jenkinsfile

When you begin further research in to the Jenkinsfile, you realise that it has three main advantages (assuming you store it in source control!):

- The pipeline becomes software; you can then code review changes to it, and iterate on it over time
- There is a full audit trail for changes to the pipeline
- There becomes a single source of truth for the pipeline, which can be viewed and edited by anyone (with permissions)

The team you're working with has given you the location of a Jenkinsfile that they've previously stored in a Git repository. You can find it in [this repository](https://github.com/ajlanghorn/dvja/blob/master/Jenkinsfile). Keep the repository open in a separate tab, as you'll likely need to refer back to it a few times today.

1. Read through the Jenkinsfile - can you understand what it's doing?
1. In Jenkins, click New Item from the left sidebar.
1. Under Item Name, enter `dvja`, and choose Pipeline as the item type. Click OK.
1. Scroll to the bottom, and change the value of Definition from `Pipeline script` to `Pipeline script from SCM`.
1. Choose `Git` from the available SCMs, and enter `https://github.com/ajlanghorn/dvja` as the Repository URL.
1. Leave all other options the same, and click Save.

At this stage, you should now have a job built, and ready to run in Jenkins. From the left, click `Build Now`, and then click the dashed line that appears next to the build entry in the Build History box toward the bottom left of the page. From here, we can see what Jenkins did.

You should find that Jenkins didn't complete the job, because it tried to upload an object - our packaged Java application - to S3 and failed. There are two reasons it failed:

1. Jenkins doesn't have any credentials to access S3

You do some digging, and realise that your team has already attempted to resolve this situation in the past:
1. In the [IAM Console](https://console.aws.amazon.com/iam), click Roles on the left.
1. Search for `JenkinsIAMRole`, and click the role name where this forms part of the full name.
1. Inspect the in-line policy and trust relationship to ensure you understand what they do.

To finish the job off, you need to attach the correct IAM role to the Jenkins instance.
1. Open the [EC2 Console](https://console.aws.amazon.com/ec2), and click Instances on the left.
1. Find your Jenkins master, and right-click it.
1. Point to Instance Settings, and click Attach/Replace IAM Role.
1. Find the role containing the phrase `JenkinsIAMInstanceProfile` in the drop-down list, and click Apply.

Re-run the Jenkins job. You should see it passes successfully, and that each stage completes. At this point, notice that Jenkins is keeping track of the job history for you on a step-by-step basis as the pipeline proceeds - you can see this on the job's home page.