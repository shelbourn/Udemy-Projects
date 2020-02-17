const startGameBtn = document.getElementById('start-game-btn')

function startGame() {
	console.log('Game is starting...')
}

// Functions can be stored in objects
const person = {
	greet: function greet() {
		console.log('Hello there!')
	},
}

// startGame() // Direct Function execution

startGameBtn.addEventListener('click', startGame) // Indirect function execution
