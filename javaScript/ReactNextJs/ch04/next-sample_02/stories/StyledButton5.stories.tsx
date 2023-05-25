import { ComponentMeta, ComponentStory } from '@storybook/react'
import { StyledButton } from '../components/StyledButton'
import MDXDocument from './StyledButton.mdx'

export default {
  title: 'StyledButton (5)',
  component: StyledButton,
  parameters: {
    docs: {
      page: MDXDocument,
    },
  },
} as ComponentMeta<typeof StyledButton>

const Template: ComponentStory<typeof StyledButton> = (args) => <StyledButton {...args} />

export const TemplateTest = Template.bind({})

TemplateTest.args = {
  variant: 'primary',
  children: 'Primary',
}