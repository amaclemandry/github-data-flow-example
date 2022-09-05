#!/bin/sh
export AIRFLOW_HOME="/airflow"

a=0;
# for file in $(ls $AIRFLOW_HOME/$DAG_FOLDER/*.py); do 
#     echo "******** Execute lint on $file"
#     flake8  --ignore E501 $file --benchmark -v  
#     echo "******** End of lint on $file"

#     echo "******** Execute python on $file"
#     python $file ; 
#     if [[ $? == 1 ]] ; then
#         a=1;
#     fi
#     echo "******** End python on $file"
    
#     echo "******** Execute  black on $file"
#     pytest $file --black -v --disable-warnings
#     echo "******** End of lint on $file"
# done

echo "===================================================="
ls -la /airflow/
echo "===================================================="
ls -la /airflow/dags
echo "===================================================="
ls -la /airflow/dags/tests
echo "===================================================="
echo "$AIRFLOW_HOME/$DAG_FOLDER/$TESTS_FOLDER"
echo "===================================================="
ls -la $AIRFLOW_HOME/$DAG_FOLDER/$TESTS_FOLDER/*
echo "===================================================="

echo "******** Execute test on all dags in folder"
pytest $AIRFLOW_HOME/$DAG_FOLDER/$TESTS_FOLDER/*.py --disable-warnings
if [[ $? == 1 ]] ; then
    a=1;
fi

if [[ $a == 1 ]] ; then
    echo "There are tests that failed"
fi


return $a