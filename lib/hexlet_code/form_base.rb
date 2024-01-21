# frozen_string_literal: true

require_relative 'autoload'

# удалил бы коммент, но без этого hexlet-check не проходит
class FormBase
  include AutoloadManager
  attr_reader :fields, :form

  def initialize(model, form_options)
    @form = Form.object(form_options)
    @fields = []
    @model = model
  end

  def input(field_name, tag_options = {})
    value, tag_name, klass = get_data(field_name, tag_options)
    @fields << Label.object(field_name)
    @fields << case tag_name
               when 'input'
                 TextInput.object(field_name, klass, value)
               when 'textarea'
                 TextArea.object(field_name, klass, value, tag_options)
               end
  end

  def submit(value = 'Save')
    @fields << Submit.object(value)
  end

  private

  def get_data(field_name, tag_options)
    value = @model.public_send(field_name) || ''
    as = tag_options.fetch(:as, nil)
    tag_name = as.nil? ? 'input' : 'textarea'
    klass = tag_options.fetch(:class, nil)
    [value, tag_name, klass]
  end
end
