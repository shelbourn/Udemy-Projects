var john = {
	mass: 90,
	height: 2,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
john.bmi()
john.bmi = john.calcBmi()
var mark = {
	mass: 100,
	height: 2.5,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
mark.bmi()
mark.bmi = mark.calcBmi()
