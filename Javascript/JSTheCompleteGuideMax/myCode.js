// // Global and Local Scope

// const defaultResult = 0
// let currentResult = defaultResult

// // Variables and constants defined outside functions can be accessed inside of the function
// // Variables and constants defined inside a function block cannots be accessed outside the block
// // The below is called a "Pure Function"
// // It does not alter any global variables
// // Variables inside of functions get their own scope
// function add(num1, num2) {
//   const result = num1 + num2
//   return result
// }

// currentResult = add(1, 2)

// let calculationDescription = `(${defaultResult} + 10) * 3 / 2 - 1`

// outputResult(currentResult, calculationDescription)

// /* SHADOWED VARIABLES

// When referring to userName inside of the greetUser function we now
// always refer to the local, shadowed variable. Only if no such local variable existed, JavaScript would fall back to the global variable.
// */

// /* NOTES ON RETURN STATEMENT

// Useful for getting code out of the function.

// Return ends the execution of the function.
// No code within the function will be executed after it is returned.
// Functions can be returned with only 'return'.
// Return without any statement following simply ends the function's
// execution.
// */

// // Executing Functions "Indirectly"

// const defaultResult = 0
// let currentResult = defaultResult

// // Function has no return statement because it is just feeding
// // information to the event listener
// // It also alters a global variable, but since it doesn't return it
// // it indicates to the programmer that it is not to be used for anything
// // besides the event listener
// // Function remains active after script has run so the
// // outputResult variable must be included in the function for the code to work
// // Functions without return tell the JS engine to not execute the function immediately
// // but to store it in memory for future execution upon an event
// // JS ALWAYS EXECUTES A FUNCTION WHEN IT INCLUDES PARENS
// // This is why with event listeners only the function's name is used and not parens

// function add() {
// 	currentResult = currentResult + userInput.value
// 	outputResult(currentResult, '')
// }

// // Event Listeners take two parameters
// // 1.) String value
// // 2.) Function name WITHOUT PARENS
// addBtn.addEventListener('click', add)

// // Functions with empty parens indicate that the function does not require any parameters.
// // Function parameters are essentially variables to be used within the function

// // Converting Data Types

// // Anything input by a user and imported via an html file will always be recognized by JS as a string
// const defaultResult = 0
// let currentResult = defaultResult

// // As the below function is, userInput.value is a string. We need to convert it to a number
// // If left as a string, JS will simply continue to concat every user input.
// // parseInt and parseFloat are built into JS. They take a string as a param and convert to integer or floating decimal
// function add() {
// 	// variable.toString() converts input to a string
// 	currentResult = currentResult + parseInt(userInput.value) // More control over what to convert to
// 	// currentResult = currentResult + +userInput.value // '+' can be used without parens as shorthand for parseInt('string')
// 	outputResult(currentResult, '')
// }

// addBtn.addEventListener('click', add)

// Mixing String and Numbers

/*
The '+' operator is the only arithmetic operator that concats numbers and strings.
All the rest of the arithmetic operators perform arithmetic operations on numbers and string.
For Example:

3 - '3' = 0
3 / '3' = 1
3 * '3' = 9

But 3 + '3' = 33 due to JS concat properties for the '+' operator.

// Even const vars when declared inside a function are only limited to function's local scope
// DON'T REPEAT YOURSELF (DRY)!!!!!!!!!
// Best to define all functions, global vars, global consts, and global lets at top of script

*/
