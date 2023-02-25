# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/index",
  :name => "usergroups_index_organizations_content",
  :insert_after => "td:contains('usergroup.usergroups')",
  :text => "\n    <td class=\"ellipsis\"><%= usergroup.organizations.map(&:name).to_sentence %></td>",
  #  :original => "<td class=\"ellipsis\"><%= usergroup.usergroups.map(&:name).to_sentence %></td>",
)
