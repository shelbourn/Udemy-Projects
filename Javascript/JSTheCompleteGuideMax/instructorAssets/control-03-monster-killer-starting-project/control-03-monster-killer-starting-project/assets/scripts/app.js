const ATTACK_VALUE = 10 // Global value. Uppercase characters separated by underscore for hard-coded values related to gameplay
const STRONG_ATTACK_VALUE = 17
const MONSTER_ATTACK_VALUE = 14

let chosenMaxLife = 100 // For player and monster
let currentMonsterHealth = chosenMaxLife
let currentPlayerHealth = chosenMaxLife

adjustHealthBars(chosenMaxLife)

// Naming convention of function refers to what the function does and what it is connected to
function attackHandler() {
	const damage = dealMonsterDamage(ATTACK_VALUE)
	currentMonsterHealth -= damage
	const playerDamage = dealPlayerDamage(MONSTER_ATTACK_VALUE)
	currentPlayerHealth -= playerDamage
	if (currentMonsterHealth <= 0 && currentPlayerHealth > 0) {
		alert('You won!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth > 0) {
		alert('You lost!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth <= 0) {
		alert('You have a draw!')
	}
}

function strongAttackHandler() {
	const damage = dealMonsterDamage(STRONG_ATTACK_VALUE)
	currentMonsterHealth -= damage
	const playerDamage = dealPlayerDamage(MONSTER_ATTACK_VALUE)
	currentPlayerHealth -= playerDamage
	if (currentMonsterHealth <= 0 && currentPlayerHealth > 0) {
		alert('You won!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth > 0) {
		alert('You lost!')
	} else if (currentPlayerHealth <= 0 && currentMonsterHealth <= 0) {
		alert('You have a draw!')
	}
}

attackBtn.addEventListener('click', attackHandler)
strongAttackBtn.addEventListener('click', strongAttackHandler)
