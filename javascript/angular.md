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

### Create initial framework  
	
	ng new my-app  
  	# this takes a long fucking time

For future app creation 

```
ng new myProject --skip-install=true
cd myProject
npm install
```
    
### Serve demo via ngrok 

`ng serve --disable-host-check`

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
     
    
## Pipes / Formatting

```
{{ dateObj | date }}               // output is 'Jun 15, 2015'
{{ dateObj | date:'medium' }}      // output is 'Jun 15, 2015, 9:43:11 PM'
{{ dateObj | date:'shortTime' }}   // output is '9:43 PM'
{{ dateObj | date:'mm:ss' }}       // output is '43:11'
{{ dateObj | date:'MM/dd/yyyy'}|  ?? output is '12/31/2001
```

#### Proper Case

{{ BOB BARKER | | titlecase }} // output is Bob Barker

#### Disable button  	

	<button type="submit" [disabled]="!ngForm.valid">Submit</button>

## Form Groups

#### Reset FormGroup  

    this.myFormGroup.reset();
    this.myFormGroup.markAsPristine();

#### Add two validators to form control   

    msgInput: new FormControl("", [Validators.required, Validators.minLength(5)]),
    
    // or 
    
    hostname: ['', Validator.compose([Validators.required, Validators.pattern(this.unamePattern)]),  
    

# Deploy to Git Hub 

First install the cli  

    npm install -g angular-cli-ghpages
    
Next need to add it ( i think the install above is one time only eg, g for global)  

    ng add angular-cli-ghpages
    # then deploy and set base href to match your github URL 
    ng deploy --base-href=https://eddyizm.github.io/weather-app/
    # then deploy
    ng deploy

# Deploy to Firebase  
---

Add firebase cli to project. You need to have a firebase project set up in the console.firebase.google.com to start with.   

     ng add @angular/fire

Follow the instructions to connect your account/project.   

You also need to add the firebase tools to npm before the rest of this works.  

    npm install -g firebase-tools

*REQUIRED* at the bottom of your body tag otherwise, none of this works.

    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="/__/firebase/7.13.2/firebase-app.js"></script>
    <!-- Initialize Firebase -->
    <script src="/__/firebase/init.js"></script>

connect CLI to project:   

    firebase login
    firebase init

select `hosting` ,then your project and also `dist/my-project-name` as the public directory

    # deploy
    firebase deploy

# NG directives

ngIf multiple condintion
```
	*ngIf 
```

*ngFor X amount of items per row

Example shows 5 items per row:

```
<div *ngFor="let item of items; let i = index">
  <div *ngIf="i % 5 == 0" class="row">
    {{ item }}
    <div *ngIf="i + 1 < items.length">{{ items[i + 1] }}</div>
    <div *ngIf="i + 2 < items.length">{{ items[i + 2] }}</div>
    <div *ngIf="i + 3 < items.length">{{ items[i + 3] }}</div>
    <div *ngIf="i + 4 < items.length">{{ items[i + 4] }}</div>
  </div>
</div>
```	