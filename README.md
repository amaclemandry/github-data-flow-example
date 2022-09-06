# Title

<p align="left" style="text-align:left;">
  <a href="https://www.githubuniverse.com/">
    <img alt="Github Universe" src="img/github-universe-2022.png" width="1040"/>
  </a>
</p>

## About this article

GitHub with GitHubActions and GHAS offer an incredible experience for developers around the planet. Just with a few considerations and good ideas we can build a wonderful experience for our development teams, and they just literally "work only on their code"

## Problem 

In the data ecosystem there are two main concerns: the multiples tools and the multiple data sources. These, combined, make necesary to have a centralized point, where you can orchrestate all of these. As for know, [Apache Airflow](https://airflow.apache.org/) has a lot of integrations based on Python.

As with any software solution, Airflow pipelines are defined as DAG (Directed Acyclic Graph) is a "collection of task oganized with dependencies and relationships to say how they should run." but more importantly, is that these flow can't have any cycle between the task

For more information check [here] (https://airflow.apache.org/docs/apache-airflow/stable/concepts/dags.html)

These DAGs are code based on Python, so you can apply any good practices defined in the Software Development practice. 

For this demo we wanted to show that, using very simple tools (both open source and licensed) we can deploy a secure, well written and executable DAG, so when it is deployed, a lot of problems has been tackle.

## Types of tests
For this demo when focus on 3 types of tests:
- Linter
- Syntax test
- Loading tests in Airflow

## Extending this demo
Easily we can add more tests to the suite, that, due the nature of this demo, doesn't have any use. Those tests are (but not limited to):
- Unit tests
- Integration tests

There is a good post on this subject on the [Astronomer site] (https://www.astronomer.io/guides/testing-airflow/)

## How to use this test

### Prepare your dags
In order to have your code and your test you must create the proper folder structure:

```
<root>
|
 -- dags
   |
    -- <dag_file>
 |
  -- tests
    |
     -- <dag_file>
```
<br>

### Configure your action
You must configure the correct folder name for 3 variables:

- DAG folder name
- Tests folder name
- Code cloned full path

It is important to mention that, on the DAG and Tests variable is only the folder name, and not the path

```
    name: Test DAG
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Build Docker Image
        run: docker build . -t airflowTester:latest
      - name: Execute Docker for DAG test
        run: docker run -e TESTS_FOLDER=<tests folder name> -e DAG_FOLDER=<dag folder name> -v <code cloned folder>:/airflow airflowTester:latest
```
<br>

## Next Steps
It is possible to use the same docker file and build a GitHub Action and publish it on the GitHub Marketplace

## Licence

The scripts and documentation in this project are released under the [MIT License](./LICENSE)
## Contributions

Contributions are welcome! See [Contributor's Guide](./docs/contributors.md)

## Code of Conduct

👋 Be nice. See our [code of conduct](./docs/code_of_conduct.md)

## References
