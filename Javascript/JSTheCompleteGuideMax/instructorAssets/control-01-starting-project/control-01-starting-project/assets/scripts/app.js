/****************************
 * Boolean Operators --> Return True or False
 *
 * == (equality operator) --> Check for value equality (a == b) (2 == "2")
 * != (inequality operator) --> Check for value inequality (a != b)
 * === and !== (Stict equality/inequality) --> Check for value AND type (in)equality (a === b) (2 !== "2")
 * === and !== is PREFERRED over == or 1=
 * > & < (Less than/Greater than operator) --> Can check numbers and strings
 * >= & <= (Greater/Less than or equal to) -- Can check numbers and strings
 * ! (Negate Boolean) --> Negates following value. Used to check if something is not true. (!a)
 * If a variable already stores a Boolean you do not need to use an operator
 * const isLoggedIn = true;
 * if (isLoggedIn) {
 * This code will execute because isLoggedIn is true => A valid condition
 * }
 */

/*
 THIS IS REDUNDANT
 const isLoggedIn = true;
 if (isLoggedIn ===true) {
   ...
 }
 */

/**
 * USING THE ! OPERATOR
 * const isloggedIn = true;
 * if (!isLoggedIn) {
 * This code will NOT execute because isLoggedIn is true but ! inverts it (in this check)
 * } else {
 * This would execute because isLoggedIn is true and hence !== true yields false
 * }
 */

const defaultResult = 0
let currentResult = defaultResult
let logEntries = []

// Gets input from input field
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

function add() {
	const enteredNumber = getUserNumberInput()
	const initialResult = currentResult
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
