# encoding: utf-8
# frozen_string_literal: true
#
# This class handles validating license plate formats for jurisdictions that do
# not have a custom validator.
module LicensePlateFormats
  class Standard < Base
    def valid?
    end
  end
end
