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


