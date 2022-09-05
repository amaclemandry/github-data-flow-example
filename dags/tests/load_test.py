from airflow.models import DagBag

def test_dags_load_with_no_errors():
    dag_bag = DagBag(include_examples=False)
    d    dag_bag.process_file('os.environ[AIRFLOW_HOME]/*.py')
    print(dag_bag.import_errors)
    assert len(dag_bag.import_errors) == 0

# https://opensource.creativecommons.org/blog/entries/apache-airflow-testing-with-pytest/