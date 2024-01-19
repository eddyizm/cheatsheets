# git 

### Create new repo

	git init

### create a new repository on the command line

    echo "# pocm" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/eddyizm/pocm.git
    git push -u origin master
	
###  Adding repo already in progress  

	git pull origin master --allow-unrelated-histories
	
### create local branch then create and push it's origin branch on the server
    git checkout -b gcPython
    git push -u origin gcPython

### Add remote from original repository in your forked repository:

    # list current remotes  
    git remote -v
    
    git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git
    # sample
    # git remote add upstream https://github.com/timgrossmann/InstaPy.git
    git fetch upstream
    
### set new remote branch  
    git branch -u upstream/foo

    
### Updating your fork from original repo to keep up with their changes:

      git pull upstream master
    
### reset fork to upstream main

    git fetch upstream
    git checkout main
    git reset --hard upstream/main 

### issues when creating local git and then merging with a repo online. this command saved my life

	git push -u origin master --allow-unrelated-histories
	
### merge working/feature branch to master
    git checkout master
    git merge featureBranch
    
### push empty commit!  

    git commit --allow-empty -m "Trigger Build"

### check history

    git log
    
### check changes before adding

	git diff file.txt

### check changes after adding

	git diff --cached file.txt
    
### clone existing repo

    git clone <yourrepoURL>

    cd <yourrepoURL>
    
    git add <new director/>
    
    git commit -a -m <"Your Message">
    
### push changes up
    git push <REMOTENAME> <BRANCHNAME> 
    
###  pull down remote changes

    git fetch 

#### old version
    
    git fetch origin
    
#### check log for changes before pulling in changes.

	git log origin/master
	
#### merge changes after fetching

      git pull

### view branches available to checkout locally
    
    git branch -v -a
  
	
### grab all remote branches to local

	git fetch --all
    
### create your own copy of a branch then check out remote branch

    git checkout -b test origin/test

### might be a better way to track remote branch

	git checkout --track origin/daves_branch
    
### delete remote branch (-D = FORCE)

    git branch -D branch_name

    # this seems to work better  
    
    git push origin :branch-to-delete    

### delete remote branch (-d = local only)

    git branch -d <branch_name>

### remove large files from repo 

	git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch bigfile.txt' --prune-empty --tag-name-filter cat -- --all
	
	git filter-branch --tree-filter 'rm -f DVD-rip' HEAD
	
#### commit changes  

     git commit -a -m "added changes to wsgi and url for static file deployment"
 
#### change or set user name / email  

	git config user.email "you@example.com"
	git config user.name "Your Name"
	git config user.password "your password"
	
To switch globally, use the global switch `--global`

## moving repo from bitbucket to github 

1. create repo on github (from web interface)

2. move the repository, going through a bare repository in a local folder:
```
git clone --mirror https://bitbucket.org/aiida_team/aiida_core.git
cd aiida_core.git
git remote set-url --push origin git@github.com:giovannipizzi/aiida_core_test.git
git push --mirror
``` 

3. move issues: This must be done only once, starting from a new repository without issues or pull requests, to keep the numbering. If something goes wrong, then delete the repository and start again from the very beginning.
 
### Steps to remove directory from repo  

```
git rm -r --cached FolderName
git commit -m "Removed folder from repository"
git push origin master  
```

### Stashing a commit to clean then list the stash available

    git stash   
    
    # display stashes
    git stash list
    
    # apply latest stash after pulling in
    git stash apply
    
    # or pop the top one
    git stash pop
    
    # The apply option only tries to apply the stashed work — you continue to have 
    # it on your stack. To remove it, you can run git stash drop with the name 
    # of the stash to remove:
    
    git stash list
    stash@{0}: WIP on master: 049d078 added the index file
    stash@{1}: WIP on master: c264051 Revert "added file_size"
    stash@{2}: WIP on master: 21d80a5 added number to log
    git stash drop stash@{0}
    Dropped stash@{0} (364e91f3f268f0900bc3ee613f9f733e82aaed43)
    
  

#### To unstage one file :  
  git checkout <path-to-file>
  
#### To unstage all files:  
  git checkout -- .
  
#### amend (or change/update last commit) 
    git commit --amend -m "Your new commit message"

### Revert last merge (very fucking useful)  

	git reset --merge ORIG_HEAD

### Revert to particular hash  
	git reset --soft <HASH>
	
### Reverting last commit  

    git reset <file>
    git reset --soft HEAD~1
    git reset HEAD path/to/unwanted_file(s)
    git commit -c ORIG_HEAD  # or just a regular commit
	
### Generate GPG Key 

	gpg --full-generate-key
	
> sec rsa4096/[short-key] 2021-06-14 [SC]

export it  

	gpg --armor --export [short-key]
	
Copy the key including the BEGIN/END text.

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
[huge-ascii-key]
-----END PGP PUBLIC KEY BLOCK-----
```

Configure Git to sign all commits by default 

```
git config --global user.signingkey [short-key]
git config --global commit.gpgsign true

```
### Configure global push. (As of git 2.37.0 git push will create remote branch)
	
	git config --global --add --bool push.autoSetupRemote true
	
	
### This repository moved

	remote: This repository moved. Please use the new location [new location]
	git remote -v 
	git remote set-url origin https://github.com/eddyizm/insta_delete.git
