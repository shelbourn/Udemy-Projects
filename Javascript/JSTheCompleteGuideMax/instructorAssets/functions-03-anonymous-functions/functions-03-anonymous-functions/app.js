const startGameBtn = document.getElementById('start-game-btn')

// Anonymous Functions can be used with Function Expressions
// const start = function() {
// 	console.log('Game is starting...')
// }

// Another use case for anonymous functions
// This is useful if you will not need a function anywhere else in your code
// Assigning anonymous functions to a const or variable may be useful to troubleshoot bugs
// You can also name an anonymous function, which is helpful for debugging
// Below is an example of a named anonymous function
startGameBtn.addEventListener('click', function startGame() {
	console.log('Game is starting...')
})
