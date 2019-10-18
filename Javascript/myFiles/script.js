/**************************
 * Variables and Data Types
 ***************************/

// console.log('Hello World!!!')

// var firstName = 'John'
// console.log(firstName)

// var lastName = 'Smith'
// var age = 28

// var fullAge = true
// console.log(fullAge)

// var job = console.log(job)

// job = 'teacher'
// console.log(job)

// var 3years = 3 // variables can only start with letter, $, or _
// variables cannot contain symbols in the middle of variable name
// variables cannot be named after reserved JS keywords

/************************************
 * Variable mutation and type coercion
 *************************************/

// Type Coercion
// var firstName = 'John'
// var age = 28

// console.log(firstName + ' ' + age) //string joining (type coercion)

// var job, isMarried
// job = 'Teacher'
// isMarried = false

// console.log(
// 	firstName +
// 		' ' +
// 		age +
// 		' ' +
// 		'year old ' +
// 		job +
// 		'. Is he married? ' +
// 		isMarried
// )

// Variable Mutation
// age = 'twenty eight'
// job = 'driver'

// alert(
// 	firstName +
// 		' ' +
// 		age +
// 		' ' +
// 		'year old ' +
// 		job +
// 		'. Is he married? ' +
// 		isMarried
// ) // alert pop-up message

// var lastName = prompt('What is his last name?')
// console.log(firstName + ' ' + lastName) // prompt pop-up message

/************************************
 * Basic Operators
 *************************************/

// Math Operators
// var now, yearJohn, yearMark, ageJohn, ageMark
// now = 2018
// ageJohn = 28
// ageMark = 33
// yearJohn = now - ageJohn
// yearMark = now - ageMark
// console.log(yearJohn, yearMark)

// console.log(now * 2)
// console.log(now + 2)
// console.log(now - 5)
// console.log(now / 2)

// // Logical Operators
// var johnOlder = ageJohn > ageMark
// console.log(johnOlder)

// // TypeOf Operator
// console.log(typeof johnOlder)
// console.log(typeof ageJohn)
// console.log(typeof 'Mark is older than John')

// var x // Undefined variable
// console.log(typeof x)

/************************************
 * Operator Precedence
 *************************************/

// var now = 2018
// var yearJohn = 1989
// var fullAge = 18

// // Multiple Operators
// var isFullAge = now - yearJohn >= fullAge
// console.log(isFullAge)

// // Grouping
// var ageJohn = now - yearJohn
// var ageMark = 35
// var average = (ageJohn + ageMark) / 2
// console.log(average)

// // Multiple Assignments
// var x, y
// x = y = (3 + 5) * 4 - 6 // 8 * 4 - 6 // 32 - 6 // 26
// console.log(x, y)

// // 2 + 4 +5 (left to right)
// // Assignment operator is right to left

// // More Operators
// x *= 2 // x = x * 2
// console.log(x)

// x += 10 // x = x + 10
// console.log(x)

// x ++ // x += 1, x = x+1
// console.log(x)

// x -- // x -= 1, x = x-1
// console.log(x)

/************************************
 * If/Else Statements
 *************************************/

// var firstName = 'John'
// var civilStatus = 'single'

// if (civilStatus === 'married') {
// 	console.log(firstName + ' is married!')
// } else {
// 	console.log(firstName + ' will hopefully marry soon :)')
// }

// var isMarried = true
// if (isMarried) {
// 	// isMarried is already a boolean so do not need to test for === true/false
// 	console.log(firstName + ' is married!')
// } else {
// 	console.log(firstName + ' will hopefully marry soon :)')
// }

// var markWeight, markHeight
// markWeight = 78
// markHeight = 6

// var johnWeight, johnHeight
// johnWeight = 84
// johnHeight = 5

// var markBmi = markWeight / (markHeight ^ 2)

// var johnBmi = johnWeight / (johnHeight ^ 2)

// var markIsFatter = markBmi > johnBmi

// if (markBmi > johnBmi) {
// 	console.log("Mark's BMI is higher than John's.")
// } else {
// 	console.log("John's BMI is higher than Mark's.")
// }
//  console.log("Is Mark's BMI greater than John's?" + ' ' + markIsFatter)
//  console.log(markBmi)
//  console.log(johnBmi)

/************************************
 * Boolean Logic
 *************************************/

// var firstName = 'John'
// var age = 20

// if (age < 13) {
// 	console.log(firstName + ' is a boy.')
// } else if (age >= 13 && age < 20) {
// 	// Between 13 and 20 === age >= 13 AND age < 20
// 	console.log(firstName + ' is a teenage boy.')
// } else if (age >= 20 && age < 30) {
// 	console.log(firstName + ' is a young man.')
// } else {
// 	console.log(firstName + ' is a man.')
// }

/************************************
 * The Ternary (Conditional) Operator and Switch Statements
 *************************************/

// Ternary Operator (Good for simple if/else statements)
// var firstName = 'John'
// var age = 12

// // Ternary is like an if/else statements with var + ? + :
// age >= 18
// 	? console.log(firstName + ' drinks beer.')
// 	: console.log(firstName + ' drinks juice.')

// var drink = age >= 18 ? 'beer' : 'juice'
// console.log(drink)

// // Switch statement (Good for more complex if/else statements)
// var job = 'instructor'
// switch (job) {
// 	case 'teacher': // multiple conditions per case instance
// 	case 'instructor':
// 		console.log(firstName + ' teaches kids how to code.')
// 		break
// 	case 'driver':
// 		console.log(firstName + ' drives an Uber in Lisbon')
// 		break
// 	case 'designer':
// 		console.log(firstName + ' designs beautiful websites.')
// 		break
// 	default:
// 		console.log(firstName + ' does something else.')
// }

// // var firstName = 'John'
// // var age = 20

// // if (age < 13) {
// // 	console.log(firstName + ' is a boy.')
// // } else if (age >= 13 && age < 20) {
// // 	// Between 13 and 20 === age >= 13 AND age < 20
// // 	console.log(firstName + ' is a teenage boy.')
// // } else if (age >= 20 && age < 30) {
// // 	console.log(firstName + ' is a young man.')
// // } else {
// // 	console.log(firstName + ' is a man.')
// // }

// // Converts this ^ to this...

// // Checks to see if the value is true and then executes code.
// switch (true) {
// 	case age < 13:
// 		console.log(firstName + ' is a boy.')
// 		break
// 	case age >= 13 && age < 20:
// 		console.log(firstName + ' is a teenage boy.')
// 		break
// 	case age >= 20 && age < 30:
// 		console.log(firstName + ' is a young man.')
// 		break
// 	default:
// 		console.log(firstName + ' is a man.')
// }

/************************************
 * Truthy and Falsy Values and Equality Operators
 *************************************/

// falsy values: undefined, null, 0, '', NaN

// truthy values: NOT falsy values

// var height

// height = 23
// // checks whether height is defined or === 0
// if (height || height === 0) {
// 	console.log('Variable is defined.')
// } else {
// 	console.log('Variable has NOT been defined.')
// }

// // Equality operators
// // String '23' converted to number 23 for comparison with ==
// if (height == '23') {
// 	console.log('The == operator does type coercion!')
// }

// Will return false because '23 does not match the number 23
// if (height === '23') {
// 	console.log('The === does not do type coercion.')
// }

/************************************
 * Functions
 *************************************/

// Functions with return statements save the results for later use
// function calculateAge(birthYear) {
// 	return 2018 - birthYear
// }

// var ageJohn = calculateAge(1990)
// var ageMike = calculateAge(1948)
// var ageJane = calculateAge(1969)

// console.log(ageJohn, ageMike, ageJane)

// // Functions do not need return statments
// function yearsUntilRetirement(year, firstName) {
// 	var age = calculateAge(year)
// 	var retirement = 65 - age
// 	if (retirement > 0) {
// 		console.log(firstName + ' retires in ' + retirement + ' years.')
// 	} else {
// 		console.log(firstName + ' is already retired.')
// 	}
// }

// yearsUntilRetirement(1946, 'John')
// yearsUntilRetirement(1976, 'Mike')
// yearsUntilRetirement(1965, 'Dude')

/************************************
 * Function Statements and Expressions
 *************************************/

// Function Declaration
// function whatDoYouDo(job, firstName) {}

// Function Expressions
// Anything that produces a single result in JS is an expression
// Statements in JS perform actions (Function Declarations, While loop, if-else, etc.)
// var whatDoYouDo = function(job, firstName) {
// 	switch (job) {
// 		case 'teacher':
// 			return firstName + ' teaches kids how to code.'
// 		case 'driver':
// 			return firstName + ' drives a cab in Lisbon.'
// 		case 'designer':
// 			return firstName + ' designs beautiful websites.'
// 		default:
// 			return firstName + ' does something else.'
// 	}
// }

// console.log(whatDoYouDo('teacher', 'Matt'))
// console.log(whatDoYouDo('designer', 'Mofo'))
// console.log(whatDoYouDo('driver', 'Bitch'))
// console.log(whatDoYouDo('retired', 'Nick'))

/************************************
 * Arrays
 *************************************/

// Initialize new array
// var names = ['John', 'Mark', 'Jane']
// var years = new Array(1990, 1968, 1948)

// console.log(names)
// console.log(names.length)

// // Mutate array data
// // Changing record at index 1
// names[1] = 'Ben'
// console.log(names)

// // Adding record at index 5
// names[5] = 'Mary'
// console.log(names)

// // Adds record after last index in array
// names[names.length] = 'Matt'
// console.log(names)

// // Arrays with different data types
// var john = ['John', 'Smith', 1990, 'designer', false]

// // Push Method (funtion) - adds element to end of array
// john.push('blue')
// // Unshift adds element to beginning of array
// john.unshift('Mr. ')
// console.log(john)

// // Pop removes last element in array
// john.pop()
// console.log(john)

// // Shift removes first element of array
// john.shift()
// console.log(john)

// // indexOf returns the index of the passed argument (element)
// console.log(john.indexOf(1990))
// // indexOf returns (-1) if there is no valid element in array

// // Tests for John's job title and returns a string
// var isDesigner =
// 	john.indexOf('designer') === -1
// 		? 'John is not a designer.'
// 		: 'John is a designer.'
// console.log(isDesigner)

/************************************
 * Objects and Properties --> IMPORTANT
 *************************************/

// Objects use key-value pairs
// With objects, order does not matter
// With arrays, order does matter

// Object Literal Method
// var john = {
// 	firstName: 'John', // Key-value pair
// 	lastName: 'Smith',
// 	birthYear: 1990,
// 	family: ['Jane', 'Mark', 'Bob', 'Emily'],
// 	job: 'teacher',
// 	isMarried: false,
// }

// console.log(john.firstName) // firstName = key [dot notation]
// console.log(john['lastName']) // bracket notation -- key MUST be in 'QUOTES'
// var x = 'birthYear' // assigning key to variable with key in 'QUOTES'
// console.log(john[x])

// // Mutating data within objects
// john.job = 'designer'
// john['isMarried'] = true
// console.log(john)

// // Create using 'new Object' Syntax
// var jane = new Object()
// jane.firstName = 'Jane'
// jane.birthYear = 1969
// jane['lastName'] = 'Smith'
// console.log(jane)

/************************************
 * Objects and Methods --> IMPORTANT
 *************************************/

// Functions attached to objects are called 'Methods'
// Arrarys are also objects
// Only objects can have methods

// Object Methods
// var john = {
// 	firstName: 'John', // Key-value pair
// 	lastName: 'Smith',
// 	birthYear: 1992,
// 	family: ['Jane', 'Mark', 'Bob', 'Emily'],
// 	job: 'teacher',
// 	isMarried: false,
// 	calcAge: function() {
// 		this.age = 2019 - this.birthYear // Adds 'age' to object via function
// 		// return 2019 - this.birthYear // 'this' refers to 'this object'
// 	},
// }
// john.calcAge() // Calling the calcAge function
// // john.age = john.calcAge() // Adds 'age' property to 'John' object
// console.log(john.calcAge())
// console.log(john)

/************************************
 * Loops and Iteration (Control Structure)
 *************************************/

// For Loop
for (var i = 0; i < 10; i++) {
	console.log(i)
}

// i = 0, 0 < 10 is true, log i to console, i++
// ...
// ...
// i = 10, 10 < 10 is false, loop exits

/*
for (var i = 1; i <= 20; i += 2) {
	// add 2 to i after each iteration
	console.log(i)
}

var john = ['John', 'Smith', 1990, 'designer', false, 'blue']

for (var i = 0; i < john.length; i++) {
	// USE .length PROPERTY!!!
	console.log(john[i])
}

// While Loop
var i = 0
while (i < john.length) {
	console.log(john[i])
	i++
}
*/

// Continue Statment
var john = ['John', 'Smith', 1990, 'designer', false, 'blue']

for (var i = 0; i < john.length; i++) {
	if (typeof john[i] !== 'string') continue
	console.log(john[i])
}

// Break Statement
for (var i = 0; i < john.length; i++) {
	if (typeof john[i] !== 'string') break
	console.log(john[i])
}

/* Continue statement checks a condition and if it passes false then it continues to the next iteration. With break statements, if a condition is met then the entire loop exits. */
