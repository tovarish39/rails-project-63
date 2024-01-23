# frozen_string_literal: true

require_relative 'autoload'

# удалил бы коммент, но без этого hexlet-check не проходит
class FormFull
  include AutoloadManager
  attr_reader :fields, :form

  def initialize(model, form_options)
    @form = Form.object(form_options)
    @fields = []
    @model = model
  end

  def input(field_name, tag_options = {})
    @fields << Label.object(field_name)

    args = [field_name, tag_options, @model]
    @fields << case tag_options.fetch(:as, :input)
               when :text
                 TextArea.object(*args)
               else
                 TextInput.object(*args)
               end
  end

  def submit(value = 'Save')
    @fields << Submit.object(value)
  end
end
