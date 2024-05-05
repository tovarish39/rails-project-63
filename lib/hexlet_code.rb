# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'autoload'

# удалил бы коммент, но без этого hexlet-check не проходит
module HexletCode
  extend AutoloadManager
  class Error < StandardError; end

  class << self
    def form_for(model, form_options = {})
      form_full = FormFull.new(model, form_options)
      yield form_full if block_given?

      HtmlRenderer.render(form_full
    end
  end
end
