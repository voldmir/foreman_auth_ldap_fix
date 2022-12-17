# frozen_string_literal: true

module ForemanAuthLdapFix
  module PuppetRelatedHelperExt
    extend ActiveSupport::Concern

    def puppet_host_title_actions(_host)
      []
    end
  end
end
