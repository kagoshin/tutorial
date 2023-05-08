enum Direction {
  Up = 'UP',
  Down = 'DOWN',
  Left = 'LEFT',
  Right = 'RIGHT'
}

const value = 'DOWN'

const enumValue = value as Direction

if (enumValue === Direction.Down) {
  console.log(enumValue)
  console.log('Down is selected')
}
