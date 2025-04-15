def balanced?(str)
  just_parens = str.delete('^()')

  loop do
    just_parens.include?('()') ? just_parens.gsub!('()', '') : break
  end

  just_parens.empty?
end
