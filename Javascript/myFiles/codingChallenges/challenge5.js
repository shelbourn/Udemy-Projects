var johnDining = {
	bills: [124, 48, 268, 180, 42],
	tips: [],
	totalBill: [],
	calcTip: function() {
		for (i = 0; i < this.bills.length; i++) {
			if (this.bills[i] < 50) {
				tip = this.bills[i] * 0.2
				// this.tips.push(tip)
			} else if (this.bills[i] >= 50 || this.bills[i] <= 200) {
				tip = this.bills[i] * 0.15
				// this.tips.push(tip)
			} else {
				tip = this.bills[i] * 0.1
				// this.tips.push(tip)
			}
			this.tips.push(tip)
			this.totalBill.push(this.bills[i] + this.tips[i])
		}
	},
}
console.log(johnDining, johnDining.calcTip())

var markDining = function
