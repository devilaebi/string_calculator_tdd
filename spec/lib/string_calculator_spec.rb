require 'rails_helper'
require_relative '../../app/lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end
    it 'returns the number itself when one number is given' do
      expect(StringCalculator.add("1")).to eq(1)
    end
    it 'returns sum of two comma separated numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end
    it 'handles any number of comma separated inputs' do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end
    it 'handles newlines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
    it 'supports custom delimiter defined at the start like //;\n1;2' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
    it 'raises an error when negative numbers exist' do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end

    it 'lists all negatives in error message' do
      expect { StringCalculator.add("1,-2,-5,3") }.to raise_error("negative numbers not allowed -2,-5")
    end
  end
end
