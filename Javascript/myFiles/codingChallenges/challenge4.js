var john = {
	mass: 90,
	height: 2,
	johnBMI: function() {
		this.mass / (this.height ^ 2)
	},
}
var mark = {
	mass: 100,
	height: 2.5,
	markBMI: function() {
		this.mass / (this.height ^ 2)
	},
}

john.johnBMI()
mark.markBMI()
console.log(john.johnBMI(), mark.markBMI())
