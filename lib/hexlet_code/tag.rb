# frozen_string_literal: true

module HexletCode
  # описание модуля
  module Tag
    PAIR_TAGS = %i[label div form label textarea].freeze
    SINGLE_TAGS = %i[br img input].freeze

    def self.build(*args, &block)
      # def self.build(tag_name, attributes = {})
      tag_name, attributes = args
      attributes ||= {}

      result  = "<#{tag_name}#{format_attributes(attributes)}>"
      result << block.call if !block.nil? && !block.call.nil?
      result << "</#{tag_name}>" if PAIR_TAGS.include?(tag_name.to_sym)
      result
    end

    def self.format_attributes(attributes)
      return '' if attributes.empty?

      attributes.reduce('') do |acc, (k, v)|
        acc = "#{acc} #{k}=\"#{v}\""
        acc
      end
    end
  end
end
