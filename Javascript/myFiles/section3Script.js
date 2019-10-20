/************************
 * Hoisting in Practice
 */

// Functions

// Function declaration is stored in the 'Global Variable' object even before the code executes.
// This is why you can call 'calcAge(1965)' before the calcAge() function line is even written

// Function declaration

calcAge(1965)

function calcAge(year) {
	console.log(2016 - year)
}

// Function Expression

// retirement(1965) // Does not work with function expressions

var retirement = function(year) {
	console.log(65 - (2016 - year))
}

retirement(1990) // This works with function expressions

// Variables

console.log(age)
var age = 23 // Stored in Global Variable object as different value from 'var age' below

function foo() {
	console.log(age)
	var age = 65
	console.log(age)
}
foo()
console.log(age)
