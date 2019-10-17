var john = {
	mass: 90,
	height: 2,
	johnBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
var mark = {
	mass: 100,
	height: 2.5,
	markBmi: function() {
		this.bmi = this.mass / (this.height ^ 2)
	},
}
console.log(john.johnBmi(), mark.markBmi())
console.log(john)
