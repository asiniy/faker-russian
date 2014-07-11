require 'spec_helper'

describe Faker::Russian do
  describe '#okpo' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, okpo_format: true)
    end

    it 'generate valid okpo without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.okpo)).to be_valid
      end
    end

    it 'generate difference okpos with sequence' do
      sequenced_okpos = 10000.times.map{ |n| Faker::Russian.okpo(sequence_number: n) }
      expect(sequenced_okpos.size).to eq(sequenced_okpos.uniq.size)
    end

    it 'generate same okpos for sequence' do
      array1 = 10000.times.map{ |n| Faker::Russian.okpo(sequence_number: n) }
      array2 = 10000.times.map{ |n| Faker::Russian.okpo(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.okpo(shit: 'shit') }.to raise_error(ArgumentError)
    end
  end
end
