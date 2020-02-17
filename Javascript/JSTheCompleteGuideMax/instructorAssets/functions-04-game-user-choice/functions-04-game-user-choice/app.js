const startGameBtn = document.getElementById('start-game-btn')

const ROCK = 'ROCK'
const PAPER = 'PAPER'
const SCISSORS = 'SCISSORS'
const DEFAULT_USER_CHOICE = ROCK

let gameIsRunning = false

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

startGameBtn.addEventListener('click', function() {
	console.log('Game is starting...')
	const playerSelection = getPlayerChoice() //Remember to use () at the end of a function's name
	console.log(playerSelection)
})
