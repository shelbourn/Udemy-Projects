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

let battleLog = []
let lastLoggedEntry

// Try/Catch method for error handling
// Can have try without catch
// Finally statement will execute whether there was an error or not
// Finally statement is often used if there is no available fallback code
// Finally is used to perform cleanup work (reset variables, delete data, etc)
// Try/Catch/Finally are generally used for errors that we can't control
// We SHOULD NOT use Try/Catch/Finally statements for ALL CODE
let chosenMaxLife

// Tries code to see if it works
try {
	chosenMaxLife = getMaxLifeValues()
	// React upon an error that is thrown
	// error is generally used in catch syntax (not necessary though)
	// In this case error refers to function expression above
} catch (error) {
	// if	chosenMaxLife = getMaxLifeValues() fails
	// then below code is executed as a fallback
	console.log(error)
	chosenMaxLife = 100
	alert('You entered an error, a default health value of 100 was used.')
	// throw error
} finally {
}

function getMaxLifeValues() {
	const enteredValue = prompt('Maximum life for you and the monster', '100')
	let parsedValue = parseInt(enteredValue) // Or +enteredValue
	if (isNaN(parsedValue) || parsedValue <= 0) {
		throw { message: 'Invalid User input, not a number.' }
	}
	return parsedValue
}

// Sets default health if user-entered value is not applicable

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
	for (let i = 0; i < 3; i++) {
		console.log('------------')
	}

	let j = 0
	do {
		console.log('Outer', j)
		for (let k = 0; k < 5; k++) {
			console.log('Inner', k)
		}
		j++
	} while (j < 3)
	// for (let i = 10; i > 0;) {
	//   i--;
	//   console.log(i);
	// }
	// for (let i = 0; i < battleLog.length; i++) {
	//   console.log(battleLog[i]);
	// }

	let i = 0
	for (const logEntry of battleLog) {
		if ((!lastLoggedEntry && lastLoggedEntry !== 0) || lastLoggedEntry < i) {
			console.log(`#${i}`)
			for (const key in logEntry) {
				console.log(`${key} => ${logEntry[key]}`)
			}
			lastLoggedEntry = i
			break
		}
		i++
	}
}

attackBtn.addEventListener('click', attackHandler)
strongAttackBtn.addEventListener('click', strongAttackHandler)
healBtn.addEventListener('click', healPlayerHandler)
logBtn.addEventListener('click', printLogHandler)
