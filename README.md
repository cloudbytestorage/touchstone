# TOUCHSTONE

- All possible way to test 'ElastiStor OS'
- ElastiStor OS is a FreeBSD OS with REST APIs that understand JAIL & ZFS
- The REST API part of ElastiStor is known as ElastiCenter
- This will consist of sub-projects that have specific responsibilities.

### Need for a Test Automation

- It has been desired to achieve test automation so that a developer can make continuous changes to the code base without impacting any existing feature.
- It has also been felt that test automation should be simple enough for anyone to add/modify the test cases without spending too much of time.
- Anyone implies a QA engineer, Business Analyst, apart from typical developers.
- It will be ideal to run the test automation from one's laptop, thus avoiding the need for separate environments.
- Here emphasis is given to the environment that is running the tests & not about the environment that is to be tested.
- At the same time it is desired to roll out these test cases in a CI server for the entire build process. It will be pain to have separate test automation for build.
- To summarize, it will be good to have test automation that can be easy to develop, easy to run, & easy to set up in different environments.
 
### What kind of Test Automation should we implement ?

Let me quote an email from OpenStack forums: 
"If a method is conceivably testable with unit tests (without over relying on mock), that is preferable. Failing that, functional tests are the way to go. The general idea is to test bottom up: Lots of unit tests, fewer functional tests, fewer API/integration/fullstack tests, ... it is difficult to test the agent with unit tests effectively, which is why I encourage developers to test via functional, mock-less tests, ..."

- We developers have been grown up with the fact that unit test are the beginning & end to testing.
- However, unit tests are definitely not enough. 
- Developers now have a wide variety of tools & mature devops ideas to implement various test strategies.
- A management layer that typically has REST exposure should ideally be tested via REST clients. This should cater to ~70% of code coverage.
- Coming back to unit tests, a test design should be in place that can run unit tests without use of 'mocks'.
- Unit tests without 'mocks' make the test cases more closer to production environment.
- Most of the time, this implies running the test cases against an actual environment & the test framework providing the additional features that can run the test cases & at the same time does not impact the production environment.
- This is the area where the thin line of difference between functional & unit testing becomes blurred.
- I would mark this as evolution from unit testing to functional testing.
- In short, I would risk deviation from bottom up approach & opt for top down approach towards testing.

In my opinion, "there is no end to bottom up testing whereas we can see a clear picture, a clear goal & definitely a time-bound approach to top down testing".

"Lots of functional tests, good amount of API/integration/fullstack tests and fewer but specific unit tests."

- Above statements are based on the simplicity of testing via current age tooling & the ever breaking unit tests due to constant churn in code bases. 
- May I say we need to rewrite the entire unit tests if we change our libraries.

And look I have got a friend (smile) who reciprocates my thought process much earlier than I got into programming as my day job.
Excerpt from James Strachan's Weblog - Friday Aug 29, 2003
Groovy - the birth of a new dynamic language for the Java platform
"...
I'm finding that most time spent in a TDD style development model is actually coding the unit tests. There's typically lots of unit test code for little application code. Also there does seem to be some baggage when writing unit tests in java. This seems a great opportunity for using a concise & powerful dynamically typed language. 
..."

Avid readers will definitely want a proof of this approach and I guess I have one. 
- "During development of OpenStack cinder driver for CloudByte storage, I had to write unit test code whose LOC was more than that of the actual driver code. I guess I got a couple of bugs from this unit test code. However, most of critical/important bugs were found during the automated functional testing process (i.e. during run of OpenStack cinder tempest tests). The CI which runs these Tempest on every commit made to cinder project gets me few bugs occasionally. If I try to analyze the reason, I would say use of sublime text as my IDE, pep8 & flake8 linting tools helped me fix good amount of bugs while I was coding. To summarize, if we are able to use the right tools, we can write unit tests that matter & write exhaustive unit tests to get a 100% code coverage."

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
