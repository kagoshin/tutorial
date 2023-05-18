import { useState, useEffect } from 'react'

function Sayhello() {
  
  const [data, setData] = useState({name: ''})

  useEffect(() => {
    fetch('api/hello2')
      .then((res) => res.json())
      .then((profile) => {
        setData(profile)
      })
  }, [])

  return <div>hello {data.name}</div>
}

export default Sayhello