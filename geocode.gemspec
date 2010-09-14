spec = Gem::Specification.new do |s|
  s.name = 'geocode'
  s.version = '0.2.1'
  s.date = '2010-09-14'
  s.summary = 'Geocoding library and CLI tool'
  s.email = "github@shinybit.com"
  s.homepage = "http://github.com/dbrady/geocode/"
  s.description = "geocode, a ruby library and command-line tool for geocoding addresses and reverse geocoding coordinates."
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "geocode"]
  s.executables = ["geocode"]
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE", "CHANGELOG.rdoc"]
  s.authors = ["David Brady"]
  s.add_dependency('trollop')
  s.add_dependency('json')


  # ruby -rpp -e "pp (Dir['{README*,*LICENSE*,CHANGELOG*,{examples,lib,protocol,spec}/**/*.{rdoc,json,rb,txt,xml,yml}}'] + Dir['bin/*']).map.sort"
  s.files = [
    "CHANGELOG.rdoc",
    "MIT-LICENSE",
    "README.rdoc",
    "bin/geocode",
    "lib/geocode.rb",
    "lib/google_geocode.rb"
  ]
end

