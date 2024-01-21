# frozen_string_literal: true

module TextArea # rubocop:disable Style/Documentation
  def self.object(field_name, klass, value, tag_options)
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
