# frozen_string_literal: true

require_relative 'hexlet_code/version'

# описание модуля
module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, "#{__dir__}/hexlet_code/tag.rb"
  autoload :BlockTag, "#{__dir__}/hexlet_code/block_tag.rb"

  # изначально делал нижний вариант, закомменченый с синтаксисом &block вместо yield
  # yield вариант я так понял предпочтения rubocop более поздней версии на которой hexlet-check проверяет
  # у меня изначально rubocop просил переделывать в &block вместо yield
  class << self
    def form_for(user, options = {})
      # inner_tags = get_inner_tags(user, &block) # { yield }

      instance = BlockTag.new(user)
      yield instance if block_given?
      inner_tags = instance.tags.reduce('') do |acc, str|
        acc += str
        acc
      end

      make_form_with_inner(options, inner_tags)
    end

    def make_form_with_inner(options, inner_tags)
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')
      klass =  options.fetch(:class, nil)
      args = { action:, method: }
      args[:class] = klass unless klass.nil?
      Tag.build('form', args) { inner_tags }
    end

    # def form_for(user, options = {}, &block)
    #   inner_tags = get_inner_tags(user, &block)

    #   action = options.fetch(:url, '#')
    #   method = options.fetch(:method, 'post')
    #   klass =  options.fetch(:class, nil)
    #   args = { action:, method: }
    #   args[:class] = klass unless klass.nil?
    #   Tag.build('form', args) { inner_tags }
    # end

    # def get_inner_tags(user, &block)
    #   return nil if block.nil?

    #   instance = BlockTag.new(user)
    #   block.call(instance)
    #   instance.tags.reduce('') do |acc, str|
    #     acc += str
    #     acc
    #   end
    # end
  end
end
