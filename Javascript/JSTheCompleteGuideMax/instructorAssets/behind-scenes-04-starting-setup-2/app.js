function getName() {
	return prompt('Your age: ', '')
}

function greet() {
	const userName = getName()
	console.log('Hello ' + userName)
}

greet()
