# frozen_string_literal: true

module HexletCode
  # описание модуля
  module Tag
    PAIR_TAGS = %i[label div form label textarea].freeze
    SINGLE_TAGS = %i[br img input].freeze

    def self.build(tag_name, options = {})
      result  = send("part_#{tag_name}", options)
      result << yield if block_given?
      result << "</#{tag_name}>" if PAIR_TAGS.include?(tag_name.to_sym)
      result
    end

    def self.part_label(options)
      "<label#{format_attributes(options.except(:inner))}>#{options[:inner]}"
    end

    def self.part_form(options)
      "<form#{format_attributes(options)}>"
    end

    def self.part_input(options)
      "<input#{format_attributes(options)}>"
    end

    def self.part_textarea(options)
      "<textarea#{format_attributes(options.except(:inner))}>#{options[:inner]}"
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
