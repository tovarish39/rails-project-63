# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module AutoloadManager
  autoload :HtmlRenderer, "#{__dir__}/hexlet_code/html_render.rb"
  autoload :FormFull, "#{__dir__}/hexlet_code/form_full.rb"
end
