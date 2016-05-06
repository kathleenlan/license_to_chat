# encoding: utf-8
# frozen_string_literal: true
#
# This class serves as an interface for all validator classes in the
# LicensePlateFormats namespace.
module LicensePlateFormats
  class Base
    attr_reader :license_plate

    def initialize(license_plate)
      @license_plate = license_plate
    end

    def valid?
      raise NotImplementedError
    end
  end
end
