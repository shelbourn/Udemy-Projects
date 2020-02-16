// Primitive Values

/*****
 * const
 * let
 * let
 * null
 * undefined
 * boolean
 * symbol
 */

// Reference Values

/*******
 * arrays
 * objects
 * etc
 */

// Primitive Value Properties
let name = 'Matt'
let newName = 'Matt'

name === newName //Returns True

let anotherNewName = name //Copies value of name to anotherNewName

// Reference Value Properties
const user = { age: 30 }
const newUser = user //References the address of the user object

newUser.age = 32 //Also updates the user object

anotherNewUser = { ...user } //Spread Operator: Copies the key/value pairs from user into new object anotherNewUser

const user2 = { age: 30 }

user === user2 //Returns false because these are different objects with difference reference addresses

// All of these properties apply to arrays also
