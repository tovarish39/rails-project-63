# frozen_string_literal: true

module HexletCode
  # описание модуля
  class Form
    attr_reader :fields, :form

    def initialize(model, form_options)
      klass = form_options.fetch(:class, nil)
      @form = obj_form(form_options, klass)
      @fields = []
      @model = model
    end

    def input(field_name, tag_options = {})
      value = @model.public_send(field_name) || ''
      as = tag_options.fetch(:as, nil)
      tag_name = as.nil? ? 'input' : 'textarea'
      klass = tag_options.fetch(:class, nil)

      @fields << obj_label(field_name)
      @fields << case tag_name
                 when 'input' then obj_input(field_name, klass, value)
                 when 'textarea' then obj_textarea(field_name, klass, value, tag_options)
                 end
    end

    def submit(value = 'Save')
      @fields << obj_submit(value)
    end

    private

    def obj_label(field_name)
      {
        tag_name: 'label',
        options: { inner: field_name.capitalize.to_s, for: field_name }
      }
    end

    def obj_submit(value)
      options = { type: 'submit', value: }
      {
        tag_name: 'input',
        options:
      }
    end

    def obj_input(field_name, klass, value)
      options = { name: field_name, type: 'text', value: }
      options[:class] = klass unless klass.nil?
      {
        tag_name: 'input',
        options:
      }
    end

    def obj_textarea(field_name, klass, value, tag_options)
      rows = tag_options.fetch(:rows, 40)
      cols = tag_options.fetch(:cols, 20)
      options = { name: field_name, cols:, rows:, inner: value }
      options[:class] = klass unless klass.nil?
      {
        tag_name: 'textarea',
        options:
      }
    end

    def obj_form(form_options, klass)
      action = form_options.fetch(:url, '#')
      method = form_options.fetch(:method, 'post')
      options = { action:, method: }
      options[:class] = klass unless klass.nil?
      {
        tag_name: 'form',
        options:
      }
    end
  end
end
