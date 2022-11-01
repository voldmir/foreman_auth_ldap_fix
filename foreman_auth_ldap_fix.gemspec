$LOAD_PATH.push File.expand_path("lib", __dir__)

require_relative "lib/foreman_auth_ldap_fix/version"

Gem::Specification.new do |s|
  s.name = "foreman_auth_ldap_fix"
  s.version = ForemanAuthLdapFix::VERSION
  s.authors = ["Vladimir Savchenko"]
  s.email = ["voldmir@mail.ru"]

  s.description = "Plugin for fix Foreman."
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir["{app,lib,config,locale}/**/*"] + ["README.md"]
  s.homepage = "https://github.com/voldmir/foreman_auth_ldap_fix"
  s.license = "GPL-3.0"
  s.summary = "Plugin fix."
  s.test_files = Dir["spec/**/*"]
  s.add_runtime_dependency "deface"
end
