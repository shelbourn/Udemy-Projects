var dining = {
	bills: [124, 48, 268, 180, 42],
	calcTip: function() {
		for (i = bills.length - 1; i < bills.length; i++) {
			if (bills[i] < 50) {
				this.tip = bills[i] * 0.2
			} else if (bills[i] >= 50 || bills[i] <= 200) {
				tip = bills[i] * 0.15
			} else {
				tip = bills[i] * 0.1
			}
		}
	},
}
