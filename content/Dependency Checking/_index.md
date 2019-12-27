+++
title = "Dependency Checking"
date = 2019-07-08T13:08:10+01:00
weight = 2
chapter = true
pre = "<b>1. </b>"
draft = false
+++

## Dependency Checking

Modern software is rarely entirely self-contained - instead, to run, software often makes dependencies on other software in order to provide useful features. These dependencies are bundled in, and shipped, with the end software product a team makes. For example, a registration form for a new user might place a dependency on a client to access a MySQL database as well as on software to validate form input. In this example, we're actually deploying a combination of three bits of software - not just one. And we likely don't know the dependencies as well.

This is exactly BigCo's problem - to deliver quickly, they're incorporating dependencies from all over the place! How are we going to make sure the dependencies themselves are appropriately secure?

### OWASP Dependency Check

After some research, you stumbled upon [Dependency-Check](https://jeremylong.github.io/DependencyCheck/), which is supported by the [Open Web Application Security Project (OWASP)](https://owasp.org). You are surprised to learn that OWASP is well-respected inside the often-backward security organisation you work in.

Dependency Check is a tool to identify dependencies and to check for known, publicly-disclosed vulnerabilities within them. It compares these vulnerabilities to the data produced in NIST's National Vulnerability Database, where individual entries are given individual entries, identified by a Common Vulnerabilities and Exploits (or CVE) number. Dependency Check reports each found vulnerability against the appropriate CVE.

### Installation

1. Open Jenkins, and click `Manage Jenkins` on the left.

### Configuration

1. Open Jenkins

### Reporting

### Automation

A risk-based approach to taking action on found vulnerabilities is being pushed by your CISO, in an attempt to balance security with the risk of not delivering against the CEO's wishes. You find that the Dependency Check plug-in in Jenkins allows for the use of Risk Gate Thresholds, which can be used to fail a build automatically if a certain number of categories of vulnerability are detected.

-
