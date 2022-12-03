require 'spec_helper'

describe Faker::Russian do
  describe '#cadastral_number' do
    shared_examples 'when cadastral number is correct' do
      let(:expression) { /(\d{2}|0):(\d{2}|0):(\d{6,7}|0):[1-9]+/ }

      it { 100.times { expect(number).to match expression } }
    end

    context 'when generate valid cadastral number without arguments' do
      subject(:number) { described_class.cadastral_number }

      it_behaves_like 'when cadastral number is correct'
    end

    context 'when generate valid cadastral number with district' do
      subject(:number) { described_class.cadastral_number district: district }

      context 'with district 61' do
        let(:district) { '61' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /#{district}:(\d{2}|0):(\d{6,7}|0):[1-9]+/ }
        end
      end

      context 'with district 1' do
        let(:district) { '1' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /0#{district}:(\d{2}|0):(\d{6,7}|0):[1-9]+/ }
        end
      end

      context 'with district 0' do
        let(:district) { '0' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /#{district}:(\d{2}|0):(\d{6,7}|0):[1-9]+/ }
        end
      end
    end

    context 'when generate valid cadastral number with area' do
      subject(:number) { described_class.cadastral_number area: area }

      context 'with area 99' do
        let(:area) { '99' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /(\d{2}|0):#{area}:(\d{6,7}|0):[1-9]+/ }
        end
      end

      context 'with area 1' do
        let(:area) { '1' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /(\d{2}|0):0#{area}:(\d{6,7}|0):[1-9]+/ }
        end
      end

      context 'with area 0' do
        let(:area) { '0' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /(\d{2}|0):#{area}:(\d{6,7}|0):[1-9]+/ }
        end
      end
    end

    context 'when generate valid cadastral number with quarter' do
      subject(:number) { described_class.cadastral_number quarter: quarter }

      context 'with quarter 99' do
        let(:quarter) { '99' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /(\d{2}|0):(\d{2}|0):#{quarter}:[1-9]+/ }
        end
      end

      context 'with quarter 0' do
        let(:quarter) { '0' }

        it_behaves_like 'when cadastral number is correct' do
          let(:expression) { /(\d{2}|0):(\d{2}|0):#{quarter}:[1-9]+/ }
        end
      end
    end

    context 'when generate valid cadastral number for All-Russian district' do
      subject(:number) { described_class.cadastral_number district: '0', area: '0', quarter: '0' }

      it_behaves_like 'when cadastral number is correct' do
        let(:expression) { /0:0:0:[1-9]+/ }
      end
    end

    context 'when generate same cadastral numbers for sequence' do
      let(:array1) { 1000.times.map{ |n| described_class.cadastral_number(sequence_number: n) } }
      let(:array2) { 1000.times.map{ |n| described_class.cadastral_number(sequence_number: n) } }

      it { expect(array1).to eq(array2) }
    end
  end
end
