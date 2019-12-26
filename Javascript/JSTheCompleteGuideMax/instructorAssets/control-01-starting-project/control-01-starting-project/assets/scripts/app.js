/***************
 * IMPORTANT NOTE
 *
 * Two identical objects or arrays stored in two different variables
 * will never return true when compared using Boolean operators
 * const person1 = {name: 'Matt}
 * const person2 = {name: 'Matt}
 * person1 == (or ===) person2 --> will ALWAYS return false
 * const person3 = person1
 * person1 == (or ===) person3
 * person1.name === person2.name [provides access to object elements which are equal]
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
