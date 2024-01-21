# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module TextInput
  def self.object(field_name, klass, value)
    options = { name: field_name, type: 'text', value: }
    options[:class] = klass unless klass.nil?
    {
      tag_name: 'input',
      options:
    }
  end
end
