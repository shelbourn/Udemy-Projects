var john = {
	mass: 92,
	height: 1.5,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
		return this.bmi
	},
}
// john.calcBmi()

var mark = {
	mass: 78,
	height: 1.69,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
		return this.bmi
	},
}
// mark.calcBmi()

if (john.calcBmi() > mark.calcBmi()) {
	// Calling method when performing calculation
	console.log(
		'John is fatter than Mark with a BMI of ' +
			john.bmi +
			' while Mark has a BMI of ' +
			mark.bmi +
			'.'
	)
} else if (mark.bmi > john.bmi) {
	// Method has already been called above so no need to call it again
	console.log(
		'Mark is fatter than John with a BMI of ' +
			mark.bmi +
			' while John has a BMI of ' +
			john.bmi +
			'.'
	)
} else {
	console.log('John and Mark are equally as fat. =)')
}

console.log(john)

console.log(mark)
