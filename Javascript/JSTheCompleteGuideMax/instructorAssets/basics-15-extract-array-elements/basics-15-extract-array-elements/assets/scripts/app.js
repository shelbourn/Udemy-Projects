const defaultResult = 0
let currentResult = 0
let logEntries = []

// Arrays have an index that is zero-based (index starts at zero)
// Object use key-value pairs. Keys are the identifiers for the elements and those are paired with information/data

// Gets input from input field
function getUserNumberInput() {
	return parseInt(usrInput.value) // Converts String (User Input) to number
}

// Generates and writes calculation log
// Outputs only text
function createAndWriteOutput(operator, resultBeforeCal, calcNumber) {
	const calcDescription = `${resultBeforeCal} ${operator} ${calcNumber}`
	outputResult(currentResult, calcDescription) // From vendor.js file
}

// currentResult++ (adds 1 to number) Returns number before 1 is added
// currentResult-- (subtracts 1 from a number) Returns number before 1 is subtracted
// ++currentResult (adds 1 to a number) Returns number after 1 is added
// --currentResult (subtracts 1 from a number) Returns number after 1 is subtracted

function add() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} + ${enteredNumber}`
	// initialResult will not change if currentResult changes afterwards
	const initialResult = currentResult
	currentResult += enteredNumber
	// currentResult = currentResult + enteredNumber
	createAndWriteOutput('+', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
	const logEntry = {}
	logEntries.push(enteredNumber)
	console.log(logEntries) // Reads array element at index 0
}

function subtract() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} - ${enteredNumber}`
	const initialResult = currentResult
	currentResult -= enteredNumber
	// currentResult = currentResult - enteredNumber
	createAndWriteOutput('-', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
	logEntries.push(enteredNumber)
	console.log(logEntries)
}

function multiply() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} * ${enteredNumber}`
	const initialResult = currentResult
	currentResult *= enteredNumber
	// currentResult = currentResult * enteredNumber
	createAndWriteOutput('*', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
	logEntries.push(enteredNumber)
	console.log(logEntries)
}

function divide() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} / ${enteredNumber}`
	const initialResult = currentResult
	currentResult /= enteredNumber
	// currentResult = currentResult / enteredNumber
	createAndWriteOutput('/', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
	logEntries.push(enteredNumber)
	console.log(logEntries)
}

addBtn.addEventListener('click', add)
subtractBtn.addEventListener('click', subtract)
multiplyBtn.addEventListener('click', multiply)
divideBtn.addEventListener('click', divide)
