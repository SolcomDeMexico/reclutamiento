# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{date_validator}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Oriol Gual}, %q{Josep Jaume Rey}, %q{Josep Mª Bach}]
  s.date = %q{2010-04-25}
  s.description = %q{A simple date validator for Rails 3. Currently supporting :after, :before, :after_or_equal_to and :before_or_equal_to options. Remarkable-friendly :)}
  s.email = %q{info@codegram.com}
  s.extra_rdoc_files = [%q{LICENSE}, %q{README.rdoc}]
  s.files = [%q{LICENSE}, %q{README.rdoc}]
  s.homepage = %q{http://github.com/codegram/date_validator}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{A simple date validator for Rails 3.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
