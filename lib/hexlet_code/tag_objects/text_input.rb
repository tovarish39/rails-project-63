# frozen_string_literal: true

module TextInput # rubocop:disable Style/Documentation
  def self.object(field_name, klass, value)
    options = { name: field_name, type: 'text', value: }
    options[:class] = klass unless klass.nil?
    {
      tag_name: 'input',
      options:
    }
  end
end
