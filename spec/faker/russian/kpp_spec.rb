require 'spec_helper'

describe Faker::Russian do
  describe '#kpp' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, kpp_format: true)
    end

    it 'generate valid kpp without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.kpp)).to be_valid
      end
    end

    it 'generate valid kpp with region number' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.kpp(region_number: 78))).to be_valid
      end
    end

    it 'generate difference kpps with sequence' do
      sequenced_kpps = 100.times.map{ |n| Faker::Russian.kpp(sequence_number: n) }
      expect(sequenced_kpps.size).to eq(sequenced_kpps.uniq.size)
    end

    it 'generate same kpps for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.kpp(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.kpp(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.kpp(shit: 'shit') }.to raise_error
    end

    it 'raise when selecting invalid region' do
      expect{ Faker::Russian.kpp(region_number: '90') }.to raise_error
    end
  end
end
