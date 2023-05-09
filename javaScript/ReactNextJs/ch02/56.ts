interface User {
  name: string
  social?: {
    facebook: boolean
    twitter: boolean
  }
}

function processUser(user?: User) {
  let s = user!.name
}