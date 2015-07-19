# == Route Map
#
#                                   Prefix Verb      URI Pattern                                                           Controller#Action
#                                     root GET       /                                                                     static_pages#home
#                          student_parents POST      /student/parents(.:format)                                            student/parents#create
#                           student_parent PATCH     /student/parents/:id(.:format)                                        student/parents#update
#                                          PUT       /student/parents/:id(.:format)                                        student/parents#update
#                                          DELETE    /student/parents/:id(.:format)                                        student/parents#destroy
#                 register_student_subject POST      /student/subjects/:id/register(.:format)                              student/subjects#register
#                  payment_student_subject GET       /student/subjects/:id/payment(.:format)                               student/subjects#payment
#                 student_subject_sections POST      /student/subjects/:subject_id/sections(.:format)                      student/sections#create
#              new_student_subject_section GET       /student/subjects/:subject_id/sections/new(.:format)                  student/sections#new
#                  student_subject_section GET       /student/subjects/:subject_id/sections/:id(.:format)                  student/sections#show
#          student_subject_offline_payment POST      /student/subjects/:subject_id/payments/offline-payment(.:format)      student/payments#offline_payment
#     student_subject_offline_payment_info GET       /student/subjects/:subject_id/payments/offline-payment-info(.:format) student/payments#offline_payment_information
#    student_subject_register_payment_info PATCH|PUT /student/subjects/:subject_id/payments/register-payment/:id(.:format) student/payments#register_payment_information
#                         student_subjects GET       /student/subjects(.:format)                                           student/subjects#index
#                                          POST      /student/subjects(.:format)                                           student/subjects#create
#                      new_student_subject GET       /student/subjects/new(.:format)                                       student/subjects#new
#            student_verification_required GET       /student/verification_required(.:format)                              student/static_pages#verification_required
# student_password_reset_instructions_sent GET       /student/password-reset-instructions-sent(.:format)                   student/static_pages#password_reset
#                           student_portal GET       /student/portal(.:format)                                             student/portal#home
#              student_new_student_profile GET       /student/portal/new-student-profile(.:format)                         student/portal#edit_profile
#    student_portal_update_student_profile PATCH|PUT /student/portal/update-student-profile(.:format)                      student/portal#update_profile
#       student_new_parent_for_new_profile GET       /student/portal/add-parent-to-student(.:format)                       student/portal#new_parent_for_new_profile
#    student_create_parent_for_new_profile POST      /student/portal/create-parent-to-student(.:format)                    student/portal#create_parent_for_new_profile
#                     student_show_profile GET       /student/portal/my-profile(.:format)                                  student/portal#show_profile
#                   student_update_profile GET       /student/portal/update-profile(.:format)                              student/portal#update_profile
#                      new_student_session GET       /login(.:format)                                                      students/sessions#new
#                          student_session POST      /login(.:format)                                                      students/sessions#create
#                  destroy_student_session DELETE    /logout(.:format)                                                     students/sessions#destroy
#                         student_password POST      /password(.:format)                                                   students/passwords#create
#                     new_student_password GET       /password/new(.:format)                                               students/passwords#new
#                    edit_student_password GET       /password/edit(.:format)                                              students/passwords#edit
#                                          PATCH     /password(.:format)                                                   students/passwords#update
#                                          PUT       /password(.:format)                                                   students/passwords#update
#              cancel_student_registration GET       /registration/cancel(.:format)                                        students/registrations#cancel
#                     student_registration POST      /registration(.:format)                                               students/registrations#create
#                 new_student_registration GET       /registration/register(.:format)                                      students/registrations#new
#                edit_student_registration GET       /registration/edit(.:format)                                          students/registrations#edit
#                                          PATCH     /registration(.:format)                                               students/registrations#update
#                                          PUT       /registration(.:format)                                               students/registrations#update
#                                          DELETE    /registration(.:format)                                               students/registrations#destroy
#                     student_confirmation POST      /verify(.:format)                                                     students/confirmations#create
#                 new_student_confirmation GET       /verify/new(.:format)                                                 students/confirmations#new
#                                          GET       /verify(.:format)                                                     students/confirmations#show
#                           student_unlock POST      /unlock(.:format)                                                     students/unlocks#create
#                       new_student_unlock GET       /unlock/new(.:format)                                                 students/unlocks#new
#                                          GET       /unlock(.:format)                                                     students/unlocks#show
#                                 register GET       /register(.:format)                                                   students/registrations#new
#                           reset_password GET       /reset-password(.:format)                                             students/passwords#new
#                   new_instructor_session GET       /instructors/sign_in(.:format)                                        devise/sessions#new
#                       instructor_session POST      /instructors/sign_in(.:format)                                        devise/sessions#create
#               destroy_instructor_session DELETE    /instructors/sign_out(.:format)                                       devise/sessions#destroy
#                      instructor_password POST      /instructors/password(.:format)                                       devise/passwords#create
#                  new_instructor_password GET       /instructors/password/new(.:format)                                   devise/passwords#new
#                 edit_instructor_password GET       /instructors/password/edit(.:format)                                  devise/passwords#edit
#                                          PATCH     /instructors/password(.:format)                                       devise/passwords#update
#                                          PUT       /instructors/password(.:format)                                       devise/passwords#update
#           cancel_instructor_registration GET       /instructors/cancel(.:format)                                         devise/registrations#cancel
#                  instructor_registration POST      /instructors(.:format)                                                devise/registrations#create
#              new_instructor_registration GET       /instructors/sign_up(.:format)                                        devise/registrations#new
#             edit_instructor_registration GET       /instructors/edit(.:format)                                           devise/registrations#edit
#                                          PATCH     /instructors(.:format)                                                devise/registrations#update
#                                          PUT       /instructors(.:format)                                                devise/registrations#update
#                                          DELETE    /instructors(.:format)                                                devise/registrations#destroy
#                        instructor_unlock POST      /instructors/unlock(.:format)                                         devise/unlocks#create
#                    new_instructor_unlock GET       /instructors/unlock/new(.:format)                                     devise/unlocks#new
#                                          GET       /instructors/unlock(.:format)                                         devise/unlocks#show
#                               admin_root GET       /admin(.:format)                                                      admin/static_pages#home
#               open_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/open(.:format)               admin/sections#open
#              close_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/close(.:format)              admin/sections#close
#                   admin_subject_sections GET       /admin/subjects/:subject_id/sections(.:format)                        admin/sections#index
#                                          POST      /admin/subjects/:subject_id/sections(.:format)                        admin/sections#create
#                new_admin_subject_section GET       /admin/subjects/:subject_id/sections/new(.:format)                    admin/sections#new
#               edit_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/edit(.:format)               admin/sections#edit
#                    admin_subject_section GET       /admin/subjects/:subject_id/sections/:id(.:format)                    admin/sections#show
#                                          PATCH     /admin/subjects/:subject_id/sections/:id(.:format)                    admin/sections#update
#                                          PUT       /admin/subjects/:subject_id/sections/:id(.:format)                    admin/sections#update
#                                          DELETE    /admin/subjects/:subject_id/sections/:id(.:format)                    admin/sections#destroy
#                           admin_subjects GET       /admin/subjects(.:format)                                             admin/subjects#index
#                                          POST      /admin/subjects(.:format)                                             admin/subjects#create
#                        new_admin_subject GET       /admin/subjects/new(.:format)                                         admin/subjects#new
#                       edit_admin_subject GET       /admin/subjects/:id/edit(.:format)                                    admin/subjects#edit
#                            admin_subject GET       /admin/subjects/:id(.:format)                                         admin/subjects#show
#                                          PATCH     /admin/subjects/:id(.:format)                                         admin/subjects#update
#                                          PUT       /admin/subjects/:id(.:format)                                         admin/subjects#update
#                                          DELETE    /admin/subjects/:id(.:format)                                         admin/subjects#destroy
#                sections_admin_instructor GET       /admin/instructors/:id/sections(.:format)                             admin/instructors#sections
#                        admin_instructors GET       /admin/instructors(.:format)                                          admin/instructors#index
#                                          POST      /admin/instructors(.:format)                                          admin/instructors#create
#                     new_admin_instructor GET       /admin/instructors/new(.:format)                                      admin/instructors#new
#                    edit_admin_instructor GET       /admin/instructors/:id/edit(.:format)                                 admin/instructors#edit
#                         admin_instructor GET       /admin/instructors/:id(.:format)                                      admin/instructors#show
#                                          PATCH     /admin/instructors/:id(.:format)                                      admin/instructors#update
#                                          PUT       /admin/instructors/:id(.:format)                                      admin/instructors#update
#                                          DELETE    /admin/instructors/:id(.:format)                                      admin/instructors#destroy
#                   admin_offline_payments GET       /admin/payments/offline-payments(.:format)                            admin/payments#offline_payments
#             admin_verify_offline_payment POST      /admin/payments/:id/verify-offline-payment(.:format)                  admin/payments#verify_offline_payment
#             admin_cancel_offline_payment POST      /admin/payments/:id/cancel(.:format)                                  admin/payments#cancel_payment
#               admin_offline_payment_info GET       /admin/payments/:id/offline-payment-info(.:format)                    admin/payments#offline_payment_information
#           admin_complete_offline_payment PATCH|PUT /admin/payments/:id/complete-offline-payment(.:format)                admin/payments#complete_offline_payment
#

Rails.application.routes.draw do

  root 'static_pages#home'

  namespace :student do
    resources :parents, only: [:create, :update, :destroy]
    resources :subjects, only: [:new, :create, :index] do
      member do
        post 'register'
        get 'payment'
      end
      resources :sections, only: [:new, :create, :show]
      post 'payments/offline-payment', to: 'payments#offline_payment', as: :offline_payment
      get 'payments/offline-payment-info', to: 'payments#offline_payment_information', as: :offline_payment_info
      match 'payments/register-payment/:id', to: 'payments#register_payment_information', as: :register_payment_info, via: [:patch, :put]
    end
    get 'verification_required' => 'static_pages#verification_required'
    get 'password-reset-instructions-sent' => 'static_pages#password_reset'
    get 'portal/' => 'portal#home'
    get 'portal/new-student-profile' => 'portal#edit_profile', as: :new_student_profile
    match 'portal/update-student-profile', to: 'portal#update_profile', via: [:patch, :put]
    get 'portal/add-parent-to-student', to: 'portal#new_parent_for_new_profile', as: :new_parent_for_new_profile
    post 'portal/create-parent-to-student', to: 'portal#create_parent_for_new_profile', as: :create_parent_for_new_profile
    get 'portal/my-profile', to: 'portal#show_profile', as: :show_profile
    get 'portal/update-profile', to: 'portal#update_profile', as: :update_profile
  end

  devise_for :students,
             controllers: {
                 sessions: 'students/sessions',
                 confirmations: 'students/confirmations',
                 passwords: 'students/passwords',
                 registrations: 'students/registrations',
                 unlocks: 'students/unlocks'
             },
             path: '/',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 confirmation: 'verify',
                 registration: 'registration',
                 sign_up: 'register'
             }
  devise_scope :student do
    get 'register', to: 'students/registrations#new'
    get 'reset-password', to: 'students/passwords#new'
  end
  devise_for :instructors
  namespace :admin do
    root :to => 'static_pages#home'
    resources :subjects do
      resources :sections do
        member do
          get 'open'
          get 'close'
        end
      end
    end
    resources :instructors do
      member do
        get 'sections'
      end
    end
    get 'payments/offline-payments', to: 'payments#offline_payments', as: :offline_payments
    post 'payments/:id/verify-offline-payment', to: 'payments#verify_offline_payment', as: :verify_offline_payment
    post 'payments/:id/cancel', to: 'payments#cancel_payment', as: :cancel_offline_payment
    get 'payments/:id/offline-payment-info', to: 'payments#offline_payment_information', as: :offline_payment_info
    match 'payments/:id/complete-offline-payment', to: 'payments#complete_offline_payment', as: :complete_offline_payment, via: [:patch, :put]
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
