# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tempfile_for/version"

Gem::Specification.new do |s|
  s.license     = "MIT"
  s.name        = "tempfile_for"
  s.version     = TempfileFor::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.summary     = %q{Create temporary files for in-memory data}
  s.description = %q{Create temporary files for in-memory data}
  s.homepage    = "https://github.com/mrkamel/tempfile_for"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "bundler"
end

