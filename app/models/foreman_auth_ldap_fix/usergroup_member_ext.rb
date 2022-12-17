# frozen_string_literal: true

module ForemanAuthLdapFix
  module UsergroupMemberExt
    extend ActiveSupport::Concern

    def recache_memberships
      memberships = find_all_affected_memberships
      memberships = memberships.without(self) if destroyed?
      memberships.each(&:save)
    end
  end
end
