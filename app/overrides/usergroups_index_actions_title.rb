# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_actions_title",
  :replace => "th:contains('Actions')",
  :text => "\n    <th width=\"120px\"><%= _('Actions') %></th>",
  :original => "<th><%= _('Actions') %></th>",
)
