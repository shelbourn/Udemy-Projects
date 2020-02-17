const startGameBtn = document.getElementById('start-game-btn')

function startGame() {
	console.log('Game is starting...')
}

// Functions are objects and console.dir will show the key/value pairs
console.dir(startGame) // .dir is similar to .log but provides more detail

startGameBtn.addEventListener('click', startGame)
