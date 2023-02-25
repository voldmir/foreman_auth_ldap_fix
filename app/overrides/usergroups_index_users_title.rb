# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_users_title",
  :replace => "th:contains('Users')",
  :text => "\n    <th width=\"30%\"><%= _(\"Users\") %></th>",
  :original => "<th class=\"col-md-4\"><%= _(\"Users\") %></th>",
)
