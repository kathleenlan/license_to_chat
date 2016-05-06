# encoding: utf-8
# frozen_string_literal: true
class LicensePlateFormatValidator < ActiveModel::Validator
  # @param record [LicensePlate] the LicensePlate record to be validated
  def validate(record)
    jurisdiction_format_validator = format_validator_for_jurisdiction(record)
    unless jurisdiction_format_validator.valid?
      record.errors['The plate number format'] << 'is invalid'
    end
  end

  private def format_validator_for_jurisdiction(record)
    basename = record.jurisdiction_service_class_basename
    validator_class = "LicensePlateFormats::#{basename}".safe_constantize
    validator_class ||= default_validator_class
    validator_class.new(record)
  end

  private def default_validator_class
    LicensePlateFormats::Standard
  end
end
