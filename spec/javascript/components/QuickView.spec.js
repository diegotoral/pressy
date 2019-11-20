import QuickView from 'components/QuickView'
import { shallowMount } from '@vue/test-utils'

describe('QuickView', () => {
  let wrapper
  const propsData = { title: 'A fancy title' }

  beforeEach(() => {
    wrapper = shallowMount(QuickView, { propsData })
  })

  it('renders the title when given', () => {
    expect(wrapper.html()).toContain('A fancy title')
  })

  it('calling toggle changes isActive', () => {
    wrapper.vm.isActive = false

    wrapper.vm.toggle()

    expect(wrapper.vm.isActive).toBeTruthy()
  })

  it('deactivates when clicking on delete/close button', () => {
    const button = wrapper.find('.delete')

    wrapper.vm.isActive = true
    button.trigger('click')

    expect(wrapper.vm.isActive).toBeFalsy()
  })
})
