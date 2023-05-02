interface IUser {
  name: string;
  age: number;
  sayHello: () => string;
}

class User implements IUser {
  name: string;
  age: number;

  constructor() {
    this.name = ''
    this.age = 0
  }

  sayHello(): string {
    return `こんにちは、私は${this.name}、${this.age}歳です。`
  }
}

const user = new User()
user.name = 'Takuya'
user.age = 36
console.log(user.sayHello())
