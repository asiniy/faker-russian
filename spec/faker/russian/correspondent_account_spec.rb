require 'spec_helper'

describe Faker::Russian do
  describe '#correspondent_account' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, ks_format: true)
    end

    it 'generate valid correspondent account without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.correspondent_account)).to be_valid
      end
    end

    it 'generate same ks for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.correspondent_account(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.correspondent_account(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.correspondent_account(shit: 'shit') }.to raise_error(ArgumentError)
    end
  end
end
