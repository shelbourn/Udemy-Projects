const startGameBtn = document.getElementById('start-game-btn')

// Function Declarations: Hoisted and initialized
// Function Expressions: Hoisted and not initialized

const start = function() {
	console.log('Game is starting...')
}

startGameBtn.addEventListener('click', start)
