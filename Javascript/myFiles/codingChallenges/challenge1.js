/***********************
 * Coding Challenge 1 - BMI
 */

 var markWeight, markHeight
 markWeight = 78
 markHeight = 6

 var johnWeight, johnHeight
 johnWeight = 84
 johnHeight = 5

 var markBmi = markWeight / (markHeight^2)

 var johnBmi = johnWeight / (johnHeight^2)

 var markIsFatter = markBmi > johnBmi

 console.log("Is Mark's BMI greater than John's?" + ' ' + markIsFatter)
 console.log(markBmi)
 console.log(johnBmi)


// User input BMI Calculator
// var yourWeight = prompt('What is your weight?')
// var yourHeight = prompt('What is your height?')

// var yourBmi = alert('Your BMI is ' + yourWeight / yourHeight ^ 2)
