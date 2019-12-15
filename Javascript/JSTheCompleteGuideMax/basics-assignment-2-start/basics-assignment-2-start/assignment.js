const task3Element = document.getElementById('task-3')

function nameAlert1() {
	alert('Hi! My name is Matt, nice to meet you.')
}

function nameAlert2(name) {
	alert(name)
}

// Cannot return a function when it is being used for an event listener
// nameAlert1()
nameAlert2('Matt')

task3Element.addEventListener('click', nameAlert1)
