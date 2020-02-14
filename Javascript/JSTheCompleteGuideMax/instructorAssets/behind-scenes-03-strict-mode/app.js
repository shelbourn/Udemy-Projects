// let name = 'Matt'

// if (name === 'Matt') {
// 	let hobbies = ['Music', 'Programming']
// 	console.log(hobbies)
// }

// function greet() {
// 	let age = 38
// 	let name = 'Max'
// 	console.log(name, age)
// }

// console.log(name, hobbies)

// greet()

// *** Strict mode ***
// ES6 syntax (Let, Const) already restricts certain features that were available in ES5 and earlier

'use strict' // Enables Strict Mode

// This will be disabled with strict mode
const userName = 'Matt' // With Var, you can declare a variable without even using the 'Var' keyword
var undefined = 5 // Disabled with strict mode

console.log(userName)
