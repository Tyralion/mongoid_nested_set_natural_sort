# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_nested_set_natural_sort/version'

Gem::Specification.new do |spec|

  spec.name          = "mongoid_nested_set_natural_sort"
  spec.version       = MongoidNestedSetNaturalSort::VERSION
  spec.authors       = ["Ivan Piliaev (Tyralion)"]
  spec.email         = ["piliaiev@gmail.com"]
  spec.license       = "BSD"

  spec.summary       = %q{Natural sorting for mongoid nestes set.}
  spec.description   = %q{Natural sorting for mongoid nestes set.}
  spec.homepage      = "https://github.com/dancingbytes/mongoid_nested_set_natural_sort"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0'

  spec.add_runtime_dependency  'naturalsorter'

end
