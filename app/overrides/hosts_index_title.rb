# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'hosts/index',
  name: 'hosts_index_title',
  replace: "erb[silent]:contains('title_actions')",
  text: '<% title_actions multiple_actions_select, csv_link, button_group() %>',
  original: '<% title_actions multiple_actions_select, csv_link, button_group(new_link(_("Create Host"))) %>'
)
