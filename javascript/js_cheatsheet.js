// Javascript Cheatsheet. 

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
  
