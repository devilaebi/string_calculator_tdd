require 'rails_helper'
require 'string_calculator'

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
  end
end
