# frozen_string_literal: true

require_relative "hexlet_code/version"

# описание модуля
module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, "#{__dir__}/hexlet_code/tag.rb"
  autoload :BlockTag, "#{__dir__}/hexlet_code/block_tag.rb"

  class << self
    def form_for(user, options = {}, &block)
      inner_tags = get_inner_tags(user, &block)

      action = options.fetch(:url, "#")
      method = options.fetch(:method, "post")
      Tag.build("form", action:, method:) { inner_tags }
    end

    def get_inner_tags(user, &block)
      return nil if block.nil?

      instance = BlockTag.new(user)
      block.call(instance)
      instance.tags.reduce("") do |acc, str|
        acc += str
        acc
      end
    end
  end
end
