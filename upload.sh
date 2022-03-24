#!/bin/zsh
hugo -d --theme=pure --baseUrl="https://13toast.github.io/"
git add .
git commit -m "new publish"
proxychains4 git push origin master

