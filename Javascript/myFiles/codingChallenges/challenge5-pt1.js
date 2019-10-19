var johnDining = {
	bills: [124, 48, 268, 180, 42],
	fullname: 'John Smith',
	calcTip: function() {
		this.tips = []
		this.totalBill = []
		for (var i = 0; i < this.bills.length; i++) {
			// Determine percentange based on tipping rules

			var percentange

			if (this.bills[i] < 50) {
			} else if (this.bills[i] >= 50 && this.bills[i] <= 200) {
				tip = this.bills[i] * 0.15
			} else {
				tip = this.bills[i] * 0.1
			}

			// Add results to the corresponding arrarys
			this.tips.push(tip)
			this.totalBill.push(this.bills[i] + this.tips[i])
		}
	},
}
console.log(johnDining, johnDining.calcTip())
