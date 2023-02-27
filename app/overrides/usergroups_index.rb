# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_users_title",
  :replace => "th:contains('Users')",
  :text => "\n    <th width=\"30%\"><%= _(\"Users\") %></th>",
  :original => "<th class=\"col-md-4\"><%= _(\"Users\") %></th>",
)

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_usergroups_title",
  :replace => "th:contains('User Groups')",
  :text => "\n    <th width=\"20%\"><%= _(\"User Groups\") %></th>",
  :original => "<th class=\"col-md-3\"><%= _(\"User Groups\") %></th>",
)

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_organizations_title",
  :insert_after => "th:contains('User Groups')",
  :text => "\n    <th class=\"20%\"><%= _(\"Organization\") %></th>",
  #  :original => "<th class=\"col-md-3\"><%= _(\"User Groups\") %></th>",
)

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_organizations_content",
  :insert_after => "td:contains('usergroup.usergroups')",
  :text => "\n    <td class=\"ellipsis\"><%= usergroup.organizations.map(&:name).to_sentence %></td>",
  #  :original => "<td class=\"ellipsis\"><%= usergroup.usergroups.map(&:name).to_sentence %></td>",
)

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_name_title",
  :replace => "th:contains('Usergroup|Name')",
  :text => "\n    <th width=\"15%\"><%= sort :name, :as => s_(\"Usergroup|Name\") %></th>",
  :original => "<th class=\"col-md-4\"><%= sort :name, :as => s_(\"Usergroup|Name\") %></th>",
)

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_actions_title",
  :replace => "th:contains('Actions')",
  :text => "\n    <th width=\"120px\"><%= _('Actions') %></th>",
  :original => "<th><%= _('Actions') %></th>",
)
