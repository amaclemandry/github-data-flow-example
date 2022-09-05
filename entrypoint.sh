#!/bin/sh
export AIRFLOW_HOME="/airflow/$DAG_FOLDER"

a=0;
for file in $(ls $AIRFLOW_HOME/*.py); do 
    echo "******** Execute lint on $file"
    flake8  --ignore E501 $AIRFLOW_HOME/$DAG_FOLDER/$file --benchmark -v  
    echo "******** End of lint on $file"

    echo "******** Execute python on $file"
    python $AIRFLOW_HOME/$DAG_FOLDER/$file ; 
    if [[ $? == 1 ]] ; then
        a=1;
    fi
    echo "******** End python on $file"
    
    echo "******** Execute  black on $file"
    pytest $AIRFLOW_HOME/$DAG_FOLDER/$file --black -v  
    echo "******** End of lint on $file"
done

echo "******** Execute test on all dags in folder"
pytest $AIRFLOW_HOME/$TESTS_FOLDER/* 
if [[ $? == 1 ]] ; then
    a=1;
fi

if [[ $a == 1 ]] ; then
    echo "There are tests that failed"
fi

return $a