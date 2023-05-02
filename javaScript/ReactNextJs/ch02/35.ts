interface Point {
  x: number;
  y: number;
}

function printPoint(point: Point) {
  console.log(`x座標は${point.x}です`)
  console.log(`y座標は${point.y}です`)
  console.log(`z座標は${point.z}です`)
}

interface Point {
  z: number
}

// printPoint({ x: 100, y: 100 })

printPoint({ x: 100, y: 100, z:200 })