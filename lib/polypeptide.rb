class Polypeptide
  def self.translate_to_polypeptide(array)
    array.map{ |key| codon_to_polypeptide(key) }
  end

  def self.returns_proteins_before_stop_codons(array)
    array.include?('') ? reject_terminating_codons(array) : array
  end

  def self.reject_terminating_codons(array)
    terminating_index = array.find_index('')
    array.delete_if.with_index{ |codon, index| index >= terminating_index }
  end

  def self.codon_to_polypeptide(codon)
    case codon.upcase
    when 'AUG' then 'Methionine'
    when 'UUU', 'UUC' then 'Phenylalanine'
    when 'UUA', 'UUG' then 'Leucine'
    when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
    when 'UAU', 'UAC' then 'Tyrosine'
    when 'UGU', 'UGC' then 'Cysteine'
    when 'UGG' then 'Tryptophan'
    when 'UAA', 'UAG', 'UGA' then ''
    # else raise not_valid
    # else raise
    end
  end

  def self.translate_to_codons(string)
    string.chars.each_slice(3).map(&:join)
  end
end
