function error(message: string): never {
  throw new Error(message)
}

function foo(x: string | number | number[]): boolean {
  if (typeof x === 'string') {
    return true
  } else if(typeof x === 'number') {
    return false
  }

  return error('Never happens')
}

console.log(foo('test'))