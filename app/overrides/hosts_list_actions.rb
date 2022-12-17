# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'hosts/_list',
  name: 'hosts_list_actions',
  replace: "erb[loud]:contains('action_buttons')",
  text: '<%= action_buttons(link_to(_("Properties"), host_path(host))) %> ',
  original: "<%= action_buttons(
                            display_link_if_authorized(_(\"Edit\"), hash_for_edit_host_path(:id => host).merge(:auth_object => host, :authorizer => authorizer)),
                            display_link_if_authorized(_(\"Clone\"), hash_for_clone_host_path(:id => host)),
                            display_delete_if_authorized(hash_for_host_path(:id => host).merge(:auth_object => host, :authorizer => authorizer), :data => { :confirm => delete_host_dialog(host) }, :action => :destroy))%>"
)
