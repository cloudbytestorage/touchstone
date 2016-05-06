# TOUCHSTONE

- Thoughts on testing practices
- Ideas and implementation or reuse of best fit libraries for automation

### Need for a Test Automation
- It has been a desire to achieve test automation so that a developer can 
  - make as well as verify her continuous changes to the code base
  - without worrying about any regressions
- We have unit tests to satify just that. Don't we ?
  - What about the areas that unit tests can not cover ?
- So we need some form of automation:
  - that can remove the repetitive (read manual) tasks
  - fasten the overall delivery process
 
### What kind of Test Automation should we implement ?
#### We shall start with unit tests
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

#### For a moment, lets think about the issues implementing unit tests:
+ Brittle unit tests
+ No end to writing unit tests

#### Below items poses very generic queries on other forms of testing
- Here too, we have lots of tools/libraries to choose from.
- However, we should filter them through below checklists:
    - Are they simple enough to use ?
    - Easy enough for a non-technical person to add/modify the test routines
    - Resource need not spend hours to do so
    - Resource may imply a QA engineer, Business Analyst, or an Admin.
    - Can they be run or atleast triggered from one's laptop ?
    - The tools & corresponding test cases would be fine tuned 
      - & later be moved to some build setups.
- To summarize, it will be good to have test tool(s) that can be 
  - easy to plugin to existing tools
  - quick to develop, 
  - easy to run,
  - exposed in form of some DSLs/builders
  - easy to set up in different environments.
  - i.e. a unified testing layer that can accomodate all the above

#### Solutions to mitigate issues that we talked about:
+ Wide variety of tools make writing unit testing a breeze.
  + e.g. property based testing via [scalacheck](http://www.scalacheck.org/)
  + e.g. data driven testing via [spock](http://spockframework.github.io/spock/docs/)
+ Writing code using functional ways
  + e.g. one may write java or python code thinking of functional constructs
  + e.g. java has java.util.function package
  + this reduces the lines of code
  + this in turn reduces the effort spent on writing unit test code
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
  + source code as well as unit test code is not longer brittle
  + this approach defintely tackles bugs & issues in a proactive manner
+ With these in mind we shall venture out:
  + to design & build or reuse some library that creates the Unified Automation Platform
  

### What other innovations matter w.r.t automation ?
+ tool to inject faults & verify the resiliency of the system.
  + dedicated thought process needs to go into crafting the fault injection methods.

### Related Links

- [Rest API Testing](https://github.com/vlucas/frisby)
- [Rest API Bench Testing](https://github.com/jeffbski/bench-rest)
- [You cannot test all the things](https://dzone.com/articles/you-cant-test-all-the-things-api-iot-roi-tbd?utm_content=bufferbf217&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
- [Unit Testing](http://www.lingua-systems.com/unit-testing/)
- [Spock](https://github.com/spockframework/spock)
