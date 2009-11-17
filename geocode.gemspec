spec = Gem::Specification.new do |s|
  s.name = 'geocode'
  s.version = '0.1.0'
  s.date = '2009-11-17'
  s.summary = 'Geocoding library and CLI tool'
  s.email = "github@shinybit.com"
  s.homepage = "http://github.com/dbrady/geocode/"
  s.description = "geocode, a ruby library and command-line tool for geocoding addresses and reverse geocoding coordinates."
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "geocode"]
  s.executables = ["geocode"]
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.authors = ["David Brady"]
  s.add_dependency('trollop')
  s.add_dependency('json')


  # ruby -rpp -e "pp (Dir['{README,{examples,lib,protocol,spec}/**/*.{rdoc,json,rb,txt,xml,yml}}'] + Dir['bin/*']).map.sort"
  s.files = [
    "bin/geocode",
    "lib/geocode.rb",
    "lib/google_geocode.rb"
  ]
end

