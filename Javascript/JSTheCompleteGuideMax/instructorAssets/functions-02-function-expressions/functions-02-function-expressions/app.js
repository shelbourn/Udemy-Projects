const startGameBtn = document.getElementById('start-game-btn')

function startGame() {
	console.log('Game is starting...')
}

console.dir(startGame) // .dir is similar to .log but provides more detail

startGameBtn.addEventListener('click', startGame)
