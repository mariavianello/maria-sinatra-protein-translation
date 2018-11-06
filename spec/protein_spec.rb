require 'pry'

RSpec.describe Protein do

  describe '.rna_to_polypeptides' do
    context 'given a nonvalid rna sequence' do
      it 'returns invalid statement' do
        result = Protein.rna_to_polypeptides('AUGUU')
        expect(result).to eq( 'Not a valid RNA sequence.' )
      end
    end

    context 'given a non codon string' do
      it 'returns invalid statement' do
        result = Protein.rna_to_polypeptides('abc')
        expect(result).to eq( 'Input must be a codon.' )
      end
    end

    context 'given a valid rna nucleotide with no terminating codon' do
      it 'returns the polypeptide' do
        result = Protein.rna_to_polypeptides('UGG')
        expect(result).to eq( ['Tryptophan'] )
      end
    end

    context 'given a valid rna sequence with no terminating codon' do
      it 'returns the polypeptides' do
        result = Protein.rna_to_polypeptides('AUGUGG')
        expect(result).to eq( ['Methionine', 'Tryptophan'] )
      end
    end

    context 'given a terminating codon at the end' do
      it 'returns only the first polypeptide' do
        result = Protein.rna_to_polypeptides( 'AUGUAA' )
        expect(result).to eq( ['Methionine'] )
      end
    end

    context 'given a terminating codon in the middle' do
      it 'returns the first 2 polypeptides' do
        result = Protein.rna_to_polypeptides( 'UGGAUGUAAUCU' )
        expect(result).to eq( ['Tryptophan', 'Methionine'] )
      end
    end
  end

end
