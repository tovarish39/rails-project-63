# frozen_string_literal: true

# require 'test_helper'
# для дебаггера
require_relative 'test_helper'
require 'colorize'

User = Struct.new(:name, :job, :gender, keyword_init: true)

def normalize_whitespaces(text)
  text.gsub("\n", '').gsub('  ', '')
end

describe 'generate form with input'.yellow do # rubocop:disable Metrics/BlockLength
  before do
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end
  it 'simple inputs'.red do
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="rob">
        <label for="job">Job</label>
        <input name="job" type="text" value="hexlet">
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'with empty value'.red do
    form = HexletCode.form_for User.new do |f|
      f.input :name
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="">
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'input with :as'.red do
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="rob">
        <label for="job">Job</label>
        <textarea name="job" cols="20" rows="40">hexlet</textarea>
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'input with :as && options'.red do
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <label for="job">Job</label>
        <textarea name="job" cols="50" rows="50">hexlet</textarea>
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'input with :class'.red do
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="rob" class="user-input">
        <label for="job">Job</label>
        <input name="job" type="text" value="hexlet">
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'input with unexist field => raice'.red do
    assert_raises do
      HexletCode.form_for @user, url: '#' do |f|
        f.input :unexist_field
      end
    end
  end

  it 'inputs with default submit'.red do
    form = HexletCode.form_for @user, url: '#', &:submit
    expect = <<~TEXT
      <form action="#" method="post">
        <input type="submit" value="Save">
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end

  it 'inputs with submit with value'.red do
    form = HexletCode.form_for @user, url: '#' do |f|
      f.submit 'Wow'
    end
    expect = <<~TEXT
      <form action="#" method="post">
        <input type="submit" value="Wow">
      </form>
    TEXT
    assert form == normalize_whitespaces(expect)
  end
end
