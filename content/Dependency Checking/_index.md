+++
title = "Dependency Checking"
date = 2019-07-08T13:08:10+01:00
weight = 3
chapter = true
pre = "<b>2. </b>"
draft = false
+++

## Dependency Checking

Modern software is rarely entirely self-contained - instead, to run, software often makes dependencies on other software in order to provide useful features. These dependencies are bundled in, and shipped, with the end software product a team makes. For example, a registration form for a new user might place a dependency on a client to access a MySQL database as well as on software to validate form input. In this example, we're actually deploying a combination of three bits of software - not just one. And we likely don't know the dependencies as well.

This is exactly BigCo's problem - to deliver quickly, they're incorporating dependencies from all over the place! How are we going to make sure the dependencies themselves are appropriately secure?

### OWASP Dependency Check

After some research, you stumbled upon [Dependency-Check](https://jeremylong.github.io/DependencyCheck/), which is supported by the [Open Web Application Security Project (OWASP)](https://owasp.org). You are surprised to learn that OWASP is well-respected inside the often-backward security organisation you work in.

Dependency Check is a tool to identify dependencies and to check for known, publicly-disclosed vulnerabilities within them. It compares these vulnerabilities to the data produced in NIST's National Vulnerability Database, where individual entries are given individual entries, identified by a Common Vulnerabilities and Exploits (or CVE) number. Dependency Check reports each found vulnerability against the appropriate CVE.

### Installation

Dependency-Check is shipped in two parts: the binary itself, and the Jenkins plugin. We need both to get things to work. First, we'll install the plugin, and then we'll install the binary.

1. Open Jenkins, and click `Manage Jenkins` on the left.
1. Click `Manage Plugins`, then choose the `Available` tab.
1. At the top right, search for `Dependency`, and select the `OWASP Dependency-Check` result.
1. Click `Download Now and Install After Restart`
1. Select the option to restart when no jobs are running.
1. Wait a moment, and refresh the page. Jenkins should start to restart.
1. You should now be logged out; log back in. Your plug-in should now be installed.

If you're stuck on a screen advising that the plug-in is being installed, remove `/updateCenter` from the URL and hit Enter.

1. Open Jenkins, and click `Manage Jenkins` on the left.
1. Click `Global Tool Configuration`, and scroll down to the `Depdendency-Check` section.
1. Click `Add Dependency-Check`, enter `Dependency-Check` as the Name, check Install Automatically, and ensure that the version is set to 5.2.4.
1. Click Save.

Jenkins will manage installation of Dependency-Check's binary for us, in line with these settings, when we first need to make use of it.

### Configuration

1. Find your forked repository, and open `Jenkinsfile` in a text editor.
1. Add the following to Jenkinsfile between the `Build` and `Publish to S3` steps:

```
stage('Check dependencies') {
  steps {
    dependencyCheck additionalArguments: '', odcInstallation: 'Dependency-Check'
  }
}
```

Commit the Jenkinsfile to your repository, push to the repository, and click Build Now in Jenkins. You should notice that the pipeline status matrix on the job home page changes when it detects that a change to the Jenkinsfile has been made. When you first run the job after installing Dependency Check, prepare for a delay as the binary is downloaded, installed and updates are imported in to its local database.

Have a look in the job output - can you see any issues with the dependencies in our software?

### Reporting

On its own, Dependency-Check reports vulnerabilities inside the job output in Jenkins. We can make this functionality more useful by setting up the reporting feature. When Dependency-Check scans a binary, it outputs its findings to `dependency-check-output.xml`. The reporting feature allows us to perform trend analysis between builds, and dive deeper in to issues found.

To enable reporting, edit the Jenkinsfile again, and add the following on a new line in the "Check dependencies" stage:

```
dependencyCheckPublisher pattern: ''
```

Commit and push the file to your repository, and click Build Now in the job.

This time, you should notice that the job runs much faster. When you visit the job home page, after its finished building, you'll notice that a trend graph has appeared.

To dive deeper in to the results, click the latest build number under Build History on the left, and then choose `Dependency-Check` from the left side menu. You'll then be shown:

- the filename of the dependency in question
- the vulnerability's CVE number, and the source of the information about the found CVE
- the vulnerability's CWE number
- the severity of the vulnerability

{{% notice tip %}} CVE is a dictionary that provides definitions of publicly disclosed vulnerabilities and exposures in software packages, published both commercially and on an open basis. {{% /notice %}}

Click the `+` symbol to the left of an entry to view more information about the issue.

### Automation

A risk-based approach to taking action on found vulnerabilities is being pushed by your CISO, in an attempt to balance security with the risk of not delivering against the CEO's wishes. You find that the Dependency Check plug-in in Jenkins allows for the use of Risk Gate Thresholds, which can be used to fail a build automatically if a certain number of categories of vulnerability are detected.

To enable Risk Gate Thresholds, edit the Jenkinsfile. Change the line that reads:

```
dependencyCheckPublisher pattern: ''
```

and replace it with

```
dependencyCheckPublisher failedTotalCritical: 1, failedTotalHigh: 1, failedTotalLow: 10, failedTotalMedium: 5, pattern: '', unstableTotalCritical: 1, unstableTotalHigh: 1, unstableTotalLow: 10, unstableTotalMedium: 5
```

Commit the Jenkinsfile and push it to the repository. Run the job again, and see what happens.

Here, we're telling Jenkins to fail the build or warn that the build is unstable when dependency vulnerability thresholds are met. The figures we've chosen here - as given to us by BigCo's security management - tell Jenkins to:

- fail the build if we receive any vulnerabilities deemed Critical or High
- fail the build if we receive more than five vulnerabilities deemed Medium
- fail the build if we receive more than ten vulnerabilities deemed Low

We're not going to spend time in this workshop resolving issues with this software. Instead, we need to ensure that we can work without these issues causing us problems as we go ahead. To progress, either:

- Significantly increase the values in the Jenkinsfile, re-commit, push and re-run the job
- Revert the change, such that the `Check Dependencies` line now reads `dependencyCheckPublisher pattern: ''`

When you've done this, and your job now passes, you can continue to the next stage!