# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'autoload'

# удалил бы коммент, но без этого hexlet-check не проходит
module HexletCode
  extend AutoloadManager
  class Error < StandardError; end

  class << self
    def form_for(model, form_options = {})
      obj = FormBase.new(model, form_options)
      yield obj if block_given?

      Tag.build(obj.form[:tag_name], obj.form[:options]) do
        obj.fields.map do |field|
          Tag.build(field[:tag_name], field[:options])
        end.join
      end
    end
  end
end
