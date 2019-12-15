// Global and Local Scope

const defaultResult = 0
let currentResult = defaultResult

// Variables and constants defined in functions can be accessed outside of the function
function add(num1, num2) {
  const result = num1 + num2
  return result
}

currentResult = add(1, 2)

let calculationDescription = `(${defaultResult} + 10) * 3 / 2 - 1`

outputResult(currentResult, calculationDescription)