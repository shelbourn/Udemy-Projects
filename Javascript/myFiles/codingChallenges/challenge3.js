// My Solution
// function calcTip(bill) {
// 	if (bill < 50) {
// 		return bill * 0.2
// 	} else if (bill >= 50 && bill < 200) {
// 		return bill * 0.15
// 	} else {
// 		return bill * 0.1
// 	}
// }

// var bill1 = 124
// var bill2 = 48
// var bill3 = 268

// var tip1 = calcTip(bill1)
// var tip2 = calcTip(bill2)
// var tip3 = calcTip(bill3)

// var tips = [tip1, tip2, tip3]
// var totalBills = [bill1 + tip1, bill2 + tip2, bill3 + tip3]
// console.log(tips, totalBills)

// Instructor's Solution
function calcTip(bill) {
	var percentage
	if (bill < 50) percentage = 0.2
	else if (bill >= 50 && bill < 200) {
		percentage = 0.15
	} else {
		percentage = 0.1
	}
	return percentage * bill
}

var bills = [124, 48, 268]

// Calculating tip based on bills array using function calcTip at specified array index
var tips = [calcTip(bills[0]), calcTip(bills[1]), calcTip(bills[2])]
var totalBill = [bills[0] + tips[0], bills[1] + tips[1], bills[2] + tips[2]]
console.log(bills)
console.log(tips)
console.log(totalBill)
