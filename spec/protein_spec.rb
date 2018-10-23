require 'protein'
require 'pry'

describe '.rna_to_polypeptides' do
  context 'given a nonvalid rna sequence' do
    it 'returns invalid statement' do
      result = Protein.rna_to_polypeptides('AUGUU')
      expect(result).to eq( 'Not a valid RNA sequence.' )
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

describe '._translate_to_polypeptides' do
  context 'given a codon' do
    it 'returns the polypeptide' do
      result = Protein._translate_to_polypeptide( ['AUG'] )
      expect(result).to eq( ['Methionine'] )
    end
  end

  context 'given 3 codons' do
    it 'returns the polypeptides' do
      result = Protein._translate_to_polypeptide( ['AUG', 'UUU', 'UCU'] )
      expect(result).to eq( ['Methionine', 'Phenylalanine', 'Serine'] )
    end
  end

  context 'given a terminating codon' do
    it 'returns an empty list' do
      result = Protein._translate_to_polypeptide( ['UAA'] )
      expect(result).to eq( [''] )
    end
  end
end

describe '._proteins' do
  context 'given an array with no empty string' do
    it 'returns the array' do
      result = Protein._proteins( ['a'] )
      expect(result).to eq( ['a'] )
    end
  end

  context 'given '' as second element' do
    it 'returns only the first element' do
      result = Protein._proteins( ['a', ''] )
      expect(result).to eq( ['a'] )
    end
  end

  context 'given an empty string as second element of 3 elements' do
    it 'returns only the first element' do
      result = Protein._proteins( ['a', '', 'b'] )
      expect(result).to eq( ['a'] )
    end
  end

  context 'given '' as third element of 4' do
    it 'returns only the first two elements' do
      result = Protein._proteins( ['a', 'b', '' ,'d', 'e'] )
      expect(result).to eq( ['a', 'b'] )
    end
  end
end

describe '._reject_terminating_codons' do
  context 'given an empty string as second element' do
    it 'returns the first element' do
      result = Protein._reject_terminating_codons( ['a', ''] )
      expect(result).to eq( ['a'] )
    end
  end

  context 'given an empty string as the third element' do
    it 'returns the first 2 elements' do
      result = Protein._reject_terminating_codons( ['a', 'b', '', 'd'] )
      expect(result).to eq( ['a', 'b'] )
    end
  end
end

describe '._codon_to_polypeptide' do
  context 'given a non terminating codon' do
    it 'returns the polypeptide' do
      result = Protein._codon_to_polypeptide( 'UGU' )
      expect(result).to eq( 'Cysteine' )
    end
  end

  context 'given a terminating codon' do
    it 'returns an emtpy string' do
      result = Protein._codon_to_polypeptide( 'UAA' )
      expect(result).to eq( '' )
    end
  end
end

describe '._not_valid' do
  it 'returns statement' do
    result = Protein._not_valid
    expect(result).to eq('Not a valid RNA sequence.' )
  end
end

describe '._multiple_of_three' do
  context 'given a string with length 3' do
    it 'returns true' do
      result = Protein._multiple_of_three('123')
      expect(result).to eq(true)
    end
  end

  context 'given a string with length 2' do
    it 'returns false' do
      result = Protein._multiple_of_three('12')
      expect(result).to eq(false)
    end
  end
end

describe '.translate_to_codons' do
  context 'given a single rna nucleotide' do
    it 'translate it into a codon' do
      result = Protein._translate_to_codons( 'UGG' )
      expect(result).to eq( ['UGG'] )
    end
  end

  context 'given a RNA sequence of three nucleotides' do
    it 'translates it into codons' do
      result = Protein._translate_to_codons( 'AUGUUUUCU' )
      expect(result).to eq( ['AUG' , 'UUU', 'UCU'] )
    end
  end
end
