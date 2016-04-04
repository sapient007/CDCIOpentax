# CDCIOpentax

This is a basic project to script a simulated CDCI pipeline at facilities without internet access. This skeleton project watches a git repo with some basic GIT version options. Upon detection of a depo chage, this script updates the local repo and does a CF push. The application configuration (name, route, container size etc etc) are all configured in the manifest.yml file. 

To run this project: 

1) set up local offline GIT repo (https://goo.gl/jJW634)

2) edit GitWatch.sh to point to your local repo

3) chmod +x GitWatch.sh 

4) run GitWatch.sh. e.g ./GitWatch.sh > deployments.log &

5) tail -f deployments.log
