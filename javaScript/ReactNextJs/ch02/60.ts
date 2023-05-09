type SupportVersions = {
  [env: number]: boolean
}

let versions: SupportVersions = {
  102: false,
  103: false,
  104: true,
  // 'v105': true
}

console.log(versions[102])