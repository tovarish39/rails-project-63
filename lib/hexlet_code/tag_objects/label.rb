# frozen_string_literal: true

module Label # rubocop:disable Style/Documentation
  def self.object(field_name)
    {
      tag_name: 'label',
      options: { inner: field_name.capitalize.to_s, for: field_name }
    }
  end
end
