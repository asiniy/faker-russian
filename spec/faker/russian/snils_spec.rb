require 'spec_helper'

describe Faker::Russian do
  describe '#snils' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, snils_format: true)
    end

    it 'generate valid snils without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.snils)).to be_valid
      end
    end

    it 'generate difference snils with sequence' do
      sequenced_snils = 1000.times.map{ |n| Faker::Russian.snils(sequence_number: n) }
      expect(sequenced_snils.size).to eq(sequenced_snils.uniq.size)
    end

    it 'generate same snils for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.snils(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.snils(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.snils(shit: 'shit') }.to raise_error(ArgumentError)
    end
  end
end
