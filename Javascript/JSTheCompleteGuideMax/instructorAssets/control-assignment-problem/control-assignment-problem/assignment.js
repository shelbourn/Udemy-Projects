const randomNumber = Math.random() // produces random number between 0 (including) and 1 (excluding)
const randomNumber2 = Math.random()

//Task 1
if (randomNumber > 0.7) {
	alert('Uh oh! The random number is greated than 0.7!')
}

// Task 2
const myArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

// Loop 1
for (let i = 0; i < myArray.length; i++) {
	console.log(myArray[i])
}

// Loop 2
for (const element of myArray) {
	console.log(element)
}

// Loop 3 (manually recreating for loop with while loop)
let counter = 0
while (counter < myArray.length) {
	console.log(myArray[counter])
	counter++
}

// Task 3
for (let j = myArray.length - 1; j >= 0; j--) {
	console.log(myArray[j])
}

// Task 4
// I console logged the random number values to verify code is working
if (randomNumber > 0.7 && randomNumber2 > 0.7) {
	console.log(
		`randomNumer is ${randomNumber} & randomNumber2 is ${randomNumber2}`
	)
	alert('Both random numbers are greater than 0.7')
} else if (randomNumber <= 0.2 || randomNumber2 <= 0.2) {
	console.log(
		`randomNumer is ${randomNumber} & randomNumber2 is ${randomNumber2}`
	)
	alert('One of the two random numbers is not greater than 0.2')
}

// Alternate solution to task 4
if (
	(randomNumber > 0.7 && randomNumber2 > 0.7) ||
	randomNumber <= 0.2 ||
	randomNumber2 <= 0.2
) {
	alert(
		'Both randomNumber & randomNumber2 are greater than 0.7 or either randomNumber or randomNumber2 are less than 0.2.'
	)
}
