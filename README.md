# TOUCHSTONE

- Thoughts on testing practices
- Ideas and implementation or reuse of best fit libraries for automation

### Need for a Test Automation

- It has been a desire to achieve test automation so that a developer can 
  - make continuous changes to the code base without impacting any existing feature.
- However, can this be simple to use ?
  - Easy enough for a non-technical person to add/modify the test routines
  - The resource need not spend hours to do so
  - Resource may imply a QA engineer, Business Analyst, or an admin.
- It will be great to run the test cases from one's laptop, 
  - These would be fine tuned & later be moved to some build setups.
  - Emphasis is given to the environment that is running the tests.
- To summarize, it will be good to have test automation that can be 
  - easy to develop, 
  - easy to run, & 
  - easy to set up in different environments.
 
### What kind of Test Automation should we implement ?

Let me quote an email from OpenStack forums: 
>**"** If a method is conceivably testable with unit tests (without over relying on mock), 
>that is preferable. Failing that, functional tests are the way to go. 
>The general idea is to test bottom up: 
>+    Lots of unit tests,
>+    fewer functional tests,
>+    fewer API/integration/fullstack tests,
>
>It is difficult to test the agent with unit tests effectively, 
>which is why I encourage developers to test via functional, mock-less tests. **"**

This is another quote from James Strachan's Weblog - Friday Aug 29, 2003

>**"**
>I'm finding that most time spent in a TDD style development model is 
>+ coding the unit tests. 
>
>There's typically lots of unit test code for little application code. 
>Also there does seem to be some baggage when writing unit tests in java. 
>This seems a great opportunity for using a concise & powerful dynamically typed language. 
>**"**

#### Lets think about the issues faced to implement above strategies:
+ Brittle unit tests
+ No end on writing unit tests

#### Solutions the mitigate these issues:
+ Wide variety of tools make writing unit testing a breeze.
  + e.g. property based testing via [scalacheck](http://www.scalacheck.org/)
  + e.g. data driven testing via [spock](http://spockframework.github.io/spock/docs/)
+ Writing code using functional ways
  + e.g. one may write java or python code thinking of functional constructs
  + e.g. java 5 itself has java.lang.function.* interfaces
  + this reduces the lines of code
  + this in turn reduces the effort spent on unit test code
  + remember less code implies less bugs
  + leads to unit tests without 'mocks' 
  + leads to running tests locally that are more closer to production environment.
+ Use of IDEs
+ Use of static tools for linting the code
  + these will help us find out a lot of bugs during code itself
+ Use of functional languages
  + these requires a significant leap of faith
  + if we do manage this the benefits are plenty
  + we end up writing clear, concise, better intent, readable & testable code
  + this approach defintely tackles bugs & issues in a practive manner

### Evolution of Test Automation:

- It will be great if the test automation can eventually be used to inject faults & check if the system is resilient.
- The fault injection test cases can be based out of the source code design as well as based on faults in the overall environment.
- It is assumed that dedicated engineering thought process needs to go behind designing & building fault injection test cases.
 
### Functional & Integration Test Automation

- Since a typical management layer is exposed via the REST layer, we can get code coverage of ~70% by utilizing the REST layer.
- Given the 80:20 rule, and above justification, we should be spending most of our efforts into functional testing.
- Hence, we need to think about various teams making a contribution towards this automated functional testing.
- If the REST uses JSON, we might get tempted towards use of JavaScript libraries.
- However, every programming language has made use of JSON a breeze.
- We should be looking into libraries or languages that are less verbose & are more DSL (Domain Specific Language) friendly.
- Not only the Developer but also the Business Analyst, Quality Analyst, Infra Engineer, Support Engineer etc. should be able to create a automated functional test case with ease.

 
### Fault Injection Testing & Unit Testing the ElastiCenter

- While testing the storage via REST layer seems to solve 70% of use cases, we need to think of an alternative design that can test the rest 30%
- Spock is assumed to meet the fault injection requirements w.r.t ElastiCenter that is Java based.
- Below are some of things that we need to try using Spock in order to inject faults:
- Change the behavior at runtime
- Run the Spock specs programmatically against any running EC environment.
- Ability to run specific Spock specs
- Ability to build jars that contains the Spock specs. These jars will be deployed in a running EC & test cases would be invoked from a CLI.
- One is not limited to use Spock. One may think of using various Mock libraries to meet one's goal.

### Touchston's Sub-Projects
- touchstone
	- DSL wrapper over CLI
- resto
	- DSL wrapper over REST API
- automaton
    - TAP based automation that takes into account above
- 3rd party libraries
    - https://github.com/openzfs/openzfs/tree/master/usr/src/test
    - openstack temptest suite
    - vmware certification

### References

- https://github.com/vlucas/frisby
- https://github.com/jeffbski/bench-rest
- https://dzone.com/articles/you-cant-test-all-the-things-api-iot-roi-tbd?utm_content=bufferbf217&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer
- https://wiki.freebsd.org/SummerOfCodeIdeas#TEST-o-steron_for_FreeBSD_.28node.js.2FLua.29
- http://www.lingua-systems.com/unit-testing/
- https://github.com/spockframework/spock
- https://github.com/openzfs/openzfs/tree/master/usr/src/test
- http://www.slideshare.net/araujobsd/functional-and-scale-performance-tests-using-zopkio
- https://github.com/linkedin/Zopkio
- https://github.com/zfsonlinux/zfs-auto-snapshot/blob/master/src/zfs-auto-snapshot.sh

##### Shell Scripting Using Groovy

- #!/usr/bin/env groovy
- Say bye to cumbersome bash scripts (smile)
- https://github.com/aestasit/sshoogr

##### Modular & file/folder Structure & Coding Standards for Shell Scripts

- https://github.com/technopagan/adept-jpg-compressor/blob/master/unittests/tests_adept.bats
- https://github.com/aaronroyer/shy/blob/master/test/shy.bats
- https://github.com/technopagan/adept-jpg-compressor/blob/master/adept.sh
- http://www.doublecloud.org/2015/05/vmware-esxi-esxcli-command-a-quick-tutorial/

##### Management Tool for Shell

- https://github.com/aaronroyer/shy 
- https://blog.engineyard.com/2014/bats-test-command-line-tools
- https://github.com/sstephenson/bats
- http://stackoverflow.com/questions/687948/timeout-a-command-in-bash-without-unnecessary-delay
