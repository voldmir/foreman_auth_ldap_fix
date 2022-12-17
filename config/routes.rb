# frozen_string_literal: true

Rails.application.routes.draw do
  unless SETTINGS[:unattended]
    resources :operatingsystems do
      collection do
        get 'auto_complete_search'
      end
    end
  end
end
