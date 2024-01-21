# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module AutoloadManager
  autoload :Form, "#{__dir__}/tag_objects/form.rb"
  autoload :Submit, "#{__dir__}/tag_objects/submit.rb"
  autoload :TextArea, "#{__dir__}/tag_objects/text_area.rb"
  autoload :TextInput, "#{__dir__}/tag_objects/text_input.rb"
  autoload :Label, "#{__dir__}/tag_objects/label.rb"
end
