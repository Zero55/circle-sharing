# frozen_string_literal: true

class AttachedFileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.attached?
      record.errors[attribute] << (options[:message] || "file can't be blank")
    end
  end
end
