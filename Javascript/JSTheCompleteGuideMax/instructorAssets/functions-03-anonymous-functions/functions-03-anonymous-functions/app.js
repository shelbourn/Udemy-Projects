const startGameBtn = document.getElementById('start-game-btn')

// Anonymous Functions can be used with Function Expressions
// const start = function() {
// 	console.log('Game is starting...')
// }

// Another use case for anonymous functions
startGameBtn.addEventListener('click', function() {
	console.log('Game is starting...')
})
