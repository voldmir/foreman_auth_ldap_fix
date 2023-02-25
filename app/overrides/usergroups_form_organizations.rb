# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "usergroups/_form",
  :name => "content_organizations",
  :insert_before => "div#roles",
  :text => "\n  <div class=\"tab-pane\" id=\"organizations\">
                <%= multiple_checkboxes f, :organizations, f.object, User.current.my_organizations, { :label => _(\"Organizations\") } %>  
                </div>",
  #  :original => "<div class=\"tab-pane\" id=\"role\">",
)
