# Angular Notes  
---  

### Install node, npm and typescript

[node.js](https://node.js) for windows.

### on linux  

	sudo apt install nodejs  

### install typescript  

    npm install typescript

### then check installation  

    node --version
    npm --version


### Install angular cli  

	npm install -g @angular/cli  

## Create initial framework  
	
	ng new my-app  
  # this takes a long fucking time
    

For future app creation 

```
ng new myProject --skip-install=true
cd myProject
npm install
```


Run the app	

	cd my-app
	ng serve --open
	

Generate component  

    ng generate component <NAME>
    # short naming  
    ng g c <NAME>

ERROR !!!  
> More than one module matches. Use skip-import option to skip importing the component into the closest module.

Specify the module using the --module parameter. For example, if the main module is app.module.ts, run this:  


	ng g c new-component --module app
	
Or if you are in an other directory then  

	ng g c component-name --module ../

Generate Service  

	ng generate service <SERVICENAME> (--skipTests=true ) to not generate a spec file
	# short 

Add styling  (in this case using [nebular](https://akveo.github.io/nebular/))   

		
    ng add @nebular/theme

Add Material Theme  

  	ng add @angular/material


For angular Material, you need to add the theme to the `styles.css`  

	@import '@angular/material/prebuilt-themes/deeppurple-amber.css';

Add the magical PWA support!   

    ng add @angular/pwa
     
