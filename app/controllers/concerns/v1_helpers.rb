module V1Helpers 
  extend ActiveSupport::Concern

  included do
    def v1_url(options = [])
      url_for([:v1] + options)
    end
  end
end
