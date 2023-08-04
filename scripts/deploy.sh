git config --global user.email "luizleno15@gmail.com"
git config --global user.name "luislenosilva15"
git clone --branch=gh-pages git@github.com:luislenosilva15/circleci-multiple-pages.git gh-pages

TARGET_DIR=""

if [ -n "$CIRCLE_TAG" ]; then
    TARGET_DIR=$(echo "${CIRCLE_TAG}" | sed -E 's/storybook\.//g; s/[.][0-9]+//g')
else
    TARGET_DIR=$CIRCLE_BRANCH
fi

mkdir -p gh-pages/pages/$TARGET_DIR
cp -R storybook-static/* gh-pages/pages/$TARGET_DIR/


cd gh-pages/pages

BRANCHES=($(git ls-remote --heads origin | cut -d'/' -f3-))

for ((i=0; i<${#BRANCHES[@]}; i++)); do
    BRANCHES[$i]=${BRANCHES[$i]#*/}
done

for branch in "${BRANCHES[@]}"; do
    if [[ ! "$dir_name" == *"$branch"* ]]; then
    sudo rm -rf "$dir_name"
    fi
done

cd ../
# node list-folders.js
# git add .
# git commit -m "Deploy Storybook to GitHub Pages"
# git push origin gh-pages