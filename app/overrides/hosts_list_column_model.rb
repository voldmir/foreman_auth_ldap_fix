# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'hosts/_list',
  name: 'hosts_list_column_model',
  replace: "td:contains('host.compute_resource_or_model')",
  text: "\n    <td class=\"hidden-tablet hidden-xs ellipsis\"><%= host.try(:organization) %></td>",
  original: '<td class="hidden-tablet hidden-xs ellipsis"><%= host.compute_resource_or_model %></td>'
)
