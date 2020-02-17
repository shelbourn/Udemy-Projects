const startGameBtn = document.getElementById('start-game-btn')

function startGame() {
	console.log('Game is starting...')
}

console.log(typeof startGame)

startGameBtn.addEventListener('click', startGame)
