SLEEP_TIME=30
PROJDIR="/Users/mling/project" #change project folder

cd $PROJDIR

while [ "1" ]
do

#lets find some version numbers to see if update is needed
git remote update
DATE_FMT=`date +%Y-%m-%d:%H:%M:%S`
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
  #there nothing to do since everything is up to date
  echo "nothing to update @" $DATE_FMT
  
elif [ $LOCAL = $BASE ]; then
  # Things have changed. we want to get the latest version and then do a CF Push
  
  # get the latst version
  echo "Pull in the latest code @"  $DATE_FMT
  git pull

  #do a CF PUSH based of the local manifest.yml file
  cf push
  echo "application deployed to CF @" $DATE_FMT

elif [ $REMOTE = $BASE ]; then
  echo "local repo ahead of master. doing GIT Push"
  #things have changed locally, update the master repo
  git push
  
  #lets do a cf push
  cf push 
  
else
  echo "how did you get here? need to look at logs"
  #lets print some repo info
  echo $LOCAL "<--local branch"
  echo $REMOTE "<--remote branch"
  echo $BASE "<--base branch"
  
fi
echo "............."
echo "hard work, taking a $SLEEP_TIME s nap"
echo "............."
sleep $SLEEP_TIME
done
