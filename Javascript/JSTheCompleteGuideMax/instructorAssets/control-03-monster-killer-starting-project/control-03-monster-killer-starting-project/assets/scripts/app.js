const ATTACK_VALUE = 10 // Global value. Uppercase characters separated by underscore for hard-coded values related to gameplay
const STRONG_ATTACK_VALUE = 17
const MONSTER_ATTACK_VALUE = 14
const HEAL_VALUE = 20

const enteredValue = prompt('Maximum life for you and the monster', '100')

// Prompts user to enter health
let chosenMaxLife = parseInt(enteredValue) // Or +enteredValue

if (isNan(chosenMaxLife) || chosenMaxLife <= 0) {
	chosenMaxLife = 100
}

let currentMonsterHealth = chosenMaxLife
let currentPlayerHealth = chosenMaxLife
let hasBonusLife = true

adjustHealthBars(chosenMaxLife)

// Resetting game after finished
function reset() {
	currentMonsterHealth = chosenMaxLife
	currentPlayerHealth = chosenMaxLife
	resetGame(chosenMaxLife)
}

// endRound function checks win condition after each round
// Monster attack
function endRound() {
	const initialPlayerHealth = currentPlayerHealth
	const playerDamage = dealPlayerDamage(MONSTER_ATTACK_VALUE)
	currentPlayerHealth -= playerDamage

	// Bonus life code
	if (currentPlayerHealth <= 0 && hasBonusLife) {
		hasBonusLife = false
		removeBonusLife()
		currentPlayerHealth = initialPlayerHealth
		setPlayerHealth(initialPlayerHealth)
		alert('You would be dead, but the bonus life saved you!')
	}
	if (currentMonsterHealth <= 0 && currentPlayerHealth > 0) {
		alert('You won!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth > 0) {
		alert('You lost!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth <= 0) {
		alert('You have a draw!')
	}
}

// Reset Game function
if (currentMonsterHealth <= 0 || currentPlayerHealth <= 0) {
	reset()
}

//Player attack
function attackMonster(mode) {
	let maxDamage
	if (mode === 'ATTACK') {
		maxDamage = ATTACK_VALUE
	} else if (mode === 'STRONG_ATTACK') {
		maxDamage = STRONG_ATTACK_VALUE
	}

	const damage = dealMonsterDamage(maxDamage)
	currentMonsterHealth -= damage
	endRound()
}

// Naming convention of function refers to what the function does and what it is connected to
function attackHandler() {
	attackMonster('ATTACK')
}

function strongAttackHandler() {
	attackMonster('STRONG_ATTACK')
}

// Heal function
function healPlayerHandler() {
	let healValue
	if (currentPlayerHealth >= chosenMaxLife - HEAL_VALUE) {
		alert("You can't heal to more than your initial health.")
		healValue = chosenMaxLife - currentPlayerHealth
	} else {
		healValue = HEAL_VALUE
	}
	increasePlayerHealth(healValue)
	currentPlayerHealth += healValue
	endRound()
}

attackBtn.addEventListener('click', attackHandler)
strongAttackBtn.addEventListener('click', strongAttackHandler)
healBtn.addEventListener('click', healPlayerHandler)
