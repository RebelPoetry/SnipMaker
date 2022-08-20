
AppDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
SaveDir="/Users/Kazakh/Desktop/testBible"
TakeDir="/Users/Kazakh/Desktop/testBible"

PushToGit=false
GitLink=""

cd $AppDir

rm README.md
swift run SnipMaker -s $AppDir -t $TakeDir -p $PushToGit

