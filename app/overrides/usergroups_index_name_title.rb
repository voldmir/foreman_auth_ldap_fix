# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_name_title",
  :replace => "th:contains('Usergroup|Name')",
  :text => "\n    <th width=\"15%\"><%= sort :name, :as => s_(\"Usergroup|Name\") %></th>",
  :original => "<th class=\"col-md-4\"><%= sort :name, :as => s_(\"Usergroup|Name\") %></th>",
)
