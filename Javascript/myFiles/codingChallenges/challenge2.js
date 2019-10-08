// Challenge 2
var johnTeamAvg = (89 + 120 + 103) / 3
var mikeTeamAvg = (116 + 94 + 123) / 3

switch (true) {
	case johnTeamAvg > mikeTeamAvg:
		console.log("John's team is the winna winna chicken dinna!")
		break
	case mikeTeamAvg > johnTeamAvg:
		console.log("Mike's team is the winna winna chicken dinna!")
		break
	case mikeTeamAvg === johnTeamAvg:
		console.log(
			"John and Mike's team are ready for a rematch...TO THE DEATH!!!"
		)
}
