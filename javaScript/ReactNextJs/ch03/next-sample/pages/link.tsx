import Link from 'next/link'
import { useRouter } from 'next/router'
import { useEffect } from 'react'

function LinkSample() {
  const router = useRouter()

  const onSubmit = () => {
    router.push('/ssr')

    router.push({
      pathname: '/ssg',
      query: { keyword: 'hello' },
    })
  }

  const onClickReload = () => {
    router.reload()
  }

  const onClickBack = () => {
    router.back()
  }

  /*
  useEffect(() => {

    router.events.on('routeChangeStart', (url, { shallow }) => {
      console.log('routeChangeStart', url)
    })

    router.events.on('routeChangeComplete', (url, { shallow }) => {
      console.log('routeChangeComplete', url)
    })
  }, [])
  */
 
  return (
    <div style={{display: 'grid', gridTemplateColumns: '1fr', gap: '12px'}}>
      <Link href="/ssg">
        <a>Go TO SSG</a>
      </Link>
      <Link href="/ssg?keyword=next">
        <a>GO TO SSG with keyword next</a>
      </Link>
      <Link
        href={{
          pathname: '/ssg',
          query: { keyword: 'hello' },
        }}>
        <a>GO TO SSG with keyword hello</a>
      </Link>
      <Link href="/ssg">
        <button>Jump to SSG page</button>
      </Link>
      <button onClick={onSubmit}>Submit</button>
      <button onClick={onClickReload}>Reload</button>
      <button onClick={onClickBack}>Back</button>

    </div>
  )
}

export default LinkSample