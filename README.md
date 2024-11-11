# k6-junit-integration
JUnit 5 test classes for making performance tests with Grafana k6 and integrations with Allure TestOps, Grafana, InfluxDB

# Target

The __simplest__ performance test report is a main target.

Teams have performance test results in Allure TestOps and have detailed test reports.
Teams can manage performance tests, performance test results and performance test issues as typical integration tests. 

An engineer creates a performance test a few times for each endpoint or component,
but a lof of engineers will read and analyse performance test reports many times.

The __simplest__ and clearest performance test report for __simple__ performance tests is a main target of the project.

# Performance test report

The test report doesn't provide deep insides about performance issues and why the test has a performance problem, 
but the report provides information about test attributes:
- Service
- Version
- Endpoint
- Payload
- Data Set
- Environment
- ...

The test report helps to identify the attribute of the performance degradation:
- a specific __Data Set__: like an account with `10 000` users
- a specific __Payload__: Query String parameter like `?fields=items`

## Report example

| Service            | API          | Payload            | Version `1.2.3` / Status | Version `1.2.4` / Status |
|:-------------------|:-------------|:-------------------|-----------------------:|-------------------------:|
| API                | GET /project | fields=id          |                    ✅15 |                      ✅15 |
| API                | GET /project | fields=name        |                    ✅15 |                      ✅15 |
| API                | GET /project | fields=__items__   |                    ✅15 |                    ✅7 ❌8 |
| API                | GET /project | fields=permissions |                    ✅15 |                      ✅15 |

# Architecture

Typical JUnit 5 test includes:

- `@Nested`
- `@BeforeAll`
- `@Test` or `@ParameterizedTest` or `@RepeatedTest`
- `@AfterAll`

for performance testing projects we use

- `@Nested` for grouping
- `@BeforeAll` for getting performance metrics
- `@Test`, `@ParameterizedTest`, `@RepeatedTest` for checking performance metrics
- `@AfterAll` for removing temporary files

# Organize test results

The main links are: 
- https://allurereport.org/docs/junit5/#organize-tests
- https://allurereport.org/docs/gettingstarted-navigation/

Performance tests use labels:

- Protocol: HTTP API, gRPC API
- Component: Server Monolith, Microservice
- Service name: API, Board, Auth MS, ...
- Version
- Subsystem
- Endpoint
- Scenario name
- DataSet
- Workload (RPS)
- Target environment: Docker, Production EU, Production AU, Production US, Staging EU, QA Monolith, ...
- Client environment: Docker, EU, AU, US
- Owner
- Owner slack channel

Labels help to organize test results in Allure TestOps

# History

The test results are the main target of this project.

Engineers use Allure TestOps for working with the test results. 
It means that performance tests should have an integration with Allure TestOps.

JUnit 5, JUnit 4, TestNG amd other frameworks have the integration mechanism with Allure TestOps.
It means that performance tests can use JUnit/TestNG or other frameworks for labeling test results.

JUnit 5 is a modern test framework with a good documentation. 
It means that we can use JUnit 5 as a main test framework.

JUnit framework provides options for doing some actions before checks and checks. 
We can collect performance metrics in a section `@BeforeAll`. 
And can check performance metrics in a section `@Test`.

# Framework API

- Performance test API
  - k6.io API
    - Start with a target workload
- Test result API
  - Save test results into a S3 Storage and get links
    - k6.io: CSV file, summary.json
    - traces
  - Extract metrics from test results
    - k6.io test results: CSV and summary.json
- Test environment API
  - Get version
    - Monolith
    - Microservice
- Test report API
  - Add a context about performance problems
    - Grafana links
    - Log links
    - Trace links
    - S3 links

