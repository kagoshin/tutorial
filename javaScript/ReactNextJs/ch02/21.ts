function genBirdsInfo(name: string): string[] {
  return name.split(',')
}

function singBirds(birdInfo: (x: string) => string[]): string {
  return birdInfo('hato, kiji')[0] + ' piyo piyo'
}

console.log(singBirds(genBirdsInfo))
// console.log(singBirds('dobato'))