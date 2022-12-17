# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'hosts/_list',
  name: 'hosts_list_column_model_title',
  replace: "th:contains('Model')",
  text: "\n    <th class=\"hidden-tablet hidden-xs\" width=\"20%\"><%= sort :organization, :as => _(\"Organization\") %></th>",
  original: "<th class=\"hidden-tablet hidden-xs\" width=\"10%\"><%= sort :model, :as => _('Model') %></th>"
)
