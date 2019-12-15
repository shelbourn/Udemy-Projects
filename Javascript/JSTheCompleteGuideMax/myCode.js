// Global and Local Scope

const defaultResult = 0
let currentResult = defaultResult

// Variables and constants defined outside functions can be accessed inside of the function
// Variables and constants defined inside a function block cannots be accessed outside the block
// The below is called a "Pure Function"
// It does not alter any global variables
function add(num1, num2) {
  const result = num1 + num2
  return result
}

currentResult = add(1, 2)

let calculationDescription = `(${defaultResult} + 10) * 3 / 2 - 1`

outputResult(currentResult, calculationDescription)