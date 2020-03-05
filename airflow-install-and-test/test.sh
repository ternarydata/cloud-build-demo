set -e

pip install apache-airflow
python dag.py
echo "Success!"
