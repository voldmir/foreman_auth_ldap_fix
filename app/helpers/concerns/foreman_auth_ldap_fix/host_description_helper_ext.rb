module ForemanAuthLdapFix
  module HostDescriptionHelperExt
    extend ActiveSupport::Concern

    def base_multiple_actions
      actions = []
      if authorized_for(:controller => :hosts, :action => :edit)
        actions.concat [
          { :action => [_("Change Group"), select_multiple_hostgroup_hosts_path], :priority => 100 },
          { :action => [_("Change Environment"), select_multiple_environment_hosts_path], :priority => 200 },
        ]

        actions << { :action => [_("Assign Organization"), select_multiple_organization_hosts_path], :priority => 800 }
        actions << { :action => [_("Assign Location"), select_multiple_location_hosts_path], :priority => 900 }
        actions << { :action => [_("Change Owner"), select_multiple_owner_hosts_path], :priority => 1000 } if SETTINGS[:login]
      end
      actions
    end

    def base_host_overview_fields(host)
      fields = []
      fields << { :field => [_("Domain"), link_to(host.domain, hosts_path(:search => "domain = #{host.domain}"))], :priority => 100 } if host.domain.present?
      fields << { :field => [_("Realm"), link_to(host.realm, hosts_path(:search => "realm = #{host.realm}"))], :priority => 200 } if host.realm.present?
      fields << { :field => [_("IP Address"), host.ip], :priority => 300 } if host.ip.present?
      fields << { :field => [_("IPv6 Address"), host.ip6], :priority => 400 } if host.ip6.present?
      fields << { :field => [_("Comment"), host.comment], :priority => 500 } if host.comment.present?
      fields << { :field => [_("MAC Address"), host.mac], :priority => 600 } if host.mac.present?
      fields << { :field => [_("Architecture"), link_to(host.arch, hosts_path(:search => "architecture = #{host.arch}"))], :priority => 700 } if host.arch.present?
      fields << { :field => [_("Operating System"), link_to(host.operatingsystem.to_label, hosts_path(:search => "os_description = #{host.operatingsystem.description}"))], :priority => 800 } if host.operatingsystem.present?

      fields << { :field => [_("Host group"), link_to(host.hostgroup, hosts_path(:search => %{hostgroup_title = "#{host.hostgroup}"}))], :priority => 1000 } if host.hostgroup.present?
      fields << { :field => [_("Boot time"), (boot_time = host&.reported_data&.boot_time) ? date_time_relative(boot_time) : _("Not reported")], :priority => 1100 }
      fields << { :field => [_("Location"), link_to(host.location.title, hosts_path(:search => "location = #{host.location}"))], :priority => 1200 } if host.location.present?
      fields << { :field => [_("Organization"), link_to(host.organization.title, hosts_path(:search => "organization = #{host.organization}"))], :priority => 1300 } if host.organization.present?
      if host.owner_type == "User"
        fields << { :field => [_("Owner"), (link_to(host.owner, hosts_path(:search => %{user.login = "#{host.owner.login}"})) if host.owner)], :priority => 1400 }
      else
        fields << { :field => [_("Owner"), host.owner], :priority => 1400 }
      end
      fields
    end

    def base_host_title_actions(host)
      [
        {
          :action => button_group(
            link_to_if_authorized(_("Edit"), hash_for_edit_host_path(:id => host).merge(:auth_object => host),
                                  :title => _("Edit this host"), :id => "edit-button", :class => "btn btn-default")
          ),
          :priority => 100,
        },
        {
          :action => button_group(
            link_to_if_authorized(_("Delete"), hash_for_host_path(:id => host).merge(:auth_object => host, :permission => "destroy_hosts"),
                                  :class => "btn btn-danger",
                                  :id => "delete-button",
                                  :data => { :message => delete_host_dialog(host) },
                                  :method => :delete)
          ),
          :priority => 300,
        },
      ].compact
    end
  end
end
