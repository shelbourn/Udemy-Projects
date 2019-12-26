/**********************
 * FALSY and TRUTHY Values
 *
 * JS tries to coerce values to a Boolean value if a Boolean value is required.
 * const nameInput ='Matt'
 * if(nameInput === 'Matt'){...} --> returns true
 *
 * const nameInput = 'Matt'
 * if(nameInput){...} --> Also works because this is 'Truthy'
 *
 * 0 is treated as False or Falsey
 * Any other number (including negative numbers) is treated as True or Truthy
 *
 * Truthy and Falsey values eliminate the need for using explicit comparisons
 * eg enteredNumber === 0 (0 is False)
 * Instead you can just use...
 * !enteredNumber (0 means not false, any other number means not true)
 *
 * "" (empty string) treated as False
 * Any other string (including "false") treated as true
 *
 * Objects and Arrays are ALWAYS treated as True (even empty ones)
 *
 * NULL, UNDEFINED, NaN are ALWAYS treated as False.
 */

const defaultResult = 0
let currentResult = defaultResult
let logEntries = []

// Gets input from input field
// Return is used here because it will be assigned to const/var later
function getUserNumberInput() {
	return parseInt(usrInput.value)
}

// Generates and writes calculation log
function createAndWriteOutput(operator, resultBeforeCalc, calcNumber) {
	const calcDescription = `${resultBeforeCalc} ${operator} ${calcNumber}`
	outputResult(currentResult, calcDescription) // from vendor file
}

function writeToLog(
	operationIdentifier,
	prevResult,
	operationNumber,
	newResult
) {
	const logEntry = {
		operation: operationIdentifier,
		prevResult: prevResult,
		number: operationNumber,
		result: newResult,
	}
	logEntries.push(logEntry)
	console.log(logEntries)
}

function calculateResult(calculationType) {
	if (
		(calculationType !== 'ADD' &&
			calculationType !== 'SUBTRACT' &&
			calculationType !== 'MULTIPLY' &&
			calculationType !== 'DIVIDE') ||
		!enteredNumber
	) {
		return
	}

	// CAN USE THIS METHOD ALSO, BUT THE ABOVE METHOD IS PREFERRED
	// if (
	// 	calculationType === 'ADD' ||
	// 	calculationType === 'SUBTRACT' ||
	// 	calculationType === 'MULTIPLY' ||
	// 	calculationType === 'DIVIDE'
	// )

	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
	let mathOperator
	if (calculationType === 'ADD') {
		currentResult += enteredNumber
		mathOperator = '+'
	} else if (calculationType === 'SUBTRACT') {
		currentResult -= enteredNumber
		mathOperator = '-'
	} else if (calculationType === 'MULTIPLY') {
		currentResult *= enteredNumber
		mathOperator = '*'
	} else {
		currentResult /= enteredNumber
		mathOperator = '/'
	}

	createAndWriteOutput(mathOperator, initialResult, enteredNumber)
	writeToLog(calculationType, initialResult, enteredNumber, currentResult)
}

function add() {
	calculateResult('ADD')
}

function subtract() {
	calculateResult('SUBTRACT')
}

function multiply() {
	calculateResult('MULTIPLY')
}

function divide() {
	calculateResult('DIVIDE')
}

addBtn.addEventListener('click', add)
subtractBtn.addEventListener('click', subtract)
multiplyBtn.addEventListener('click', multiply)
divideBtn.addEventListener('click', divide)
