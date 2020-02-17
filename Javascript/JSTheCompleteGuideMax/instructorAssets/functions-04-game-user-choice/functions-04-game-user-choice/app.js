const startGameBtn = document.getElementById('start-game-btn')

const getPlayerChoice = function() {
	const selection = prompt('Rock, Paper or Scissors?', '')
	if (
		selection !== 'Rock' &&
		selection !== 'Paper' &&
		selection !== 'Scissors'
	) {
		alert('Invalid choice! We chose Rock for you!')
	}
}

startGameBtn.addEventListener('click', function() {
	console.log('Game is starting...')
})
