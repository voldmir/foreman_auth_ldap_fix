# frozen_string_literal: true

module ForemanAuthLdapFix
  module HostBaseExt
    extend ActiveSupport::Concern

    included do
      before_create do
        self.environment_id = Environment.ids.first if environment_id.blank?
      end
    end
  end
end
