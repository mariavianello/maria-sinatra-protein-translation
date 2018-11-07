RSpec.describe Validator do
  describe '.multiple_of_three' do
    context 'given a string with length 3' do
      it 'returns true' do
        result = described_class.multiple_of_three('123')
        expect(result).to eq(true)
      end
    end

    context 'given a string with length 2' do
      it 'returns false' do
        result = described_class.multiple_of_three('12')
        expect(result).to eq(false)
      end
    end
  end

  describe '.codon_chars?' do
    context 'given a non codon string' do
      it 'returns false' do
        result = described_class.codon_chars?('bde')
        expect(result).to eq(false)
      end
    end

    context 'given a string with 1 codon char' do
      it 'returns false' do
        result = described_class.codon_chars?('abd')
        expect(result).to eq(false)
      end
    end

    context 'given a string with codon chars' do
      it 'returns false' do
        result = described_class.codon_chars?('aug')
        expect(result).to eq(true)
      end
    end
  end
end
