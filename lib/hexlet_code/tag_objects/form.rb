# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module Form
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
