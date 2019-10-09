function calcTip(bill) {
	if (bill < 50) {
		return bill * 0.2
	} else if (bill >= 50 && bill < 200) {
		return bill * 0.15
	} else {
		return bill * 0.1
	}
}

var bill1 = 124
var bill2 = 48
var bill3 = 268

var tips = [tip1, tip2, tip3]
var totalBills = [bill1 + tip1, bill2 + tip2, bill3 + tip3]
console.log(tips, totalBills)
