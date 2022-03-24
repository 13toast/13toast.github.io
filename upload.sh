#!/bin/bash
hugo --theme=pure --baseUrl="https://13toast.github.io/"
git add .
git commit -m "new publish"
p4 git push origin master

