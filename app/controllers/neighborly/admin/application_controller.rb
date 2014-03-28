module Neighborly::Admin
  def self.policy_class
    AdminPolicy
  end

  class ApplicationController < ::ApplicationController
    inherit_resources

    before_filter do
      authorize Neighborly::Admin, :access?
    end

    def update
      update! do |format|
        if resource.errors.empty?
          format.json { respond_with_bip(resource) }
        else
          format.html { render action: 'edit' }
          format.json { respond_with_bip(resource) }
        end
      end
    end
  end
end