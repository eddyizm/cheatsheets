// Typescript

/* correct way to clone an array  */

const sheeps = ['🐑', '🐑', '🐑'];

// Old way
const cloneSheeps = sheeps.slice();

// ES6 way
const cloneSheepsES6 = [...sheeps];


/* check if array is empty */


if (!Array.isArray(array) || !array.length) {
  // array does not exist, is not an array, or is empty
  // ⇒ do not attempt to process array
}


/* array to string (comma seperated) */

Array.toString()  

/*  find unique values in array by property */

var array = [
  {"name": "64615", "age": "Z91.81", "code": "HISTORY OF FALLING"}, 
  {"name": "97110", "age": "Z91.82", "code": "HISTORY OF FALLING"}, 
  {"name": "20305", "age": "Z91.81", "code": "HISTORY OF FALLING"}
];  

const key = 'age';

console.log(array.map( o => o.age).filter( (v,i,a) => a.indexOf(v)===i));

[LOG]: ["Z91.81", "Z91.82"] 

// return the whole object that is unique by key: 

const arrayUniqueByKey = [...new Map(array.map(
    item =>  [item[key], item])
    ).values()];

console.log(arrayUniqueByKey);

[LOG]: [{
  "name": "20305",
  "age": "Z91.81",
  "code": "HISTORY OF FALLING"
}, {
  "name": "97110",
  "age": "Z91.82",
  "code": "HISTORY OF FALLING"
}] 


/* return one column data of above array */

var data = array.map(t=>t.name);

console.log(data)

// or map all the values to one string joined by a new line

console.log(array.map(x=>x.code).join("\n"))

/* Get date for SQLSERVER /POSTGRES */

let date = (new Date()).toLocaleString("en-US")
console.log("Date = " + date);  


/* Sum item array values. */

let itemArray = [
  { id: 1, value: 23 },
  { id: 2, value: 30 },
  { id: 3, value: 7 },
  { id: 4, value: 21 }
];

let index = itemArray.indexOf(itemArray[0]);

index.value = "23";
this.itemArray.[index] = item;

console.log(this.itemArray);

let sum: number = 0;
itemArray.forEach(a => sum += a.value);
console.log(sum );


/* Iterate over a formwarray of form controls */

// example, iterate over form array of form groups to sum unit field
let sum: number = 0;
    this.customFormArray.controls.forEach(key =>{
      sum += key.value.unit; 
    } )
console.log(sum);

/* Sort list */ 

sort((a, b) => a.field.localeCompare(b.field)
        
/* Sort Arry by value (number in this case) */

sort((a,b) => (a.id > b.id ? -1 : 1));


/* Find object in array by property */

myArray.find(x => x.id === '45')

//Returns first element found, otherwise returns undefined is value is not found.

/* get session object */
   

   (JSON.parse(sessionStorage.getItem(sessionStorage.key(0))).profile).sub

/* convert string to number */

```
var x = "32";
var y: number = +x;
```

### round down

```
var time = 11.8;
var water = 0.5
let result = time * water;
console.log('liters of water: ', Math.floor(result))  
```

### concat template literals 

```
const paddedMonth: string = `0${month}`;

str = `${year}-${paddedMonth}-${day} ${hours}:${minutes}:${seconds} `;
```
### declare dictionary 

```
const stateHash : Record<string, string> = { 'AL':  'Alabama',
'AK': 'Alaska',
'AZ': 'Arizona',
'AR': 'Arkansas',
'CA': 'California' }

console.log(stateHash['CA']) 
'California
```

// loop through array 

```
var nums:number[] = [1001,1002,1003,1004] 

for(var index in nums) { 
   console.log(nums[index]) 
} 
```
	