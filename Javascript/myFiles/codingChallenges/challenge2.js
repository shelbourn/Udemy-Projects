// Challenge 2
var johnTeamAvg = (89 + 120 + 103) / 3
var mikeTeamAvg = (89 + 120 + 103) / 3

switch (true) {
	case johnTeamAvg > mikeTeamAvg:
		console.log(
			"John's team is the winna winna chicken dinna with an average score of " +
				johnTeamAvg +
				' points!'
		)
		break
	case mikeTeamAvg > johnTeamAvg:
		console.log(
			"Mike's team is the winna winna chicken dinna with an average score of " +
				mikeTeamAvg +
				' points!'
		)
		break
	case mikeTeamAvg === johnTeamAvg:
		console.log(
			"John and Mike's team are ready for a rematch...TO THE DEATH with both teams having an average score of " +
				johnTeamAvg +
				' points!'
		)
}
