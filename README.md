# Google Cloud Build Demo
Code for a Google Cloud Build demo run at the SLC Python meetup.
To experiment with these builds, create a GCP project and modify the `cloudbuild.yaml` files to point to your project.
For example, in
```
steps:
- name: 'gcr.io/cloud-builders/docker'
  entrypoint: 'docker'
  args: [ 'build', '-t', 'gcr.io/slc-python-demo/airflow', '.' ]
images: ['gcr.io/slc-python-demo/airflow']
```
change `slc-python-demo` to your project id.

The easiest place to run these builds is in the Google Cloud Shell. There are four builds:
`airflow-install-and-test`,  `build-airflow-container`,  `test-from-airflow-container` and `pull-and-write-data`.
Change to the appropriate directory and run
```
gcloud builds submit
```
The file `dag.py` in two of the builds is taken from a standard tutorial in the [Apache Airflow Project](https://github.com/apache/airflow/blob/master/airflow/example_dags/tutorial.py).
## `airflow-install-and-test`

Pulls a Python 3.7 container from Docker Hub, installs Apache Airflow and runs a basic test.

## `build-airflow-container`

Builds an Airflow container by pulling a Python 3.7 container and `pip` installing Airflow. Pushes the resulting container
to the GCP project container registry.

## `test-from-airflow-container`

Pulls the Airflow container built in `build-airflow-container` and runs a simple test.

## `pull-and-write-data`

Not a true build - downloads AWS IP ranges, stores the data to a file, and pushes the file to a Cloud Storage bucket.
You should create a target bucket in your project and update `pull-data.sh`.
