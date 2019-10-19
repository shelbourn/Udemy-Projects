var johnDining = {
	bills: [124, 48, 268, 180, 42],
	tips: [],
	totalBill: [],
	calcTip: function() {
		for (i = 0; i < this.bills.length; i++) {
			if (this.bills[i] < 50) {
				tip = this.bills[i] * 0.2
				// this.tips.push(tip)
			} else if (this.bills[i] >= 50 && this.bills[i] <= 200) {
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

// var markBills = [77, 375, 110, 45]
// var markTips = []
// var markDining = function() {
// 	for (i = 0; i < markBills.length; i++) {
// 		if (markBills[i] < 100) {
// 			markBills[i] * 0.2
// 		} else if (markBills[i] >= 100 && markbills[i] <= 300) {
// 			markBills[i] * 0.1
// 		} else {
// 			markBills[i] * 0.25
// 		}
// 	}
// 	markTips.push(markDining())
// }
// console.log(markTips)
// console.log(markBills)

var markBills = [77, 375, 110, 45]
var sumTip = 0

var markTip = function() {
	for (i = 0; i < markBills.length; i++) {
		sumTip += markBills[i]
	}
	return sumTip
}
console.log(markTip())

var avgTip = function() {}
