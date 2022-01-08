require 'spec_helper'

describe Faker::Russian do
  describe '#ogrn' do
    shared_examples 'when expecting valid model' do
      it { 100.times { expect(model).to be_valid } }
    end

    before(:all) do
      DummyModel.reset_callbacks(:validate)
      DummyModel.validates(:field, ogrn_format: true)
    end

    context 'when generate valid ogrn without arguments' do
      let(:model) { DummyModel.new(field: described_class.ogrn) }

      it_behaves_like 'when expecting valid model'
    end

    context 'when generate valid ogrn with :legal kind' do
      let(:model) { DummyModel.new(field: described_class.ogrn(kind: :legal)) }

      it_behaves_like 'when expecting valid model'
    end

    context 'when generate valid ogrn with :individual kind' do
      let(:model) { DummyModel.new(field: described_class.ogrn(kind: :individual)) }

      it_behaves_like 'when expecting valid model'
    end

    context 'when generate valid ogrn with support :region_number' do
      let(:model) { DummyModel.new(field: described_class.ogrn(region_number: 61)) }

      it_behaves_like 'when expecting valid model'
    end

    context 'when generate difference ogrns with sequence' do
      it do
        sequenced_ogrns = 1000.times.map{ |n| described_class.ogrn(sequence_number: n) }
        expect(sequenced_ogrns.size).to eq(sequenced_ogrns.uniq.size)
      end
    end

    context 'when generate same ogrns for sequence' do
      let(:array1) { 1000.times.map{ |n| described_class.ogrn(sequence_number: n) } }
      let(:array2) { 1000.times.map{ |n| described_class.ogrn(sequence_number: n) } }

      it { expect(array1).to eq(array2) }
    end

    context 'when provided ot support option' do
      it { expect { Faker::Russian.inn(not_support_option: 'some_value') }.to raise_error(ArgumentError) }
    end

    context 'when provided not support :region_number' do
      let(:err_msg) { 'there is no region with that number!' }

      it { expect { described_class.ogrn(region_number: 999) }.to raise_error(RuntimeError, err_msg) }
    end

    context 'when provided not support :kind' do
      let(:err_msg) do
        "there is no any kind other than #{described_class::Ogrn::OGRN_SUPPORT_KINDS.map{ |k| ":#{k}" }.join(', ')}"
      end

      it { expect { described_class.ogrn(kind: :not_support_kind) }.to raise_error(ArgumentError, err_msg) }
    end
  end
end
