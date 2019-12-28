/*****************************
 * Logical Operators - A Quick Summary
 * 
 * As a reference which you can come back to (or print out), here's a quick summary of how logical operators and comparison operators behave in JavaScript:

const userName = 'Max';
const altName = '';
console.log(userName === 'Max'); // generates and prints a boolean => true
console.log(userName); // wasn't touched, still is a string => 'Max'
 
console.log(userName || null); // userName is truthy and therefore returned by || => 'Max'
console.log(altName || 'Max'); // altName is falsy (empty string), hence 'Max' is returned => 'Max'
console.log(altName || ''); // both altName and '' are falsy but if the first operand is falsy, the second one is always returned => ''
console.log(altName || null || 'Anna'); // altName and null are falsy, 'Anna' is returned => 'Anna'
 
console.log(userName && 'Anna'); // userName is truthy, hence second (!) value is returned => 'Anna'
console.log(altName && 'Anna'); // altName is falsy, hence first value is returned => ''
console.log(userName && ''); // userName is truthy, hence second value is returned => ''
Always keep in mind: NO operator (neither ===, > etc. nor && or ||) changes the variable you might be using in the comparison. In the above examples, the values stored in userName and altName are NEVER changed.

===, > etc. just generate new boolean values which are used in the comparison. || and && generate NO booleans, they just treat the values before and after them as conditions (which therefore need to yield boolean values and are coerced to booleans if required).

Because of the above-described behaviors, you often use || in JavaScript to assign default/ fallback values to variables/ constants:

const enteredValue = ''; // let's assume this is set based on some input provided by the user, therefore it might be an empty string
 
const userName = enteredValue || 'PLACEHOLDER'; // will assign 'PLACEHOLDER' if enteredValue is an empty string
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
