//Global Variables
const startGameBtn = document.getElementById('start-game-btn')

const ROCK = 'ROCK'
const PAPER = 'PAPER'
const SCISSORS = 'SCISSORS'
const DEFAULT_USER_CHOICE = ROCK
const RESULT_DRAW = 'DRAW'
const RESULT_PLAYER_WINS = 'PLAYER_WINS'
const RESULT_COMPUTER_WINS = 'COMPUTER_WINS'

let gameIsRunning = false

// Get Player Choice
const getPlayerChoice = () => {
	const selection = prompt(
		`${ROCK}, ${PAPER} or ${SCISSORS}?`,
		''
	).toUpperCase()
	if (selection !== ROCK && selection !== PAPER && selection !== SCISSORS) {
		alert(`Invalid choice! We chose ${ROCK} for you!`)
		return DEFAULT_USER_CHOICE
	}
	return selection
}
// Get Computer Choice
const getComputerChoice = () => {
	const randomValue = Math.random() //Method that generates a random number between 0 and 1
	if (randomValue < 0.34) {
		return ROCK
	} else if (randomValue < 0.67) {
		return PAPER
	} else {
		return SCISSORS
	}
}

// Winner Selection
// Arrow functions can only be used with arrow functions and must appear on the right side of an equal sign in an expression, in an event listener, etc
// Arrow functions with only one expression can omit the curly braces and the 'return' keyword - NO RETURN KEYWORD IS PERMITTED
// Arrow functions don't require arguments
// Arrow function with only 1 argument/parameter does not require parens

// Arrow function with more than 1 argument/parameter
const test3 = arg2 => {
	arg2 *= 2
	return arg2
}

// Arrow function with only 1 argument/parameter
const test2 = arg => 5 + arg

// Arrow function without arguments
const test = () => 5 + 5

// Example - Arrow Function
const add = (a, b) => a + b

// Example - Normal Function Syntax
const add2 = function(a, b) {
	return a + b
}

const getWinner = (cChoice, pChoice) =>
	cChoice === pChoice
		? RESULT_DRAW
		: (cChoice === ROCK && pChoice === PAPER) ||
		  (cChoice === PAPER && pChoice === SCISSORS) ||
		  (cChoice === SCISSORS && pChoice === ROCK)
		? RESULT_PLAYER_WINS
		: RESULT_COMPUTER_WINS

// if (cChoice === pChoice) {
// 	return RESULT_DRAW
// } else if (
// 	(cChoice === ROCK && pChoice === PAPER) ||
// 	(cChoice === PAPER && pChoice === SCISSORS) ||
// 	(cChoice === SCISSORS && pChoice === ROCK)
// ) {
// 	return RESULT_PLAYER_WINS
// } else {
// 	return RESULT_COMPUTER_WINS
// }

// Game Start
startGameBtn.addEventListener('click', () => {
	//Returns function if the game is already running
	if (gameIsRunning) {
		return
	}
	gameIsRunning = true
	console.log('Game is starting...')
	const playerChoice = getPlayerChoice() //Remember to use () at the end of a function's name
	const computerChoice = getComputerChoice()
	const winner = getWinner(computerChoice, playerChoice)
	console.log(playerChoice)
	console.log(computerChoice)
	console.log(winner)
})
