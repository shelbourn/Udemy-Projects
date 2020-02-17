const startGameBtn = document.getElementById('start-game-btn')

function startGame() {
	console.log('Game is starting...')
}

// startGame() // Direct Function execution

startGameBtn.addEventListener('click', startGame) // Indirect function execution
