# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe LicensePlateFormatValidator do
  module LicensePlateFormats
    class PlanetEarth
      def initialize(license_plate)
      end

      def valid?
      end
    end
  end

  let(:license_plate) do
    LicensePlate.new
  end
  let(:standard_format_validator) do
    instance_double 'LicensePlateFormats::Standard'
  end

  before do
    allow(license_plate).to receive(:jurisdiction_service_class_basename)
      .and_return service_class_basename
    allow(LicensePlateFormats::Standard).to receive(:new)
      .and_return standard_format_validator
  end

  describe '#validate' do
    context 'when the service_class_basename is "Standard"' do
      let(:service_class_basename) do
        'Standard'
      end

      context 'when the format of the license plate identifier is invalid' do
        before do
          allow(standard_format_validator).to receive(:valid?).and_return false
        end

        it 'adds errors to the record' do
          subject.validate(license_plate)
          expect(license_plate.errors.empty?).to be_falsey
        end
      end

      context 'when the format of the license plate identifier is valid' do
        before do
          allow(standard_format_validator).to receive(:valid?).and_return true
        end

        it 'does not add errors to the record' do
          subject.validate(license_plate)
          expect(license_plate.errors.empty?).to be_truthy
        end
      end
    end

    context 'when the service_class_basename is not "Standard"' do
      context 'when there is not a validator for the plate\'s jurisdiction' do
        let(:service_class_basename) do
          'NonexistentClass'
        end

        context 'when the format of the license plate identifier is invalid' do
          before do
            allow(standard_format_validator).to receive(:valid?)
              .and_return false
          end

          it 'adds errors to the record' do
            subject.validate(license_plate)
            expect(license_plate.errors.empty?).to be_falsey
          end
        end

        context 'when the format of the license plate identifier is valid' do
          before do
            allow(standard_format_validator).to receive(:valid?).and_return true
          end

          it 'does not add errors to the record' do
            subject.validate(license_plate)
            expect(license_plate.errors.empty?).to be_truthy
          end
        end
      end

      context 'when there is a validator for the plate\'s jurisdiction' do
        let(:service_class_basename) do
          'PlanetEarth'
        end
        let(:planet_earth_format_validator) do
          instance_double 'LicensePlateFormats::PlanetEarth'
        end

        before do
          allow(LicensePlateFormats::PlanetEarth).to receive(:new)
            .and_return planet_earth_format_validator
        end

        context 'when the format of the license plate identifier is invalid' do
          before do
            allow(planet_earth_format_validator).to receive(:valid?)
              .and_return false
          end

          it 'adds errors to the record' do
            subject.validate(license_plate)
            expect(license_plate.errors.empty?).to be_falsey
          end
        end

        context 'when the format of the license plate identifier is valid' do
          before do
            allow(planet_earth_format_validator).to receive(:valid?)
              .and_return true
          end

          it 'does not add errors to the record' do
            subject.validate(license_plate)
            expect(license_plate.errors.empty?).to be_truthy
          end
        end
      end
    end
  end
end
