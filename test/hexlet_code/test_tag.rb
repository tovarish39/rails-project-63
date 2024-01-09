# frozen_string_literal: true

require 'test_helper'
require 'colorize'

# rubocop:disable Style/BlockLength

describe 'HexletCode::Tag.build ...'.yellow do
  before do
    @tag = HexletCode::Tag
  end

  it 'tag_br'.red do
    tag_br = @tag.build('br')
    assert(tag_br == '<br>')
  end

  it 'tag_img'.red do
    tag_img = @tag.build('img', src: 'path/to/image')
    assert(tag_img == '<img src="path/to/image">')
  end

  it 'tag_input'.red do
    tag_input = @tag.build('input', type: 'submit', value: 'Save')
    assert(tag_input == '<input type="submit" value="Save">')
  end

  it 'tag_label 1'.red do
    tag_label = @tag.build('label') { 'Email' }
    assert(tag_label == '<label>Email</label>')
  end

  it 'tag_label 2'.red do
    tag_label = @tag.build('label', for: 'email') { 'Email' }
    assert(tag_label == '<label for="email">Email</label>')
  end

  it 'tag_div'.red do
    tag_div = @tag.build('div')
    assert(tag_div == '<div></div>')
  end
end
# rubocop:enable Style/BlockLength
