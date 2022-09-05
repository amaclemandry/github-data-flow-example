#!/bin/sh
export AIRFLOW_HOME="/github/workspace/$1"
airflow db init
a=0;
for file in $(ls *.py); do 
    echo "******** Execute lint on $file"
    flake8  --ignore E501 $AIRFLOW_HOME/$1/$file --benchmark -v  
    echo "******** End of lint on $file"

    echo "******** Execute python on $file"
    python $AIRFLOW_HOME/$1/$file ; 
    if [[ $? == 1 ]] ; then
        a=1;
    fi
    echo "******** End python on $file"
    
    echo "******** Execute  black on $file"
    pytest $AIRFLOW_HOME/$1/$file --black -v  
    echo "******** End of lint on $file"
done

echo "******** Execute test on all dags in folder"
pytest $AIRFLOW_HOME/$2/* 
if [[ $? == 1 ]] ; then
    a=1;
fi

if [[ $a == 1 ]] ; then
    echo "There are tests that failed"
fi

return $a