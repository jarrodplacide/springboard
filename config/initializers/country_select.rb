CountrySelect::FORMATS[:with_alpha3] = lambda do |country|
  "#{country.name} (#{country.alpha3})"
end