require 'pry'

RSpec.describe ProteinUtils do

  describe '.translate_to_polypeptides' do
    context 'given a codon' do
      it 'returns the polypeptide' do
        result = described_class.translate_to_polypeptide( ['AUG'] )
        expect(result).to eq( ['Methionine'] )
      end
    end

    context 'given 3 codons' do
      it 'returns the polypeptides' do
        result = described_class.translate_to_polypeptide( ['AUG', 'UUU', 'UCU'] )
        expect(result).to eq( ['Methionine', 'Phenylalanine', 'Serine'] )
      end
    end

    context 'given a terminating codon' do
      it 'returns an empty list' do
        result = described_class.translate_to_polypeptide( ['UAA'] )
        expect(result).to eq( [''] )
      end
    end
  end

  describe '.proteins' do
    context 'given an array with no empty string' do
      it 'returns the array' do
        result = described_class.proteins( ['a'] )
        expect(result).to eq( ['a'] )
      end
    end

    context 'given '' as second element' do
      it 'returns only the first element' do
        result = described_class.proteins( ['a', ''] )
        expect(result).to eq( ['a'] )
      end
    end

    context 'given an empty string as second element of 3 elements' do
      it 'returns only the first element' do
        result = described_class.proteins( ['a', '', 'b'] )
        expect(result).to eq( ['a'] )
      end
    end

    context 'given '' as third element of 4' do
      it 'returns only the first two elements' do
        result = described_class.proteins( ['a', 'b', '' ,'d', 'e'] )
        expect(result).to eq( ['a', 'b'] )
      end
    end
  end

  describe '.reject_terminating_codons' do
    context 'given an empty string as second element' do
      it 'returns the first element' do
        result = described_class.reject_terminating_codons( ['a', ''] )
        expect(result).to eq( ['a'] )
      end
    end

    context 'given an empty string as the third element' do
      it 'returns the first 2 elements' do
        result = described_class.reject_terminating_codons( ['a', 'b', '', 'd'] )
        expect(result).to eq( ['a', 'b'] )
      end
    end
  end

  describe '.codon_to_polypeptide' do
    context 'given a non terminating codon' do
      it 'returns the polypeptide' do
        result = described_class.codon_to_polypeptide( 'UGU' )
        expect(result).to eq( 'Cysteine' )
      end
    end

    context 'given a terminating codon' do
      it 'returns an emtpy string' do
        result = described_class.codon_to_polypeptide( 'UAA' )
        expect(result).to eq( '' )
      end
    end
  end

  describe '.not_valid' do
    it 'returns statement' do
      result = described_class.not_valid
      expect(result).to eq('Not a valid RNA sequence.' )
    end
  end

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

  describe '.translate_to_codons' do
    context 'given a single rna nucleotide' do
      it 'translate it into a codon' do
        result = described_class.translate_to_codons( 'UGG' )
        expect(result).to eq( ['UGG'] )
      end
    end

    context 'given a RNA sequence of three nucleotides' do
      it 'translates it into codons' do
        result = described_class.translate_to_codons( 'AUGUUUUCU' )
        expect(result).to eq( ['AUG' , 'UUU', 'UCU'] )
      end
    end
  end
end
