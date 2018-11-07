class Protein
  def self.rna_to_polypeptides(string)
    return Response.not_valid if !Validator.multiple_of_three(string)

    return Response.not_correct_chars if !Validator.codon_chars?(string)

    codon_array = Polypeptide.translate_to_codons(string)

    updated_codon_array = Polypeptide.translate_to_polypeptide(codon_array)

    Polypeptide.returns_proteins_before_stop_codons(updated_codon_array)
  end
end
