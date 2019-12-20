const defaultResult = 0
let currentResult = 0

function getUserNumberInput() {
	return parseInt(usrInput.value) // Converts String (User Input) to number
}

function add() {
	const enteredNumber = getUserNumberInput()
	const calcDescription = `${currentResult} + ${enteredNumber}`
	currentResult = currentResult + enteredNumber
	outputResult(currentResult, calcDescription)
}

function subtract() {
	const enteredNumber = getUserNumberInput()
	const calcDescription = `${currentResult} - ${enteredNumber}`
	currentResult = currentResult - enteredNumber
	outputResult(currentResult, calcDescription)
}

function multiply() {
	const enteredNumber = getUserNumberInput()
	const calcDescription = `${currentResult} * ${enteredNumber}`
	currentResult = currentResult * enteredNumber
	outputResult(currentResult, calcDescription)
}

function divide() {
	const enteredNumber = getUserNumberInput()
	const calcDescription = `${currentResult} / ${enteredNumber}`
	currentResult = currentResult / enteredNumber
	outputResult(currentResult, calcDescription)
}

addBtn.addEventListener('click', add)
