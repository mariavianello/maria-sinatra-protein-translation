class ProteinUtils

  def self.translate_to_polypeptide(array)
    polypeptides = array.map{ |key| codon_to_polypeptide(key) }
  end

  def self.proteins(array)
    array.include?('') ? reject_terminating_codons(array) : array
  end

  def self.reject_terminating_codons(array)
    terminating_index = array.find_index('')
    array.delete_if.with_index{ |codon, index| index >= terminating_index }
  end

  def self.codon_to_polypeptide(codon)
    polypeptide = case codon.upcase
                  when 'AUG' then 'Methionine'
                  when 'UUU', 'UUC' then 'Phenylalanine'
                  when 'UUA', 'UUG' then 'Leucine'
                  when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
                  when 'UAU', 'UAC' then 'Tyrosine'
                  when 'UGU', 'UGC' then 'Cysteine'
                  when 'UGG' then 'Tryptophan'
                  when 'UAA', 'UAG', 'UGA' then ''
                  else 'Oops! Something went wrong. Try again.'
                  end
    polypeptide
  end

  def self.not_valid
    'Not a valid RNA sequence.'
  end

  def self.multiple_of_three(string)
    string.length.%(3).zero?
  end

  def self.not_correct_chars
    'Input must be a codon.'
  end

  def self.codon_chars?(string)
   return false if string =~/[B,D-F,H-T,V-Z,b,d-f,h-t,v-z]+/
   true
  end


  def self.translate_to_codons(string)
    codons = string.chars.each_slice(3).map(&:join)
  end
end
