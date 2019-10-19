var markBills = [77, 375, 110, 45]
var markTips = []
var markDining = function() {
	for (i = 0; i < markBills.length; i++) {
		if (markBills[i] < 100) {
			markBills[i] * 0.2
		} else if (markBills[i] >= 100 && markbills[i] <= 300) {
			markBills[i] * 0.1
		} else {
			markBills[i] * 0.25
		}
	}
	markTips.push(markDining())
}
console.log(markTips)
console.log(markBills)

var sumTip = 0

var markTip = function() {
	for (i = 0; i < markBills.length; i++) {
		sumTip += markBills[i]
	}
	return sumTip
}
console.log(markTip())

var avgTip = function() {}
