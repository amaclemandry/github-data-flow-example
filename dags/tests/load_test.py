from airflow.models import DagBag

def test_dags_load_with_no_errors():
    dag_bag = DagBag(include_examples=False)
    dag_bag.process_file("/airflow/dags/*.py")
    print(dag_bag.import_errors)
    assert len(dag_bag.import_errors) == 0

# https://opensource.creativecommons.org/blog/entries/apache-airflow-testing-with-pytest/