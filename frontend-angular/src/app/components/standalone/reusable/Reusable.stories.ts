import { moduleMetadata } from '@storybook/angular';
import type { Meta, StoryObj } from '@storybook/angular';
import { CommonModule } from '@angular/common';

import { ReusableComponent } from './reusable.component';
const meta: Meta<ReusableComponent> = {
  title: 'Example/ReusableComponent',
  component: ReusableComponent,
  tags: ['autodocs'],
};

export default meta;
type Story = StoryObj<ReusableComponent>;

export const Primary: Story = {
  args: {
    name: 'parent',
  },
};

export const Secondary: Story = {
  args: {
    name: 'child',
  },
};
