const startGameBtn = document.getElementById('start-game-btn')

// Anonymous Functions can be used with Function Expressions
// const start = function() {
// 	console.log('Game is starting...')
// }

// Another use case for anonymous functions
// In this case the function would not be called immediately
startGameBtn.addEventListener('click', function() {
	console.log('Game is starting...')
})

// In this case the function would be called immediately
startGameBtn.addEventListener(
	'click',
	(function() {
		console.log('Game is starting...')
	})() // Extra parens call function immediately
)
