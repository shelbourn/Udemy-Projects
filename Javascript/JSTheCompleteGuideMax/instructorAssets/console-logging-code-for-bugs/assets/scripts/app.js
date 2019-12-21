const defaultResult = 0
let currentResult = 0
let logEntries = []

// Arrays have an index that is zero-based (index starts at zero)
// Arrays are special types of objects
// Object use key-value pairs. Keys are the identifiers for the properties and those are paired with information/data
// Object keys are also known as properties

// To reset variables never use myVar = undefined. Always use myVar = null
// Null is of type 'object'
// undefined is of type 'undefined'
// NaN is of type 'number'

// typeof operator evaluates the type of a variable at runtime

// Gets input from input field
function getUserNumberInput() {
	return usrInput.value // Converts String (User Input) to number. .value is the contents from a form input field
}

// Generates and writes calculation log
// Outputs only text
function createAndWriteOutput(operator, resultBeforeCalc, calcNumber) {
	const calcDescription = `${resultBeforeCalc} ${operator} ${calcNumber}`
	outputResult(currentResult, calcDescription) // From vendor.js file
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

// currentResult++ (adds 1 to number) Returns number before 1 is added
// currentResult-- (subtracts 1 from a number) Returns number before 1 is subtracted
// ++currentResult (adds 1 to a number) Returns number after 1 is added
// --currentResult (subtracts 1 from a number) Returns number after 1 is subtracted

function add() {
	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
	// Console logging code to search for bugs
	console.log('INPUT', enteredNumber, currentResult)
	// Log below shows the data types for enteredNumber and currentResult (both should be numbers)
	console.log('INPUT TYPE', typeof enteredNumber, typeof currentResult)
	currentResult += enteredNumber
	createAndWriteOutput('+', initialResult, enteredNumber)
	writeToLog('ADD', initialResult, enteredNumber, currentResult)
}

function subtract() {
	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
	currentResult -= enteredNumber
	createAndWriteOutput('-', initialResult, enteredNumber)
	writeToLog('SUBTRACT', initialResult, enteredNumber, currentResult)
}

function multiply() {
	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
	currentResult *= enteredNumber
	createAndWriteOutput('*', initialResult, enteredNumber)
	writeToLog('MULTIPLY', initialResult, enteredNumber, currentResult)
}

function divide() {
	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
	currentResult /= enteredNumber
	createAndWriteOutput('/', initialResult, enteredNumber)
	writeToLog('DIVIDE', initialResult, enteredNumber, currentResult)
}

addBtn.addEventListener('click', add)
subtractBtn.addEventListener('click', subtract)
multiplyBtn.addEventListener('click', multiply)
divideBtn.addEventListener('click', divide)
