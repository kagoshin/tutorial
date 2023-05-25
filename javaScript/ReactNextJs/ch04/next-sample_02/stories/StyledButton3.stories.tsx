import { useState } from 'react'
import { ComponentMeta, Story } from '@storybook/react'
import { StyledButton, StyledButtonProps } from '../components/StyledButton'
import { action } from '@storybook/addon-actions'

export default {
  title: 'StyledButton (3)',
  component: StyledButton,
} as ComponentMeta<typeof StyledButton>

const incrementAction = action('increment')

export const Primary: Story<StyledButtonProps> = (props) => {
  const [count, setCount] = useState(0)
  const onClick = (e: React.MouseEvent) => {
    incrementAction(e, count)
    setCount((c) => c + 1)
  }

  return (
    <StyledButton {...props} variant="primary" onClick={onClick}>
      Count: {count}
    </StyledButton>
  )
}