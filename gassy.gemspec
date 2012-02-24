# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gassy/version"

Gem::Specification.new do |s|
  s.name        = "gassy"
  s.version     = Gassy::VERSION
  s.authors     = ["Matt Lucas"]
  s.email       = ["matt.k.lucas@gmail.com"]
  s.summary     = %q{Gas Price Retrieval Gem}
  s.description = %q{This gem will gather weekly gas prices from the U.S. Energy Information Information site}
  s.homepage    = "https://github.com/bballer320xu/Gassy"


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"

end
