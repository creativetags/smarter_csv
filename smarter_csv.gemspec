# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.expand_path('lib/smarter_csv/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = "smarter_csv"
  spec.version       = SmarterCSV::VERSION
  spec.required_ruby_version = ">= 2.5"

  spec.authors       = ["Tilo Sloboda\n"]
  spec.email         = ["tilo.sloboda@gmail.com\n"]

  spec.summary       = 'Ruby Gem for smarter importing of CSV Files (and CSV-like files), with lots of optional features, e.g. chunked processing for huge CSV files'
  spec.description   = 'Ruby Gem for smarter importing of CSV Files as Array(s) of Hashes, with optional features for processing large files in parallel, embedded comments, unusual field- and record-separators, flexible mapping of CSV-headers to Hash-keys'
  spec.homepage      = "https://github.com/tilo/smarter_csv"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.requirements  = ['csv'] # for CSV.parse() only needed in case we have quoted fields
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  # spec.add_development_dependency "guard-rspec"
end
