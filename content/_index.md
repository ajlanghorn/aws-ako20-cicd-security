# Building Security In

## Introduction

For at least the past decade, the idea of continuous integration has permeated throughout software circles to become the predominant way in which software is built, tested and - through its sister approach, continuous deployment - released in to the wide world.

In this workshop, we'll look at using common tools to start a CI/CD pipeline, and then focus on the security of the pipeline as well as the security of the code running inside it. The aim, ultimately, is to produce as secure code as possible, whilst catching low-hanging fruit in an automated fashion.

To do this, we'll be building a CI pipeline, which is being used to deploy known-vulnerable software - in our case, the [Damn Vulnerable Java (EE) App](https://github.com/appsecco/dvja), or DVJA for short. We're using known-vulnerable software in order to test the effectiveness of a variety of security testing tools inside our pipeline.
