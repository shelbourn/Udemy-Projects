/************************
 * Hoisting in Practice
 */

// Function declaration is stored in the 'Global Variable' object even before the code executes.
// This is why you can call 'calcAge(1965)' before the calcAge() function line is even written

calcAge(1965)

function calcAge(year) {
	console.log(2016 - year)
}
