# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_organizations_title",
  :insert_after => "th:contains('User Groups')",
  :text => "\n    <th class=\"20%\"><%= _(\"Organization\") %></th>",
  #  :original => "<th class=\"col-md-3\"><%= _(\"User Groups\") %></th>",
)
