module ForemanAuthLdapFix
  module UsergroupsControllerExt
    extend ActiveSupport::Concern
    class_methods do
      def usergroup_params_filter
        super.tap do |filter|
          filter.permit :organization_ids => []
        end
      end
    end
  end
end
