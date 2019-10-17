var john = {
	mass: 90,
	height: 2,
	BMI: function() {
		johnBMI = this.mass / (this.height ^ 2)
	},
}
john.BMI()
var mark = {
	mass: 100,
	height: 2.5,
	BMI: function() {
		markBMI = this.mass / (this.height ^ 2)
	},
}
mark.BMI()
console.log(john.BMI(), mark.BMI())
