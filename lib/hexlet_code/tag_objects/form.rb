# frozen_string_literal: true

module Form # rubocop:disable Style/Documentation
  def self.object(form_options)
    klass = form_options.fetch(:class, nil)
    action = form_options.fetch(:url, '#')
    method = form_options.fetch(:method, 'post')
    options = { action:, method: }
    options[:class] = klass unless klass.nil?
    {
      tag_name: 'form',
      options:
    }
  end
end
