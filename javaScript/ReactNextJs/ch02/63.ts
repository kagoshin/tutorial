const x: unknown = 123
const y: unknown = 'Hello'

// console.log(x.toFixed(1))
// console.log(y.toLowerCase())

if (typeof x === 'number') {
  console.log(x.toFixed(1))
}

if (typeof y === 'string') {
  console.log(y.toLowerCase())
}
