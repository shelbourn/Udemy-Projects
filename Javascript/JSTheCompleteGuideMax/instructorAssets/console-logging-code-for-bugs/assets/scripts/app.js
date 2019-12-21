const defaultResult = 0
let currentResult = 0
let logEntries = []

/**********************************
 * Debugging with Chrome Dev Tools
 *
 */

// Breakpoints allow you to pause code execution at that point
// Add breakpoints through Chrome Dev tools in the 'Sources' tab and then click on code file
// Code execution stops before the line where the breakpoint is added
// Call stack shows the functions that have been called in order
// Top function in call stack is function that is running
// Functions below top function are the functions that are responsible for call the top function
// Variables can be changed in the 'Scope' window after clicking on a function in the Call Stack
// You can add variables or expressions to the 'Watch' list in the 'Scope' window to see how they change
// Conditional breakpoints may be added by right clicking the line in Chrome's debugging window
// Conditional breakpoints can activate only when certain conditions are met
// Event listener breakpoints will pause code execution whenever a user interraction occurs based on the criteria you set
// Changing the code in Chrome's debugger does not alter file on filesystem, only in browser
// This helps to test fixes before you change your actual files

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
