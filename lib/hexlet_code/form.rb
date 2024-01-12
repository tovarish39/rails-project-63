# frozen_string_literal: true

module HexletCode
  # описание модуля
  class Form
    attr_reader :fields, :form

    def initialize(model, form_options)
      @form = make_form(form_options)
      @fields = []
      @model = model
    end

    def input(field_name, tag_options = {}) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      value = @model.public_send(field_name) || ''
      as = tag_options.fetch(:as, nil)
      tag_name = as.nil? ? 'input' : 'textarea'

      @fields << {
        tag_name: 'label',
        options: { inner: field_name.capitalize.to_s, for: field_name }
      }
      klass = tag_options.fetch(:class, nil)
      @fields << case tag_name
                 when 'input'
                   options = { name: field_name, type: 'text', value: }
                   options[:class] = klass unless klass.nil?
                   { tag_name: 'input', options: }
                 when 'textarea'
                   rows = tag_options.fetch(:rows, 40)
                   cols = tag_options.fetch(:cols, 20)
                   options = { name: field_name, cols:, rows:, inner: value }
                   options[:class] = klass unless klass.nil?
                   { tag_name: 'textarea', options: }
                 end
    end

    def submit(value = 'Save')
      options = { type: 'submit', value: }
      @fields << { tag_name: 'input', options: }
    end

    private

    def make_form(form_options)
      {
        tag_name: 'form',
        options: form_with_default_options(form_options)
      }
    end

    def form_with_default_options(form_options)
      action = form_options.fetch(:url, '#')
      method = form_options.fetch(:method, 'post')
      klass =  form_options.fetch(:class, nil)
      options_with_default = { action:, method: }
      options_with_default[:class] = klass unless klass.nil?
      options_with_default
    end
  end
end
