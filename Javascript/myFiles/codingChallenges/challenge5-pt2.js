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