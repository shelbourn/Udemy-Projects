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

person.greet() // Directly calls the greet() function within the person object as if you were calling a normal key/value pair

// startGame() // Direct Function execution

startGameBtn.addEventListener('click', startGame) // Indirect function execution
