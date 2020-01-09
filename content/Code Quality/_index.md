+++
title = "Code Quality"
date = 2019-07-08T13:08:10+01:00
weight = 5
chapter = true
pre = "<b>4. </b>"
draft = false
+++

The messier code is, the less maintainable it is. When dealing with a problem, or trying to understand a complicated feature, there are few things more annoying than overly-complicated code. After all, as Einstein said, "if you can't explain it simply, you don't understand it well enough".

Keeping code clean and simple is exactly what BigCo are looking to do - their developers are tired of spending hours trying to understand code which may well have been written many years ago by people who have long since left the company. When they do manage to understand the code, they spend time fixing the issues they need to, or extending the functionality. If they have time - which is rare - they might refactor the code to make the process of understanding it easier for the next person who happens to take a look at it.

BigCo's quality checking tool of choice is [`CheckStyle`](https://checkstyle.org), which checks for a [large number of standards](https://checkstyle.org/checks.html) influenced by the Sun Code Conventions and Google Java Style Guide.

## Installation

It's possible to run CheckStyle in multiple ways. We're going to use it through a plugin.

1. Open Jenkins, and click `Manage Jenkins` on the left.
1. Click `Manage Plugins`, then choose the `Available` tab.
1. At the top right, search for `Warnings Next`, and select the `Warnings Next Generation Plugin` result.
1. Click `Download Now and Install After Restart`
1. Select the option to restart when no jobs are running.
1. Wait a moment, and refresh the page. Jenkins should start to restart.
1. You should now be logged out; log back in. Your plug-in should now be installed.

Open the Jenkinsfile, and create an extra stage:

```
stage('Analysis') {
      steps {
        sh "mvn --batch-mode -V -U -e checkstyle:checkstyle pmd:pmd pmd:cpd spotbugs:spotbugs"
      }
    }
```

Also create an extra section *after* the final stage:

```
post {
    always {
      recordIssues enabledForFailure: true, tools: [mavenConsole(), java(), javaDoc()]
      recordIssues enabledForFailure: true, tool: checkStyle()
      recordIssues enabledForFailure: true, tool: spotBugs()
      recordIssues enabledForFailure: true, tool: cpd(pattern: '**/target/cpd.xml')
      recordIssues enabledForFailure: true, tool: pmdParser(pattern: '**/target/pmd.xml')
    }
  }
```

### Check the output

The configuration as defined is set in two places:
1. pom.xml
1. Jenkinsfile

#### pom.xml
Configures when the plugin should run as part of the maven build process. Currently this is set ot the 'validate' phase which occurs before the 'compile' phase. This means that the build will fail to complete due to 677 validation errors.
https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

To make the build pass edit pom.xml and change the phase to 'verify' as below:

```
<execution>
<id>verify</id>
<phase>verify</phase>
<goals>
    <goal>check</goal>
</goals>
</execution>
```

#### Jenkinsfile
Creates an 'Analysis' stage after the 'Check dependencies' phase. This performs checkstyle, spotbugs and two other checks. This occurs post-compilation and pre-publishing.

Also creates as post-build reporting phase.
