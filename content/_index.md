# Building Security In

## Introduction

For at least the past decade, the idea of continuous integration has permeated throughout software circles to become the predominant way in which software is built, tested and - through its sister approach, continuous deployment - released in to the wide world.

In this workshop, we'll look at using common tools to start a CI/CD pipeline, and then focus on the security of the pipeline as well as the security of the code running inside it. The aim, ultimately, is to produce as secure code as possible, whilst catching low-hanging fruit in an automated fashion.

To do this, we'll be building a CI pipeline, which is being used to deploy known-vulnerable software - in our case, the [Damn Vulnerable Java (EE) App](https://github.com/appsecco/dvja), or DVJA for short. We're using known-vulnerable software in order to test the effectiveness of a variety of security testing tools inside our pipeline.

## Scenario

In today's session, you'll assume the role of the intrepid security engineer, embedded deep within a crack team of software engineers, at BigCo, Inc. The team has been told, explictly, by the BigCo CEO to "get features delivered - fast - and focus on nothing else". You've been embedded in the team by the CISO, who is hoping you can ensure that features can be delivered quickly without compromising on security.

BigCo's typical security approach has placed a lot of effort on manual, infrequent review of the source code, along with annual penetration tests. Ultimately, this approach is slow and only allows the security posture of the infrastructure being built to be assessed as a point-in-time snapshot.

Your job is to ensure your team can deliver quickly, without compromising on product security.

## Let's get going!

We're ready to get going! To begin, choose the [Prerequisites](/prerequisites) section from the left.
