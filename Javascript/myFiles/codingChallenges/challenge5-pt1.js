// John's Dining Expenses
var johnDining = {
	bills: [124, 48, 268, 180, 42],
	fullname: 'John Smith',
	calcTip: function() {
		this.tips = []
		this.totalBill = []
		for (var i = 0; i < this.bills.length; i++) {
			// Determine percentange based on tipping rules

			var percentage
			var bill = this.bills[i]

			if (bill < 50) {
				percentage = 0.2
			} else if (bill >= 50 && bill < 200) {
				percentage = 0.15
			} else {
				percentage = 0.1
			}

			// Add results to the corresponding arrarys
			this.tips[i] = bill * percentage
			this.totalBill[i] = bill + bill * percentage
		}
	},
}
johnDining.calcTip()
console.log(johnDining)

// Mark's Dining Expenses
var markDining = {
	bills: [77, 475, 110, 45],
	fullname: 'Mark Miller',
	calcTip: function() {
		this.tips = []
		this.totalBill = []
		for (var i = 0; i < this.bills.length; i++) {
			// Determine percentange based on tipping rules

			var percentage
			var bill = this.bills[i]

			if (bill < 100) {
				percentage = 0.2
			} else if (bill >= 100 && bill < 300) {
				percentage = 0.1
			} else {
				percentage = 0.25
			}

			// Add results to the corresponding arrarys
			this.tips[i] = bill * percentage
			this.totalBill[i] = bill + bill * percentage
		}
	},
}
johnDining.calcTip()
markDining.calcTip()
console.log(johnDining, markDining)
