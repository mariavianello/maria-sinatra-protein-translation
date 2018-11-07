RSpec.describe Response do

  describe '.not_correct_chars' do
    it 'returns the statement' do
      result = described_class.not_correct_chars
      expect(result).to eq('Input must be a codon.')
    end
  end

  describe '.not_valid' do
    it 'returns the statement' do
      result = described_class.not_valid
      expect(result).to eq('Not a valid RNA sequence.')
    end
  end
end
