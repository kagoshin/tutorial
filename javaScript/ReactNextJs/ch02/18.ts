function sayHello(name: string, greeting: string = 'Hello'): string {
    return `${greeting} ${name}`
}

sayHello('Takuya')
sayHello('Takuya', 'Hey')
