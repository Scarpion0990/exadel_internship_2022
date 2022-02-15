git clone git@github.com:Scarpion0990/Exadel_internship_feb_2022.git 

git add ./Task1/README.md 

git commit -m "first commit" 

git push origin -u main 

git checkout -b dev 

git add ./Task1/test.txt 

git commit -m "added test file" 

git push origin -u dev 

git checkout -b iskandar-new_feature

git status

git add ./Task1/.gitignore

git commit -m "added gitignore" 

git push origin -u iskandar-new_feature 

git checkout iskandar-new_feature 

git commit -am "changed readme" 

git revert HEAD 

git log 

git commit -am "reverted" 

git push 

git branch -d iskandar-new_feature 

git push origin -d iskandar-new_feature 
