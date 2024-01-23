# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module HtmlRenderer
  PAIR_TAGS = %i[label div form label textarea].freeze
  SINGLE_TAGS = %i[br img input].freeze

  class << self
    def render(form_full)
      build(form_full.form[:tag_name], form_full.form[:options]) do
        form_full.fields.map do |field|
          build(field[:tag_name], field[:options])
        end.join
      end
    end

    def build(tag_name, options = {})
      result  = send("part_#{tag_name}", options)
      result << yield if block_given?
      result << "</#{tag_name}>" if PAIR_TAGS.include?(tag_name.to_sym)
      result
    end

    def part_label(options)
      "<label#{format_attributes(options.except(:inner))}>#{options[:inner]}"
    end

    def part_form(options)
      "<form#{format_attributes(options)}>"
    end

    def part_input(options)
      "<input#{format_attributes(options)}>"
    end

    def part_textarea(options)
      "<textarea#{format_attributes(options.except(:inner))}>#{options[:inner]}"
    end

    def format_attributes(attributes)
      return '' if attributes.empty?

      attributes.reduce('') do |acc, (k, v)|
        acc = "#{acc} #{k}=\"#{v}\""
        acc
      end
    end
  end
end
