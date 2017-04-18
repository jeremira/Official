module LessonsHelper

  def space_on number
    number.to_s.gsub(/\D/, '').reverse.gsub(/.{3}/,'\0 ').reverse
  end

  def color_by_income number
  end

end
