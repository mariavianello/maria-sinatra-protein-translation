
# https://exercism.io/my/solutions/9f64e8b6c9eb411986b4d48f2427938b
class Protein

  def self.rna_to_polypeptides(string)
    return Protein._not_valid if !Protein._multiple_of_three(string)

    codon_array = Protein._translate_to_codons(string)

    updated_codon_array = Protein._translate_to_polypeptide(codon_array)

    Protein._proteins(updated_codon_array)
  end

  private
  def self._translate_to_polypeptide(array)
    polypeptides = array.map{ |key| _codon_to_polypeptide(key) }
  end

  def self._proteins(array)
    array.include?('') ? Protein._reject_terminating_codons(array) : array
  end

  def self._reject_terminating_codons(array)
    terminating_index = array.find_index('')
    array.delete_if.with_index{ |codon, index| index >= terminating_index }
  end

  def self._codon_to_polypeptide(codon)
    polypeptide = case codon
                  when 'AUG' then 'Methionine'
                  when 'UUU', 'UUC' then 'Phenylalanine'
                  when 'UUA', 'UUG' then 'Leucine'
                  when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
                  when 'UAU', 'UAC' then 'Tyrosine'
                  when 'UGU', 'UGC' then 'Cysteine'
                  when 'UGG' then 'Tryptophan'
                  when 'UAA', 'UAG', 'UGA' then ''
                  else 'ugg boots'
                  end
    polypeptide
  end


  def self._not_valid
    'Not a valid RNA sequence.'
  end

  def self._multiple_of_three(string)
    string.length.%(3).zero?
  end

  def self._translate_to_codons(string)
    codons = string.chars.each_slice(3).map(&:join)
  end

end
