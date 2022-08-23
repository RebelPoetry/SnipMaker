
AppDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

TakeDir="/Users/Kazakh/Desktop/testBible"

PushToGit=true
GitLink=""

cd $AppDir

rm README.md
swift run SnipMaker -s $AppDir -t $TakeDir -p $PushToGit

git add README.md
git commit -m "Add Snippets"
git push -u origin main
