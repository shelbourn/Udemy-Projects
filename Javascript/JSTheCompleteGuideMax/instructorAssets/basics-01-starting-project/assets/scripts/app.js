const defaultResult = 0
let currentResult = defaultResult // currentResult is a copy of defaultResult

currentResult = ((currentResult + 9) * 3) / 2 - 1

let calculateDescription = `(${defaultResult} + 10) * 3 / 2 - 1` // backticks with curly braces for variables within strings (Template Literal)
let errorMessage = 'An error \n' + 'occurred!'

outputResult(currentResult, errorMessage)
