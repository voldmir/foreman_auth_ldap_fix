# frozen_string_literal: true

module ForemanAuthLdapFix
  module AuthSourceLdapExt
    extend ActiveSupport::Concern

    def update_usergroups(login)
      if use_user_login_for_service?
        logger.info "Skipping user group update for user #{login} as $login is in use, group sync is unsupported"
        return
      end

      unless usergroup_sync?
        logger.info "Skipping user group update for user #{login} as usergroup_sync is disabled"
        return
      end

      logger.debug "Updating user groups for user #{login}"
      user = User.unscoped.find_by_login(login)
      external = ldap_con.group_list(login).map(&:downcase)
      group_name_arel = ExternalUsergroup.arel_table[:name].lower

      # User's external user groups as of auth_source
      usergroup_ids = ExternalUsergroup.where(auth_source_id: id)
                                       .where(group_name_arel.in(external))
                                       .pluck(:usergroup_id)

      new_usergroup_ids = Usergroup.where(id: usergroup_ids.uniq).pluck(:id)
      current_usergroup_ids = user.usergroups.pluck(:id)
      user.usergroup_ids -= (current_usergroup_ids - new_usergroup_ids)
      user.usergroup_ids += (new_usergroup_ids - current_usergroup_ids)

      current_organization_ids = user.organization_ids

      new_organization_ids = user.usergroups.map do |usergroup|
        usergroup.organization_ids
      end.flatten.uniq

      user.organization_ids -= (current_organization_ids - new_organization_ids)
      user.organization_ids += (new_organization_ids - current_organization_ids)

      user.save
    end
  end
end
