// Establishing global variables
const ATTACK_VALUE = 10 // Global value. Uppercase characters separated by underscore for hard-coded values related to gameplay
const STRONG_ATTACK_VALUE = 17
const MONSTER_ATTACK_VALUE = 14
const HEAL_VALUE = 20

// 'ATTACK' and 'STRONG_ATTACK' are just identifiers, it doesn't matter whether a string or number is stored in them.
const MODE_ATTACK = 'ATTACK' // MODE_ATTACK = 0
const MODE_STRONG_ATTACK = 'STRONG_ATTACK' // MODE_STRONG_ATTACK = 0
const LOG_EVENT_PLAYER_ATTACK = 'PLAYER_ATTACK'
const LOG_EVENT_PLAYER_STRONG_ATTACK = 'PLAYER_STRONG_ATTACK'
const LOG_EVENT_MONSTER_ATTACK = 'MONSTER_ATTACK'
const LOG_EVENT_PLAYER_HEAL = 'PLAYER_HEAL'
const LOG_EVENT_GAME_OVER = 'GAME_OVER'

// User prompt to enter player/monster health
const enteredValue = prompt('Maximum life for you and the monster', '100')

let chosenMaxLife = parseInt(enteredValue) // Or +enteredValue
let battleLog = []

// Sets default health if user-entered value is not applicable
if (isNaN(chosenMaxLife) || chosenMaxLife <= 0) {
	chosenMaxLife = 100
}

// Setting player/monster health to user-entered value
let currentMonsterHealth = chosenMaxLife
let currentPlayerHealth = chosenMaxLife
let hasBonusLife = true

adjustHealthBars(chosenMaxLife)

// Write round details to console
function writeToLog(ev, val, monsterHealth, playerHealth) {
	let logEntry = {
		event: ev,
		value: val,
		finalMonsterHealth: monsterHealth,
		finalPlayerHealth: playerHealth,
	}
	switch (ev) {
		case LOG_EVENT_PLAYER_ATTACK:
			logEntry.target = 'MONSTER'
			break
		case LOG_EVENT_PLAYER_STRONG_ATTACK:
			logEntry = {
				event: ev,
				value: val,
				target: 'MONSTER',
				finalMonsterHealth: monsterHealth,
				finalPlayerHealth: playerHealth,
			}
			break
		case LOG_EVENT_MONSTER_ATTACK:
			logEntry = {
				event: ev,
				value: val,
				target: 'PLAYER',
				finalMonsterHealth: monsterHealth,
				finalPlayerHealth: playerHealth,
			}
			break
		case LOG_EVENT_PLAYER_HEAL:
			logEntry = {
				event: ev,
				value: val,
				target: 'PLAYER',
				finalMonsterHealth: monsterHealth,
				finalPlayerHealth: playerHealth,
			}
			break
		case LOG_EVENT_GAME_OVER:
			logEntry = {
				event: ev,
				value: val,
				finalMonsterHealth: monsterHealth,
				finalPlayerHealth: playerHealth,
			}
			break
		// Default value if no conditions are met
		default:
			logEntry = {}
	}
	battleLog.push(logEntry)
}

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
	writeToLog(
		LOG_EVENT_MONSTER_ATTACK,
		playerDamage,
		currentMonsterHealth,
		currentPlayerHealth
	)

	// Bonus life code
	if (currentPlayerHealth <= 0 && hasBonusLife) {
		hasBonusLife = false
		removeBonusLife()
		currentPlayerHealth = initialPlayerHealth
		setPlayerHealth(initialPlayerHealth)
		alert('You would be dead, but the bonus life saved you!')
	}
	// End Game Code
	if (currentMonsterHealth <= 0 && currentPlayerHealth > 0) {
		alert('You won!')
		writeToLog(
			LOG_EVENT_GAME_OVER,
			'PLAYER WON',
			currentMonsterHealth,
			currentPlayerHealth
		)
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth > 0) {
		alert('You lost!')
		writeToLog(
			LOG_EVENT_GAME_OVER,
			'MONSTER WON',
			currentMonsterHealth,
			currentPlayerHealth
		)
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth <= 0) {
		alert('You have a draw!')
		writeToLog(
			LOG_EVENT_GAME_OVER,
			'THERE IS A DRAW',
			currentMonsterHealth,
			currentPlayerHealth
		)
	}

	// Reset Game function
	if (currentMonsterHealth <= 0 || currentPlayerHealth <= 0) {
		reset()
	}
}

//Player attack
function attackMonster(mode) {
	const maxDamage = mode === MODE_ATTACK ? ATTACK_VALUE : STRONG_ATTACK_VALUE
	const logEvent =
		mode === MODE_ATTACK
			? LOG_EVENT_PLAYER_ATTACK
			: LOG_EVENT_PLAYER_STRONG_ATTACK
	// if (mode === MODE_ATTACK) {
	// 	maxDamage = ATTACK_VALUE
	// 	logEvent = LOG_EVENT_PLAYER_ATTACK
	// } else if (mode === MODE_STRONG_ATTACK) {
	// 	maxDamage = STRONG_ATTACK_VALUE
	// 	logEvent = LOG_EVENT_PLAYER_STRONG_ATTACK
	// }

	const damage = dealMonsterDamage(maxDamage)
	currentMonsterHealth -= damage
	writeToLog(logEvent, damage, currentMonsterHealth, currentPlayerHealth)
	endRound()
}

// Naming convention of function refers to what the function does and what it is connected to
function attackHandler() {
	attackMonster(MODE_ATTACK)
}

function strongAttackHandler() {
	attackMonster(MODE_STRONG_ATTACK)
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
	writeToLog(
		LOG_EVENT_PLAYER_HEAL,
		healValue,
		currentMonsterHealth,
		currentPlayerHealth
	)
	endRound()
}

// Attaches values from writeToLog function to Log Button
function printLogHandler() {
	let j = 0
	// while(true) = infinite loop
	// runs until j = 2
	while (j < 3) {
		console.log('------------------')
		j++
	}

	// Use case for while loop
	let randomNumbers = []
	let finished = false
	while (!finished) {
		const rndNumber = Math.random()
		randomNumbers.push(rndNumber)
		if (rndNumber > 0.5) {
			finished = true
			console.log(randomNumbers)
		}
	}
}

attackBtn.addEventListener('click', attackHandler)
strongAttackBtn.addEventListener('click', strongAttackHandler)
healBtn.addEventListener('click', healPlayerHandler)
logBtn.addEventListener('click', printLogHandler)
