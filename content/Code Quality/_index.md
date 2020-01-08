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

It's possible to run CheckStyle in multiple ways. We're going to use it via its in-built command-line interface, inside a Jenkins job.

Open the Jenkinsfile, and insert a new stage before the Build stage:

```
stage('Style check') {
    steps {
        sh "wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.28/checkstyle-8.28-all.jar"
        sh "wget https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml"
        sh "wget https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml"
        sh "chown jenkins:jenkins checkstyle*.jar *_checks.xml"
        sh "java -jar checkstyle-8.28-all.jar -c /sun_checks.xml src/*.java"
        sh "java -jar java -jar checkstyle-8.28-all.jar -c /google_checks.xml src/*.java"
    }
}
```