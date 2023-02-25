module ForemanAuthLdapFix
  module UsergroupsControllerExt
    extend ActiveSupport::Concern
    include Foreman::Controller::Parameters::Taxonomix

    class_methods do
      def usergroup_params_filter
        Foreman::ParameterFilter.new(::Usergroup).tap do |filter|
          filter.permit :name,
                        :external_usergroups_attributes => [external_usergroup_params_filter],
                        :role_ids => [], :role_names => [],
                        :user_ids => [], :user_names => [],
                        :usergroup_ids => [], :usergroup_names => []

          add_taxonomix_params_filter(filter)

          filter.permit do |ctx|
            ctx.permit :admin if User.current.try(:admin?) && (ctx.ui? || ctx.api?)
          end
        end
      end
    end
  end
end
