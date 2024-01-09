# frozen_string_literal: true

module HexletCode
  # описание модуля
  class BlockTag
    attr_reader :tags

    def initialize(model)
      @tags = []
      @model = model
    end

    def input(tag_name, options = {})
      value = @model.public_send(tag_name)
      as = options.fetch(:as, nil)
      label_value = tag_name.capitalize.to_s
      args = [options, tag_name, label_value, value]
      @tags << if as.nil?
                 make_input_with_label(*args)
               elsif as == :text
                 make_textarea_with_label(*args)
               end
    end

    def make_input_with_label(options, tag_name, label_value, value)
      input_attributes = { name: tag_name, type: 'text', value: }
      input_attributes[:class] = options[:class] unless options[:class].nil?

      Tag.build('label', for: tag_name) { label_value } +
        Tag.build('input', input_attributes)
    end

    def make_textarea_with_label(options, tag_name, label_value, value)
      rows = options.fetch(:rows, 40)
      cols = options.fetch(:cols, 20)
      attributes = { name: tag_name, cols:, rows: }
      attributes[:class] = options[:class] unless options[:class].nil?

      Tag.build('label', for: tag_name) { label_value } +
        Tag.build('textarea', attributes) { value }
    end

    def submit(value = 'Save')
      attributes = { type: 'submit', value: }
      @tags << Tag.build('input', attributes)
    end
  end
end
