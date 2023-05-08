// Javascript Cheatsheet. 

// sum array of number values
let numArray = [1001,1002,1003,1004] 
numArray.reduce((a, b) => {
  return a + b;
});

// check if value is null or undefined (the classic)
let a;

if (a === null || a === undefined) { // true
  console.log('Null or undefined value!');
} else {
  console.log(a);
}

// set 3 decimal points and trim trailing zeros
parseFloat(Number(value).toFixed(3))

// filter array on multipe fields
const deDupe = (arrayToFilter) => {
  const unique = arrayToFilter.filter((obj, index) => {
    return index === arrayToFilter.findIndex(o => obj.id === o.id && obj.name === o.name);
  })
  return unique
}

// validate XPATH searches in console
$x("//input[@name='q']")

// iterate over array
let array = [1, 2, 3, 4, 5];
array.forEach((element) => {
  console.log(element);
});


// iterate over dictionary
var dict = this.props.dict;

for (var key in dict) {
  // Do stuff. ex: console.log(dict[key])
}


// console log variable
let name = "this is a variable";
console.log(`testing my text ${name}`);


// in <a> tag works
onclick="window.close()"    


// Find an object in an array by one of its properties
const inventory = [
    { name: "apples", quantity: 2 },
    { name: "bananas", quantity: 0 },
    { name: "cherries", quantity: 5 },
  ];
  
const result = inventory.find(({ name }) => name === "cherries");
console.log(result); // { name: 'cherries', quantity: 5 }
  
