const startGameBtn = document.getElementById('start-game-btn')

const ROCK = 'ROCK'
const PAPER = 'PAPER'
const SCISSORS = 'SCISSORS'

const getPlayerChoice = function() {
	const selection = prompt(`${ROCK}, ${PAPER} or ${SCISSORS}?`, '').toUpperCase
	if (selection !== ROCK && selection !== PAPER && selection !== SCISSORS) {
		alert('Invalid choice! We chose Rock for you!')
	}
}

startGameBtn.addEventListener('click', function() {
	console.log('Game is starting...')
})
