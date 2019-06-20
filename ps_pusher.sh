# SWITCH TO TARGET
BASE_DIR="$1"
ORIGIN="$2"
YEAR=`cut -d '-' -f1 <<< $ORIGIN`
cd "$BASE_DIR"

git init
git config user.name "<username>"
git config user.email "<email-id>"
git remote add origin "https://<ORIGIN_BASE>/"$ORIGIN".git"
git add info.* 
git add *.zip
git add transcript.*
git commit -m 'Initial Commit'
git push -u origin master        

for D in */ ; do
    D=`cut -d '/' -f1 <<< "$D"`
    echo ">>>>>>>>>$D"
    cd "$D"
    for F in *; do
        echo "$F"
        git add "$F"
        git commit -m 'Initial Commit' && git push -u origin master        
    done
    cd ..
done

cd ..
mv "$BASE_DIR" "[$YEAR] $BASE_DIR"
