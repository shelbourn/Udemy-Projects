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

// Converting Data Types

// Anything input by a user and imported via an html file will always be recognized by JS as a string
const defaultResult = 0
let currentResult = defaultResult

function () {
  currentResult = currentResult + userInput.value
  outputResult(currentResult, '')
}

addBtn.addEventListener('click', add)