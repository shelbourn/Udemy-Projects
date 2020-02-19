//Global Variables
const startGameBtn = document.getElementById('start-game-btn')

const ROCK = 'ROCK'
const PAPER = 'PAPER'
const SCISSORS = 'SCISSORS'
const DEFAULT_USER_CHOICE = ROCK

let gameIsRunning = false

// Get Player Choice
const getPlayerChoice = function() {
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
const getComputerChoice = function() {
	const randomValue = Math.random() //Method that generates a random number between 0 and 1
	if (randomValue < 0.34) {
		return ROCK
	} else if (randomValue < 0.67) {
		return PAPER
	} else {
		return SCISSORS
	}
}

// Game Start
startGameBtn.addEventListener('click', function() {
	//Returns function if the game is already running
	if (gameIsRunning) {
		return
	}
	gameIsRunning = true
	console.log('Game is starting...')
	const playerSelection = getPlayerChoice() //Remember to use () at the end of a function's name
	console.log(playerSelection)
})
