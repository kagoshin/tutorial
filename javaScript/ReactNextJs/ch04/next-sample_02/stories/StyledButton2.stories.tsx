import { ComponentMeta, Story } from '@storybook/react'
import { StyledButton, StyledButtonProps } from '../components/StyledButton'

export default {
  title: 'StyledButton (2)',
  component: StyledButton,
  argTypes: { onClick: { action: 'clicked' } },
} as ComponentMeta<typeof StyledButton>

export const Primary: Story<StyledButtonProps> = (props) => {
  return (
    <StyledButton {...props} variant="primary">
      Primary
    </StyledButton>
  )
}

export const Success: Story<StyledButtonProps> = (props) => {
  return (
    <StyledButton {...props} variant="success">
      Primary
    </StyledButton>
  )
}

export const Transparent: Story<StyledButtonProps> = (props) => {
  return (
    <StyledButton {...props} variant="transparent">
      Transparent
    </StyledButton>
  )
}