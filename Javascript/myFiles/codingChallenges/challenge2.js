// Challenge 2
var johnTeamAvg = (89 + 120 + 103) / 3
var mikeTeamAvg = (89 + 120 + 103) / 3
var maryTeamAvg = (97 + 134 + 105) / 3

switch (true) {
	case johnTeamAvg > (mikeTeamAvg && maryTeamAvg):
		console.log(
			"John's team is the winna winna chicken dinna with an average score of " +
				johnTeamAvg +
				' points!'
		)
		break
	case mikeTeamAvg > (johnTeamAvg && maryTeamAvg):
		console.log(
			"Mike's team is the winna winna chicken dinna with an average score of " +
				mikeTeamAvg +
				' points!'
		)
		break
	case (mikeTeamAvg === johnTeamAvg) === maryTeamAvg:
		console.log(
			"John, Mary, and Mike's team are ready for a rematch...TO THE DEATH with all teams having an average score of " +
				johnTeamAvg +
				' points!'
		)
}
