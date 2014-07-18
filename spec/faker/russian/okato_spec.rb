require 'spec_helper'

describe Faker::Russian do
  describe '#okato' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, okato_format: true)
    end

    it 'generate valid okato without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.okato)).to be_valid
      end
    end

    it 'generate valid okato with okato region number' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.okato(okato_region_number: 78))).to be_valid
      end
    end

    it 'generate difference okatos with sequence' do
      sequenced_okatos = 1000.times.map{ |n| Faker::Russian.okato(sequence_number: n, length: 9) }
      expect(sequenced_okatos.size).to eq(sequenced_okatos.uniq.size)
    end

    it 'generate same okatos for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.okato(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.okato(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'allow just 3,6,9 length' do
      [3,6,9].each { |n| expect{Faker::Russian.okato(length: n)}.to_not raise_error }
      [1,4,5].each { |n| expect{Faker::Russian.okato(length: n)}.to raise_error }
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.okato(shit: 'shit') }.to raise_error(ArgumentError)
    end

    it 'raise when selecting invalid okato region' do
      expect{ Faker::Russian.okato(okato_region_number: '02') }.to raise_error
    end

  end
end
