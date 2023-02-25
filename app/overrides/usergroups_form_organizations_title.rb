# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/_form",
  :name => "content_organizations_title",
  :insert_after => "li.active",
  :text => "\n  <li><a href=\"#organizations\" data-toggle=\"tab\"><%= _(\"Organizations\") %></a></li>",
  #  :original => "<li class=\"active\"><a href=\"#primary\" data-toggle=\"tab\"><%= _(\"User Group\") %></a></li>",
)
