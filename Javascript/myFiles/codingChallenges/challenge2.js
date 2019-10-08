// Challenge 2
var johnTeamAvg = (89 + 121 + 103) / 3
var mikeTeamAvg = (89 + 121 + 103) / 3
var maryTeamAvg = (89 + 120 + 103) / 3
console.log(johnTeamAvg, mikeTeamAvg, maryTeamAvg)

switch (true) {
	case johnTeamAvg > mikeTeamAvg && johnTeamAvg > maryTeamAvg:
		console.log(
			"John's team is the winna winna chicken dinna with an average score of " +
				johnTeamAvg +
				' points!'
		)
		break
	case mikeTeamAvg > johnTeamAvg && mikeTeamAvg > maryTeamAvg:
		console.log(
			"Mike's team is the winna winna chicken dinna with an average score of " +
				mikeTeamAvg +
				' points!'
		)
	case maryTeamAvg > johnTeamAvg && maryTeamAvg > mikeTeamAvg:
		console.log(
			"Mary's teams is the winna winna chicken dinna with an average score of " +
				maryTeamAvg +
				' points!'
		)
		break
	default:
		console.log(
			"John, Mary, and Mike's team are ready for a rematch...TO THE DEATH with all teams having an average score of " +
				johnTeamAvg +
				' points!'
		)
}

// Cannot use > (var && var) --> does not compute correctly

// Alternate Method
// if (johnTeamAvg > (mikeTeamAvg && maryTeamAvg)) {
// 	console.log('John is cool with ' + johnTeamAvg + ' points!')
// } else if (mikeTeamAvg > (johnTeamAvg && maryTeamAvg)) {
// 	console.log('Mike is cool with ' + mikeTeamAvg + ' points!')
// } else if (maryTeamAvg > (johnTeamAvg && mikeTeamAvg)) {
// 	console.log('Mary is cool with ' + maryTeamAvg + ' points!')
// } else {
// 	console.log('There is a three-way draw. Fight to the death!!!!!')
// }
