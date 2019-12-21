let userArray = []
let namePrompt = prompt('What is your name?')
let jobPrompt = prompt('What is your job title?')
let agePrompt = prompt('How old are you?')

function userInput(name, job, age) {
	const userObject = {
		name: namePrompt,
		job: jobPrompt,
		age: agePrompt,
	}
	return userArray.push(userObject)
}
userInput()
console.log(userArray)
