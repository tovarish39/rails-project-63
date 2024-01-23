![example workflow](https://github.com/tovarish39/rails-project-63/actions/workflows/ruby.yml/badge.svg)
![example workflow](https://github.com/tovarish39/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# Educational project - HexletCode

## Description

    using this code you can simply create html forms based on the passed model

## Usage

when project was downloaded

    require "/path/to/project_name/lib/hexlet_code.rb"

after that you

create 'model', when it can respond to it field
example with Struct lib

    User = Struct.new(:name, :age, :description, keyword_init:true)
    user = User.new(name:'Vasiliy')

    HexletCode.form_for user do |f|
    f.input :name
    f.input :description, as: :text
    f.submit
    end

=> result is html in string format

    <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="Vasiliy">
        <label for="description">Description</label>
        <textarea name="description" cols="20" rows="40"></textarea>
        <input type="submit" value="Save">
    </form>
