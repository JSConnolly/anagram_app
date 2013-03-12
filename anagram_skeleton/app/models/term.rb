class Term < ActiveRecord::Base
  
  def is_anagram?(term)
    if term.downcase.strip.split(' ').sort == self[:name].strip.split(' ').sort
      return true
    else
      return false
    end
  end

end
