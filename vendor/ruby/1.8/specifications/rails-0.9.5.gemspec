# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails}
  s.version = "0.9.5"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = [%q{David Heinemeier Hansson}]
  s.cert_chain = nil
  s.date = %q{2005-01-25}
  s.description = %q{Rails is a framework for building web-application using CGI, FCGI, mod_ruby, or WEBrick on top of either MySQL, PostgreSQL, or SQLite with eRuby-based templates.}
  s.email = %q{david@loudthinking.com}
  s.executables = [%q{rails}]
  s.files = [%q{bin/rails}]
  s.homepage = %q{http://www.rubyonrails.org}
  s.require_paths = [%q{lib}]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{rails}
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Web-application framework with template engine, control-flow layer, and ORM.}

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.4.15"])
      s.add_runtime_dependency(%q<activerecord>, [">= 1.6.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 1.4.0"])
      s.add_runtime_dependency(%q<actionmailer>, [">= 0.6.1"])
    else
      s.add_dependency(%q<rake>, [">= 0.4.15"])
      s.add_dependency(%q<activerecord>, [">= 1.6.0"])
      s.add_dependency(%q<actionpack>, [">= 1.4.0"])
      s.add_dependency(%q<actionmailer>, [">= 0.6.1"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.4.15"])
    s.add_dependency(%q<activerecord>, [">= 1.6.0"])
    s.add_dependency(%q<actionpack>, [">= 1.4.0"])
    s.add_dependency(%q<actionmailer>, [">= 0.6.1"])
  end
end
