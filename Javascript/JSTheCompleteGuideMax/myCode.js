// Global and Local Scope

const defaultResult = 0
let currentResult = defaultResult

// Variables and constants defined outside functions can be accessed inside of the function
// Variables and constants defined inside a function block cannots be accessed outside the block
// The below is called a "Pure Function"
// It does not alter any global variables
// Variables inside of functions get their own scope
function add(num1, num2) {
  const result = num1 + num2
  return result
}

currentResult = add(1, 2)

let calculationDescription = `(${defaultResult} + 10) * 3 / 2 - 1`

outputResult(currentResult, calculationDescription)

/* SHADOWED VARIABLES

When referring to userName inside of the greetUser function we now
always refer to the local, shadowed variable. Only if no such local variable existed, JavaScript would fall back to the global variable.
*/