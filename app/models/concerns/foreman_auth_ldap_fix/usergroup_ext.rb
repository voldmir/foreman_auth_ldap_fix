module ForemanAuthLdapFix
  module UsergroupExt
    extend ActiveSupport::Concern

    included do
      has_many :taxable_taxonomies, :dependent => :destroy, :as => :taxable
      has_many :organizations, -> { where(:type => "Organization") },
               :through => :taxable_taxonomies, :source => :taxonomy, :validate => false
    end
  end
end
