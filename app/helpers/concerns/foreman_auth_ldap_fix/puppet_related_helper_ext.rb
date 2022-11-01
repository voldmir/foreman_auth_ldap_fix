module ForemanAuthLdapFix
  module PuppetRelatedHelperExt
    extend ActiveSupport::Concern

    def puppet_host_title_actions(host)
      []
    end
  end
end
