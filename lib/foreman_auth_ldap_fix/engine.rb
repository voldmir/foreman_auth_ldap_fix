require "deface"

module ForemanAuthLdapFix
  class Engine < ::Rails::Engine
    engine_name "foreman_auth_ldap_fix"

    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir['#{config.root}/app/models']
    config.autoload_paths += Dir['#{config.root}/app/overrides']

    initializer "foreman_auth_ldap_fix.register_gettext",
                :after => :load_config_initializers do
      locale_dir = File.join(File.expand_path("../..", __dir__), "locale")
      locale_domain = "foreman_auth_ldap_fix"

      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    initializer "foreman_auth_ldap_fix.register_plugin", :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_auth_ldap_fix do
        requires_foreman "~> 1.24"
      end
    end

    config.to_prepare do
      begin
        ::PuppetRelatedHelper.send(:prepend, ForemanAuthLdapFix::PuppetRelatedHelperExt)
        ::HostDescriptionHelper.send(:prepend, ForemanAuthLdapFix::HostDescriptionHelperExt)
        ::Host::Base.send(:include, ForemanAuthLdapFix::HostBaseExt)
        ::UsergroupMember.send(:prepend, ForemanAuthLdapFix::UsergroupMemberExt)
        ::AuthSourceLdap.send(:prepend, ForemanAuthLdapFix::AuthSourceLdapExt)
      rescue => e
        Rails.logger.warn "ForemanAuthLdapFix: skipping engine hook (#{e})"
      end
    end
  end
end
