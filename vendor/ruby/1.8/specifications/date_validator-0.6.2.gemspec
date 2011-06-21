# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{date_validator}
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Oriol Gual}, %q{Josep M. Bach}, %q{Josep Jaume Rey}]
  s.date = %q{2011-06-08}
  s.description = %q{A simple, ORM agnostic, Ruby 1.9 compatible date validator for Rails 3, based on ActiveModel. Currently supporting :after, :before, :after_or_equal_to and :before_or_equal_to options.}
  s.email = [%q{info@codegram.com}]
  s.homepage = %q{http://github.com/codegram/date_validator}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{date_validator}
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{A simple, ORM agnostic, Ruby 1.9 compatible date validator for Rails 3, based on ActiveModel.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, ["< 3.2.0", ">= 3.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0.0"])
      s.add_development_dependency(%q<tzinfo>, ["~> 0.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<bluecloth>, [">= 0"])
    else
      s.add_dependency(%q<activemodel>, ["< 3.2.0", ">= 3.0.0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.0"])
      s.add_dependency(%q<tzinfo>, ["~> 0.3.0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<bluecloth>, [">= 0"])
    end
  else
    s.add_dependency(%q<activemodel>, ["< 3.2.0", ">= 3.0.0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.0"])
    s.add_dependency(%q<tzinfo>, ["~> 0.3.0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<bluecloth>, [">= 0"])
  end
end
