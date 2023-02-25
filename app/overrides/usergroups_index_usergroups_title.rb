# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_usergroups_title",
  :replace => "th:contains('User Groups')",
  :text => "\n    <th width=\"20%\"><%= _(\"User Groups\") %></th>",
  :original => "<th class=\"col-md-3\"><%= _(\"User Groups\") %></th>",
)
