/*************************
 * Boolean Tricks
 *
 * ! (single bang operator) converts a truthy value into a real false (boolean) value
 * 11 (double bang operator) converts a truthy value into a real true (boolean) value
 * !!"" === false (not falsey)
 * !!1 === true (not truthy)
 *
 * Default value assignment via OR operator
 *
 * const name = someInput || 'Max'
 * if someInput is empty (unassigned) then it is falsey
 * 'Max' is a non-empty string so it is truthy
 * OR (||) returns the first truthy value without returning a true Boolean
 *
 * Use value if condition is true via AND operator
 *
 * const name = isLoggedIn && 'Max'
 * if isLoggedIn is true (truthy) then name is set to 'Max'
 * Otherwise name is set to false
 * && returns the last value in the expression
 *
 */

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

const enteredValue = prompt('Maximum life for you and the monster', '100')

// Prompts user to enter health
let chosenMaxLife = parseInt(enteredValue) // Or +enteredValue
let battleLog = []

if (isNaN(chosenMaxLife) || chosenMaxLife <= 0) {
	chosenMaxLife = 100
}

let currentMonsterHealth = chosenMaxLife
let currentPlayerHealth = chosenMaxLife
let hasBonusLife = true

adjustHealthBars(chosenMaxLife)

function writeToLog(ev, val, monsterHealth, playerHealth) {
	// One Method for pushing log entries
	let logEntry = {
		event: ev,
		value: val,
		finalMonsterHealth: monsterHealth,
		finalPlayerHealth: playerHealth,
	}
	if (ev === LOG_EVENT_PLAYER_ATTACK) {
		logEntry.target = 'MONSTER'

		// Second method for pushing log entries
	} else if (ev === LOG_EVENT_PLAYER_STRONG_ATTACK) {
		logEntry = {
			event: ev,
			value: val,
			target: 'MONSTER',
			finalMonsterHealth: monsterHealth,
			finalPlayerHealth: playerHealth,
		}
	} else if (ev === LOG_EVENT_MONSTER_ATTACK) {
		logEntry = {
			event: ev,
			value: val,
			target: 'PLAYER',
			finalMonsterHealth: monsterHealth,
			finalPlayerHealth: playerHealth,
		}
	} else if (ev === LOG_EVENT_PLAYER_HEAL) {
		logEntry = {
			event: ev,
			value: val,
			target: 'PLAYER',
			finalMonsterHealth: monsterHealth,
			finalPlayerHealth: playerHealth,
		}
	} else if (ev === LOG_EVENT_GAME_OVER) {
		logEntry = {
			event: ev,
			value: val,
			finalMonsterHealth: monsterHealth,
			finalPlayerHealth: playerHealth,
		}
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

function printLogHandler() {
	console.log(battleLog)
}

attackBtn.addEventListener('click', attackHandler)
strongAttackBtn.addEventListener('click', strongAttackHandler)
healBtn.addEventListener('click', healPlayerHandler)
logBtn.addEventListener('click', printLogHandler)
