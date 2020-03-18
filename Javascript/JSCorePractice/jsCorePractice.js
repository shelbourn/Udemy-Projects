// JS METHODS

/**************************
 * List to be Practiced
 *
 * for each...in
 * .map()
 * .filter()
 * .reduce()
 * .split()
 * setTimeout()
 * clearTimeout()
 * setInterval()
 * clearInterval()
 * .innerHTML
 */

/******* .innerHTML - Retrieves or modifies the contents of an HTML element */

// Retrieving HTML of element - assigns value of HTML element with ID "RetrieveTest" to retrieveHTML
let retrieveHTML = document.getElementById('RetrieveTest').innerHTML

console.log(retrieveHTML)

// Changing HTML of element - modified the content of HTML element with ID "ChangeTest"

document.getElementById('ChangeTest').innerHTML =
	'If you are seeing this then .innerHTML has successfully modified the content of this HTML element'
