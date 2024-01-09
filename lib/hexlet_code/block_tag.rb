# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

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
      @tags << if as.nil?
                 input_attributes = { name: tag_name, type: "text", value: }
                 input_attributes[:class] = options[:class] unless options[:class].nil?

                 Tag.build("label", for: tag_name) { label_value } +
                 Tag.build("input", input_attributes)
               elsif as == :text
                 rows = options.fetch(:rows, 40)
                 cols = options.fetch(:cols, 20)
                 attributes = { name: tag_name, cols:, rows: }
                 attributes[:class] = options[:class] unless options[:class].nil?

                 Tag.build("label", for: tag_name) { label_value } +
                 Tag.build("textarea", attributes) { value }
               end
    end

    def submit(value = "Save")
      attributes = { type: "submit", value: }
      @tags << Tag.build("input", attributes)
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
