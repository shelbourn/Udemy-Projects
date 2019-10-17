var john = {
	mass: 23,
	height: 5,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
john.calcBmi()

var mark = {
	mass: 25,
	height: 7.5,
	calcBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
mark.calcBmi()

john.bmi = john.calcBmi()
console.log(john)

mark.bmi = mark.calcBmi()
console.log(mark)
