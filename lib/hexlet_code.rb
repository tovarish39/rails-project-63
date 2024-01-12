# frozen_string_literal: true

require_relative 'hexlet_code/version'

# описание модуля
module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, "#{__dir__}/hexlet_code/tag.rb"
  autoload :Form, "#{__dir__}/hexlet_code/form.rb"

  class << self
    def form_for(model, form_options = {})
      obj = Form.new(model, form_options)
      yield obj if block_given?

      Tag.build(obj.form[:tag_name], obj.form[:options]) do
        obj.fields.map do |field|
          Tag.build(field[:tag_name], field[:options])
        end.join('')
      end
    end
  end
end
