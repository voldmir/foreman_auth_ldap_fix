# frozen_string_literal: true

require "deface"

module ForemanAuthLdapFix
  class Engine < ::Rails::Engine
    engine_name "foreman_auth_ldap_fix"

    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    initializer "foreman_auth_ldap_fix.register_plugin", before: :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_auth_ldap_fix do
        requires_foreman "~> 1.24"
      end
    end

    config.to_prepare do
      ::Host::Base.include ForemanAuthLdapFix::HostBaseExt
      ::UsergroupMember.prepend ForemanAuthLdapFix::UsergroupMemberExt
      ::AuthSourceLdap.prepend ForemanAuthLdapFix::AuthSourceLdapExt
      ::Usergroup.include ForemanAuthLdapFix::UsergroupExt
      ::UsergroupsController.include ForemanAuthLdapFix::UsergroupsControllerExt
    rescue StandardError => e
      Rails.logger.warn "ForemanAuthLdapFix: skipping engine hook (#{e})"
    end
  end
end
