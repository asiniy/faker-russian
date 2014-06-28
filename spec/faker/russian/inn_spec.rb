require 'spec_helper'

describe Faker::Russian do
  context '#inn' do
    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, inn_format: true)
    end

    it 'generate valid inn without arguments' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.inn)).to be_valid
      end
    end

    it 'generate valid inn with region number' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.inn(region: 78))).to be_valid
      end
    end

    it 'generate valid inn with kind' do
      100.times do
        expect(DummyModel.new(field: Faker::Russian.inn(kind: [:individual, :legal].sample))).to be_valid
      end
    end

    it 'generate difference inns with sequence' do
      sequenced_inns = 10000.times.map{ |n| Faker::Russian.inn(sequence: n) }
      expect(sequenced_inns.size).to eq(sequenced_inns.uniq.size)
    end

    it 'generate same inns for sequence' do
      array1 = 10000.times.map{ |n| Faker::Russian.inn(sequence_number: n, region_number: 78, kind: :legal) }
      array2 = 10000.times.map{ |n| Faker::Russian.inn(sequence_number: n, region_number: 78, kind: :legal) }
      expect(array1).to match_array(array2)
    end

    it 'raise when selecting invalid region' do
      expect{ Faker::Russian.inn(region_number: '90') }.to raise_error
    end

    it 'raise when selecting invalid kind' do
      expect{ Faker::Russian.inn(kind: :shit) }.to raise_error
    end
  end
end
