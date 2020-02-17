const startGameBtn = document.getElementById('start-game-btn')

// Function Declaration
function startGame() {
	console.log('Game is starting...')
}

// Function Expression
const start = function startGame() {
	console.log('Game is starting...')
}

startGameBtn.addEventListener('click', start)
