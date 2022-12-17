# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_hostgroup",
  replace: "td:contains('host.hostgroup')",
  text: "\n    <td class=\"hidden-tablet hidden-xs\"><%= host.hostgroup.name %></td>",
  original: '<td class="hidden-tablet hidden-xs"><%= label_with_link host.hostgroup, 23, @hostgroup_authorizer %></td>',
)
