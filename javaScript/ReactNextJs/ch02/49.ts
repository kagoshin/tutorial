type Identity = {
  id: number | string;
  name: string;
}

type Contact = {
  name: string;
  email: string;
  phone: string;
}

type IdentityOrContact = Identity | Contact

const id: IdentityOrContact = {
  id: '111',
  name: 'Takuya'
}


const cantact: IdentityOrContact = {
  name: 'Takuya',
  email: 'test@example.com',
  phone: '012345678'
}