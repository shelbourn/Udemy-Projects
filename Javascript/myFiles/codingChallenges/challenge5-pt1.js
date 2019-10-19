var johnDining = {
	bills: [124, 48, 268, 180, 42],
	fullname: 'John Smith',
	calcTip: function() {
		this.tips = []
		this.totalBill = []
		for (var i = 0; i < this.bills.length; i++) {
			// Determine percentange based on tipping rules

			var percentange
			var bill = this.bills[i]

			if (bill < 50) {
				percentage = 0.2
			} else if (bill >= 50 && bill < 200) {
				percentange = 0.15
			} else {
				percentange = 0.1
			}

			// Add results to the corresponding arrarys
			this.tips[i] = bill * percentange
			this.totalBill[i] = bill + bill * percentange
		}
	},
}
johnDining.calcTip()
console.log(johnDining)
