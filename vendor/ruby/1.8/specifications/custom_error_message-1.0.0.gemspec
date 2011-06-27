# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{custom_error_message}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{David Easley}, %q{Jeremy Durham}]
  s.date = %q{2009-12-11}
  s.description = %q{This plugin gives you the option to not have your custom validation error message
prefixed with the attribute name}
  s.email = %q{jeremydurham@gmail.com}
  s.extra_rdoc_files = [%q{README}, %q{MIT-LICENSE}]
  s.files = [%q{README}, %q{MIT-LICENSE}]
  s.homepage = %q{http://github.com/jeremydurham/custom-err-msg}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Custom Error Message plugin for Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
