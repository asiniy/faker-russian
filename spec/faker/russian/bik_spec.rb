require 'spec_helper'

describe Faker::Russian do
  describe '#bik' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, bik_format: true)
    end

    it 'generate valid bik without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.bik)).to be_valid
      end
    end

    it 'generate valid bik with okato region number' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.bik(okato_region_number: 78))).to be_valid
      end
    end

    it 'generate difference biks with sequence' do
      sequenced_biks = 1000.times.map{ |n| Faker::Russian.bik(sequence_number: n) }
      expect(sequenced_biks.size).to eq(sequenced_biks.uniq.size)
    end

    it 'generate same biks for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.bik(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.bik(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.bik(shit: 'shit') }.to raise_error(ArgumentError)
    end

    it 'raise when selecting invalid okato region' do
      expect{ Faker::Russian.bik(okato_region_number: '02') }.to raise_error
    end

  end
end
