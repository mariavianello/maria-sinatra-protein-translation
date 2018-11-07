class Validator
  def self.multiple_of_three(string)
    string.length.%(3).zero?
  end

  def self.codon_chars?(string)
   return false if string =~/[B,D-F,H-T,V-Z,b,d-f,h-t,v-z]+/
   true
  end
end
