const task3Element = document.getElementById('task-3')

function nameAlert1() {
	alert('Hi! My name is Matt, nice to meet you.')
}

function nameAlert2(name) {
	alert(name)
}

function nameAlert3(intro, body, end) {
	// return intro + ' ' + body + ' ' + end
	return `${intro} ${body} ${end}`
}

// Cannot return a function when it is being used for an event listener
// nameAlert1()

nameAlert2('Matt')
// task3Element.addEventListener('click', nameAlert1)
// alert(
// 	nameAlert3(
// 		'Hello!',
// 		'My name is Matt, nice to meet you.',
// 		'Have a great day!'
// 	)
// )

// Below is a best practice and more readable
const concatAlert = nameAlert3(
	'Hello!',
	'My name is Matt, nice to meet you.',
	'Have a great day!'
)

alert(concatAlert)
