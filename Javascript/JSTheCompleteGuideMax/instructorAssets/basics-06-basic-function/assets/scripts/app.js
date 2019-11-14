const defaultResult = 0
let currentResult = defaultResult

function add(num1, num2) {
	const result = num1 + num2
	return result
}

currentResult = add(1, 2) // Calling the function

let calculationDescription = `(${defaultResult} + 10) * 3 / 2 - 1`

outputResult(currentResult, calculationDescription)

// function add(num1, num2) {
// Can declare function after it is called due to hoisting
// 	const result = num1 + num2
// 	return result
// }
