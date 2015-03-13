Gem::Specification.new do |s|
  s.name    = 'ampl_matrix_parse'
  s.version = '0.0.1'
  s.date    = '2015-03-13'
  s.summary = 'Parse AMPL output into more useful data structures'
  s.authors = ['Jonathan Chapman', 'Amy Givler']
  s.email   = 'glitch@glitchwrks.com'
  s.files   = Dir['LICENSE', 'README.md', '{lib}/**/*']
  s.LICENSE = 'GPLv3'

  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
end