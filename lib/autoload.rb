# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module AutoloadManager
  autoload :Tag, "#{__dir__}/hexlet_code/tag.rb"
  autoload :FormBase, "#{__dir__}/hexlet_code/form_base.rb"
end
