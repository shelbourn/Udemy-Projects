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

var now = 2018
var yearJohn = 1989
var fullAge = 18

// Multiple Operators
var isFullAge = now - yearJohn >= fullAge
console.log(isFullAge)

// Grouping
var ageJohn = now - yearJohn
var ageMark = 35
var average = (ageJohn + ageMark) / 2
console.log(average)

// Multiple Assignments
var x, y
x = y = (3 + 5) * 4 - 6 // 8 * 4 - 6 // 32 - 6 // 26
console.log(x, y)

// 2 + 4 +5 (left to right)
// Assignment operator is right to left

// More Operators
x *= 2 // x = x * 2
console.log(x)

x += 10 // x = x + 10
console.log(x)

x ++ // x += 1, x = x+1
console.log(x)

x -- // x -= 1, x = x-1
console.log(x)