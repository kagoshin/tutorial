interface User {
  name: string;
  age: number;
  email: string;
}

type UserKey = keyof User

const key1: UserKey = 'name'
// const key2: UserKey = 'phone'

console.log(key1)

function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key]
}

const user: User = {
  name: 'Takuya',
  age: 36,
  email: 'test@example.com'
}

const userName = getProperty(user, 'name')

console.log(userName)

// const userGender = getProperty(user, 'gender')