# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails3-jquery-autocomplete}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{David Padilla}]
  s.date = %q{2010-12-05}
  s.description = %q{Use jQuery's autocomplete plugin with Rails 3.}
  s.email = %q{david.padilla@crowdint.com}
  s.extra_rdoc_files = [%q{LICENSE}, %q{README.markdown}]
  s.files = [%q{LICENSE}, %q{README.markdown}]
  s.homepage = %q{http://github.com/crowdint/rails3-jquery-autocomplete}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Use jQuery's autocomplete plugin with Rails 3.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end
