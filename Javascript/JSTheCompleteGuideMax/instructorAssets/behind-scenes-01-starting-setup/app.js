// Let and Const are block scope
// Var is function and global scope

// let name = 'Matt' // this variable will now be ignored due to shadow variable
// // let name = 'Sara' // Won't work because 'name' has already been declared in global scope

// function greet() {
// 	let age = 30
// 	let name = 'Max' // shadow variable in block scope
// 	console.log(name, age)
// }

// // console.log(name, age) // Won't work because it's out of the block scope

// greet()

// Doing the same as above, but with Var
// Anything in the global scope can be accessed anywhere in the code

var name = 'Matt'

if (name === 'Matt') {
	// var hobbies = ['Sports', 'Cooking'] // Vars declared inside If statements are part of the Global Scope
	let hobbies = ['Music', 'Programming'] // Let is block scope so the 'Hobbies' array will only be accessible in the If statement
	console.log(hobbies)
}

function greet() {
	var age = 38 // Function Scope
	var name = 'Max' // Function Scope
	console.log(name, age, hobbies)
}

console.log(name, hobbies)

greet()
