// Question 4: Find all type 'cat' and add up the ages
const data = [
	{
		name: 'Butters',
		age: 3,
		type: 'dog',
	},
	{
		name: 'Lizzy',
		age: 6,
		type: 'dog',
	},
	{
		name: 'Red',
		age: 1,
		type: 'cat',
	},
	{
		name: 'Joey',
		age: 3,
		type: 'dog',
	},
	{
		name: 'Charlie',
		age: 7,
		type: 'cat',
	},
]

var countCats = 0

var result = data.filter(obj => {
	return obj.b === 'cat'
})

console.log(result)
