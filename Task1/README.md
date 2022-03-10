My Exadel Task 1 project
=======================

Mandatory tasks
===============

1) I have already github account, so I neddn't any one to create

2) Created new repository with name ```Exadel_internship_feb_2022```

3) Created Task1 folder with ```mkdir Task1``` in main branch and created and pushed ./Task1/README.md  file with ```nano README.md``` and ```git push -u origin main```

4) Created new branch with ```git checkout -b dev``` or ```git branch dev```

5) Created new brach with ```git checkout -b iskandar-new_feature```

6) Added README.md file to iskandar-new_feature branch with ```nano README.me```

7) Checked status with ```git status```

8) Added  .gitignore with ```nano .gitignore``` and commands ```.* !.gitignore``` in it

9) Commited with ```git commit -m "added gitignore"``` and pushed ```git push -u origin iskandar-new_feature```

10) Created pull request with GUI githab in sections Pull requests to dev branch

11) Merged with branch dev and created pull request with GUI githab in sections Pull requests to main branch

12) Checked out with ```git checkout iskandar-new_feature``` and ```git commit -am "changes"``` and reverted with ```git revert HEAD```

13) Checked with ```git log``` and copied output ```git log > log.txt```

14) Deleted local branch with ```git branch -d iskandar-new_feature``` and remotly ```git push --delete iskandar-new_feature```

15) Copied all commands into ```git_commands.md``` file in dev branch

19) Sended link of my repo to my mentor

Extra tasks
===========

1) I have read about Github Actions from [here](https://docs.github.com/en/actions). What environment variables can be created? I have read about environment variables [here](https://docs.github.com/en/actions/learn-github-actions/environment-variables) There are own custom environment variables, default environment variables and any other environment variables

2) I created directory .github/workflows/ and created file github-actions-demo.yml and started write workflow
 2.1. For DEPLOY_VER I used commit hash $(git rev-parse --short HEAD)
 2.2. I used custom environment variable env for YEAR
 First job:
   I printed with command tree . all dirs and files 
   I printed log.txt file also
   I printed Hello from “your DEPLOY_VER variable’s content” commit
 Second job contains MONTH, DAY__OF_THE_MONTH, YEAR

 For FAVORITE_DAY_OF_WEEK I created secret in repositpry settings with this name and used ${{ secrets.FAVORITE_DAY_OF_WEEK}}
  
  
