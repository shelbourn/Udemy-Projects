const ATTACK_VALUE = 10 // Global value. Uppercase characters separated by underscore for hard-coded values related to gameplay

let chosenMaxLife = 100 // For player and monster
let currentMonsterHealth = chosenMaxLife
let currentPlayerHealth = chosenMaxLife

adjustHealthBars(chosenMaxLife)

// Naming convention of function refers to what the function does and what it is connected to
function attackHandler() {
	const damage = dealMonsterDamange(ATTACK_VALUE)
	currentMonsterHealth -= damage
}

attackBtn.addEventListener('click', attackHandler)
