#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'fileutils'
require "rubygems/package_task"

# require 'rake/extensiontask'

# Rake::ExtensionTask.new('smarter_csv') do |ext|
#   ext.ext_dir = 'ext/smarter_csv'
# end

# --------------------------------------------------------------------------
# SMARTER_CSV_SPEC = Bundler.load_gemspec("smarter_csv.gemspec")
# exttask = Rake::ExtensionTask.new('smarter_csv', SMARTER_CSV_SPEC) do |ext|
#   ext.cross_compile = true
#   ext.cross_platform = %w[x86-mingw32 x64-mingw32 x86-linux x86_64-linux]
# end

require 'smarter_csv'

desc "Run RSpec"
RSpec::Core::RakeTask.new do |t|
  # t.verbose = false
end

task :test => :spec

task :clean do
  cd "ext/smarter_csv"
  sh "rm -f Makefile"
  sh "rm -f smarter_csv.o"
  sh "rm -f smarter_csv.bundle"
  cd "../.."
end

task :create_makefile do
  cd "ext/smarter_csv"
  sh "ruby extconf.rb"
  cd "../.."
end

task :compile do
  cd "ext/smarter_csv"
  sh "ruby extconf.rb"
  sh "make"
  cd "../.."
end

task default: [:create_makefile, :compile, :spec]
