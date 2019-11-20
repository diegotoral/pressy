import Timeline from 'components/Timeline'
import { shallowMount } from '@vue/test-utils'

describe('Timeline', () => {
  let wrapper
  const propsData = {
    selected: 1,
    slides: ['one', 'two', 'three', 'four']
  }

  beforeEach(() => {
    wrapper = shallowMount(Timeline, { propsData })
  })

  it('emits selected with the index when a thumbnail is clicked', () => {
    const thumbnail = wrapper.findAll('.thumbnail').at(2)

    thumbnail.trigger('click')

    expect(wrapper.emitted('selected')[0]).toEqual([2])
  })
})
