
AppDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
SaveDir="/Users/Kazakh/Desktop/testBible"
TakeDir="/Users/Kazakh/Desktop/testBible"

PushToGit=false
GitLink=""

cd $AppDir

swift run SnipMaker -s $SaveDir -t $TakeDir -p $PushToGit

