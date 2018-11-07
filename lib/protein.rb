class Protein
  def self.rna_to_polypeptides(string)
    return _not_valid if !_multiple_of_three(string)

    return _not_correct_chars if !_codon_chars?(string)

    codon_array = _translate_to_codons(string)

    updated_codon_array = _translate_to_polypeptide(codon_array)

    _proteins(updated_codon_array)
  end

  private

  def self._not_valid
    ProteinUtils.not_valid
  end

  def self._multiple_of_three(string)
    ProteinUtils.multiple_of_three(string)
  end

  def self._not_correct_chars
    ProteinUtils.not_correct_chars
  end

  def self._codon_chars?(string)
    ProteinUtils.codon_chars?(string)
  end

  def self._translate_to_codons(string)
    ProteinUtils.translate_to_codons(string)
  end

  def self._translate_to_polypeptide(codon_array)
    ProteinUtils.translate_to_polypeptide(codon_array)
  end

  def self._proteins(updated_codon_array)
    ProteinUtils.proteins(updated_codon_array)
  end
end
