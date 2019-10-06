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
var firstName = 'John'
var age = 12

age >= 18 // Ternary is like an if/else statements with var + ? + :
	? console.log(firstName + ' drinks beer.')
	: console.log(firstName + ' drinks juice.')

var drink = age >= 18 ? 'beer' : 'juice'
console.log(drink)

// Switch statement (Good for more complex if/else statements)
var job = 'instructor'
switch (job) {
	case 'teacher': // multiple conditions per case instance
	case 'instructor':
		console.log(firstName + ' teaches kids how to code.')
		break
	case 'driver':
		console.log(firstName + ' drives an Uber in Lisbon')
		break
	case 'designer':
		console.log(firstName + ' designs beautiful websites.')
		break
	default:
		console.log(firstName + ' does something else.')
}

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

// Checks to see if the value is true and then executes code.
switch (true) {
	case age < 13:
		console.log(firstName + ' is a boy.')
		break
	case age >= 13 && age < 20:
		console.log(firstName + ' is a teenage boy.')
		break
	case age >= 20 && age < 30:
		console.log(firstName + ' is a young man.')
	default:
		console.log(firstName + ' is a man.')
}
