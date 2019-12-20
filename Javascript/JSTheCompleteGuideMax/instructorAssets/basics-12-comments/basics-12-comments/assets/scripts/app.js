const defaultResult = 0
let currentResult = 0

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
	const initialResult = currentResult
	currentResult += enteredNumber
	// currentResult = currentResult + enteredNumber
	createAndWriteOutput('+', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
}

function subtract() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} - ${enteredNumber}`
	const initialResult = currentResult
	currentResult -= enteredNumber
	// currentResult = currentResult - enteredNumber
	createAndWriteOutput('-', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
}

function multiply() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} * ${enteredNumber}`
	const initialResult = currentResult
	currentResult *= enteredNumber
	// currentResult = currentResult * enteredNumber
	createAndWriteOutput('*', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
}

function divide() {
	const enteredNumber = getUserNumberInput()
	// const calcDescription = `${currentResult} / ${enteredNumber}`
	const initialResult = currentResult
	currentResult /= enteredNumber
	// currentResult = currentResult / enteredNumber
	createAndWriteOutput('/', initialResult, enteredNumber)
	// outputResult(currentResult, calcDescription)
}

addBtn.addEventListener('click', add)
subtractBtn.addEventListener('click', subtract)
multiplyBtn.addEventListener('click', multiply)
divideBtn.addEventListener('click', divide)
