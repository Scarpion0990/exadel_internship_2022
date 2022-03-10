My Exadel Task 6 project (Jenkins. Automate, Manage and Control)
======================================================

Important points:
------------------
1. Read about Jenkins. What is Jenkins and what is it used for? Ways of using. What is a declarative and imperative approach?

Tasks
---------------

1. Install Jenkins. It must be installed in a docker container.
2. Install necessary plugins (if you need).
3. Configure several (2-3) build agents. Agents must be run in docker.
4. Create a Freestyle project. Which will show the current date as a result of execution.
5. Create Pipeline which will execute `docker ps -a` in *docker agent*, running on *Jenkins master’s Host*.
6. Create Pipeline, which will build artifact using Dockerfile directly from your github repo (use Dockerfile from previous task).
7. Pass  variable PASSWORD=QWERTY! To the docker container. Variable must be encrypted!!!

EXTRA:
---------------

1. Create a pipeline, which will run a docker container from Dockerfile at the additional VM.
2. Create an **ansible playbook**, which will deploy Jenkins.
3. Deploy a local **docker registry**, upload a docker **image** there, download **img** from your local **docker registry** and run the **container**.
4. Configure integration between Jenkins and your Git repo. Jenkins project must be started automatically if you push or merge to master, you also must see Jenkins last build status(success/unsuccess) in your Git repo.
