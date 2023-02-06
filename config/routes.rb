Rails.application.routes.draw do
  root to: 'pages#home'

  get 'reports/trial_balance'
  get 'reports/income_statement'
  get 'reports/balance_sheet'

  devise_for :users

	resources :accounting_codes

	resources :accounting_entries do
		resources :journal_entries, only: [:new, :create, :edit, :update]
	end	
	resources :journal_entries, only: [:show, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
