require 'spec_helper'

describe Faker::Russian do
  describe '#rs' do
    let(:okv) { 810 }

    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, rs_format: true)
    end

    it 'generate valid rs without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.rs)).to be_valid
      end
    end

    it 'generate rs with given okv number' do
      expect(Faker::Russian.rs(okv: okv)[5..7]).to eq okv.to_s
    end

    it 'generate valid rs with okv number' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.rs(okv: okv))).to be_valid
      end
    end

    it 'raises error if given okv number is invalid' do
      expect{ Faker::Russian.rs(okv: '001') }.to raise_error(ArgumentError)
    end

    it 'generate difference rs with sequence' do
      sequenced_rs = 1000.times.map{ |n| Faker::Russian.rs(sequence_number: n) }
      expect(sequenced_rs.size).to eq(sequenced_rs.uniq.size)
    end

    it 'generate same rs for sequence' do
      array1 = 1000.times.map{ |n| Faker::Russian.rs(sequence_number: n) }
      array2 = 1000.times.map{ |n| Faker::Russian.rs(sequence_number: n) }
      expect(array1).to eq(array2)
    end

    it 'permit just a few options' do
      expect{ Faker::Russian.rs(shit: 'shit') }.to raise_error(ArgumentError)
    end
  end
end
