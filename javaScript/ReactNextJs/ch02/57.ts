function addOne(value: number | string) {
  if (typeof value === 'string') {
    return Number(value) + 1
  }
  return value + 1
}

console.log(addOne(10))
console.log(addOne('20'))