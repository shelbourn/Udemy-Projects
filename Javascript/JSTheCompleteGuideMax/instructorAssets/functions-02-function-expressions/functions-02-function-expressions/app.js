const startGameBtn = document.getElementById('start-game-btn')

// Function Declaration (Global scope)
function startGame() {
	console.log('Game is starting...')
}

// Function Expression (Block scope)
// Below is an example of an anonymous function
const start = function() {
	console.log('Game is starting...')
}

startGameBtn.addEventListener('click', start)
