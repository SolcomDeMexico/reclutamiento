# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-openid-apps-discovery}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = %q{2010-05-17}
  s.description = %q{Extension to ruby-openid that enables discovery for Google Apps domains
}
  s.homepage = %q{http://code.google.com/p/ruby-openid-apps-discovery}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Google Apps support for ruby-openid}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-openid>, [">= 2.1.7"])
    else
      s.add_dependency(%q<ruby-openid>, [">= 2.1.7"])
    end
  else
    s.add_dependency(%q<ruby-openid>, [">= 2.1.7"])
  end
end