Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlnamespace 'api' do
    namespace 'api' do
        namespace 'v1' do
      	     resources :goal do
                 resources :goal_tracker, path: 'tracker'
             end
             # namespace 'goal' do
             #     resources :tracker
             # end
      	end
    end
end
