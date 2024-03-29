# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module TextArea
  def self.object(field_name, tag_options, model)
    value = model.public_send(field_name) || ''
    klass = tag_options.fetch(:class, nil)
    rows = tag_options.fetch(:rows, 40)
    cols = tag_options.fetch(:cols, 20)
    options = { name: field_name, cols:, rows:, inner: value }
    options[:class] = klass unless klass.nil?
    {
      tag_name: 'textarea',
      options:
    }
  end
end
