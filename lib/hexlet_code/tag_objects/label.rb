# frozen_string_literal: true

# удалил бы коммент, но без этого hexlet-check не проходит
module Label
  def self.object(field_name)
    {
      tag_name: 'label',
      options: { inner: field_name.capitalize.to_s, for: field_name }
    }
  end
end
