# == Route Map
#
#                                                           Prefix Verb      URI Pattern                                                                                                                                       Controller#Action
#                                               new_parent_session GET       /parents/sign_in(.:format)                                                                                                                        devise/sessions#new
#                                                   parent_session POST      /parents/sign_in(.:format)                                                                                                                        devise/sessions#create
#                                           destroy_parent_session DELETE    /parents/sign_out(.:format)                                                                                                                       devise/sessions#destroy
#                                                  parent_password POST      /parents/password(.:format)                                                                                                                       devise/passwords#create
#                                              new_parent_password GET       /parents/password/new(.:format)                                                                                                                   devise/passwords#new
#                                             edit_parent_password GET       /parents/password/edit(.:format)                                                                                                                  devise/passwords#edit
#                                                                  PATCH     /parents/password(.:format)                                                                                                                       devise/passwords#update
#                                                                  PUT       /parents/password(.:format)                                                                                                                       devise/passwords#update
#                                       cancel_parent_registration GET       /parents/cancel(.:format)                                                                                                                         devise/registrations#cancel
#                                              parent_registration POST      /parents(.:format)                                                                                                                                devise/registrations#create
#                                          new_parent_registration GET       /parents/sign_up(.:format)                                                                                                                        devise/registrations#new
#                                         edit_parent_registration GET       /parents/edit(.:format)                                                                                                                           devise/registrations#edit
#                                                                  PATCH     /parents(.:format)                                                                                                                                devise/registrations#update
#                                                                  PUT       /parents(.:format)                                                                                                                                devise/registrations#update
#                                                                  DELETE    /parents(.:format)                                                                                                                                devise/registrations#destroy
#                                              parent_confirmation POST      /parents/confirmation(.:format)                                                                                                                   devise/confirmations#create
#                                          new_parent_confirmation GET       /parents/confirmation/new(.:format)                                                                                                               devise/confirmations#new
#                                                                  GET       /parents/confirmation(.:format)                                                                                                                   devise/confirmations#show
#                                                    parent_unlock POST      /parents/unlock(.:format)                                                                                                                         devise/unlocks#create
#                                                new_parent_unlock GET       /parents/unlock/new(.:format)                                                                                                                     devise/unlocks#new
#                                                                  GET       /parents/unlock(.:format)                                                                                                                         devise/unlocks#show
#                                                             root GET       /                                                                                                                                                 static_pages#home
#                                                       contact_us GET       /contact-us(.:format)                                                                                                                             static_pages#contactus
#                                                     student_root GET       /student(.:format)                                                                                                                                student/portal#home
#                                                  student_parents POST      /student/parents(.:format)                                                                                                                        student/parents#create
#                                                   student_parent PATCH     /student/parents/:id(.:format)                                                                                                                    student/parents#update
#                                                                  PUT       /student/parents/:id(.:format)                                                                                                                    student/parents#update
#                                                                  DELETE    /student/parents/:id(.:format)                                                                                                                    student/parents#destroy
#                                         register_student_subject POST      /student/subjects/:id/register(.:format)                                                                                                          student/subjects#register
#                                          payment_student_subject GET       /student/subjects/:id/payment(.:format)                                                                                                           student/subjects#payment
#                                  offline_payment_student_subject GET       /student/subjects/:id/offline-payment(.:format)                                                                                                   student/subjects#offline_payment
#                         initiate_offline_payment_student_subject POST      /student/subjects/:id/initiate-offline-payment(.:format)                                                                                          student/subjects#initiate_offline_payment
#                             offline_payment_info_student_subject GET       /student/subjects/:id/offline-payment-info(.:format)                                                                                              student/subjects#offline_payment_info
#                         register_offline_payment_student_subject POST      /student/subjects/:id/register-offline-payment(.:format)                                                                                          student/subjects#register_offline_payment
#                                    e_payment_new_student_subject GET       /student/subjects/:id/e-payment/new(.:format)                                                                                                     student/subjects#new_e_payment
#                                        e_payment_student_subject POST      /student/subjects/:id/e-payment(.:format)                                                                                                         student/subjects#e_payment
#     student_subject_section_discussion_topic_thread_thread_posts POST      /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts(.:format)          student/thread_posts#create
# edit_student_subject_section_discussion_topic_thread_thread_post GET       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id/edit(.:format) student/thread_posts#edit
#      student_subject_section_discussion_topic_thread_thread_post PATCH     /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)      student/thread_posts#update
#                                                                  PUT       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)      student/thread_posts#update
#                                                                  DELETE    /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)      student/thread_posts#destroy
#                 student_subject_section_discussion_topic_threads GET       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads(.:format)                                  student/threads#index
#                                                                  POST      /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads(.:format)                                  student/threads#create
#              new_student_subject_section_discussion_topic_thread GET       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/new(.:format)                              student/threads#new
#             edit_student_subject_section_discussion_topic_thread GET       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id/edit(.:format)                         student/threads#edit
#                  student_subject_section_discussion_topic_thread GET       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                              student/threads#show
#                                                                  PATCH     /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                              student/threads#update
#                                                                  PUT       /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                              student/threads#update
#                                                                  DELETE    /student/subjects/:subject_id/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                              student/threads#destroy
#                              student_subject_section_discussions GET       /student/subjects/:subject_id/sections/:section_id/discussions(.:format)                                                                          student/discussions#index
#                                  student_subject_section_folders POST      /student/subjects/:subject_id/sections/:section_id/folders(.:format)                                                                              student/folders#create
#                                         student_subject_sections POST      /student/subjects/:subject_id/sections(.:format)                                                                                                  student/sections#create
#                                      new_student_subject_section GET       /student/subjects/:subject_id/sections/new(.:format)                                                                                              student/sections#new
#                                          student_subject_section GET       /student/subjects/:subject_id/sections/:id(.:format)                                                                                              student/sections#show
#                                  student_subject_offline_payment POST      /student/subjects/:subject_id/payments/offline-payment(.:format)                                                                                  student/payments#offline_payment
#                             student_subject_offline_payment_info GET       /student/subjects/:subject_id/payments/offline-payment-info(.:format)                                                                             student/payments#offline_payment_information
#                            student_subject_register_payment_info PATCH|PUT /student/subjects/:subject_id/payments/register-payment/:id(.:format)                                                                             student/payments#register_payment_information
#                                                 student_subjects GET       /student/subjects(.:format)                                                                                                                       student/subjects#index
#                                    student_verification_required GET       /student/verification_required(.:format)                                                                                                          student/static_pages#verification_required
#                         student_password_reset_instructions_sent GET       /student/password-reset-instructions-sent(.:format)                                                                                               student/static_pages#password_reset
#                                                   student_portal GET       /student/portal(.:format)                                                                                                                         student/portal#home
#                                                student_schedules GET       /student/schedules(.:format)                                                                                                                      student/portal#schedule
#                                      student_new_student_profile GET       /student/portal/new-student-profile(.:format)                                                                                                     student/portal#edit_profile
#                            student_portal_update_student_profile PATCH|PUT /student/portal/update-student-profile(.:format)                                                                                                  student/portal#update_profile
#                               student_new_parent_for_new_profile GET       /student/portal/add-parent-to-student(.:format)                                                                                                   student/portal#new_parent_for_new_profile
#                            student_create_parent_for_new_profile POST      /student/portal/create-parent-to-student(.:format)                                                                                                student/portal#create_parent_for_new_profile
#                                             student_show_profile GET       /student/portal/my-profile(.:format)                                                                                                              student/portal#show_profile
#                                           student_update_profile GET       /student/portal/update-profile(.:format)                                                                                                          student/portal#update_profile
#                                              new_student_session GET       /login(.:format)                                                                                                                                  students/sessions#new
#                                                  student_session POST      /login(.:format)                                                                                                                                  students/sessions#create
#                                          destroy_student_session DELETE    /logout(.:format)                                                                                                                                 students/sessions#destroy
#                                                 student_password POST      /password(.:format)                                                                                                                               students/passwords#create
#                                             new_student_password GET       /password/new(.:format)                                                                                                                           students/passwords#new
#                                            edit_student_password GET       /password/edit(.:format)                                                                                                                          students/passwords#edit
#                                                                  PATCH     /password(.:format)                                                                                                                               students/passwords#update
#                                                                  PUT       /password(.:format)                                                                                                                               students/passwords#update
#                                      cancel_student_registration GET       /registration/cancel(.:format)                                                                                                                    students/registrations#cancel
#                                             student_registration POST      /registration(.:format)                                                                                                                           students/registrations#create
#                                         new_student_registration GET       /registration/register(.:format)                                                                                                                  students/registrations#new
#                                        edit_student_registration GET       /registration/edit(.:format)                                                                                                                      students/registrations#edit
#                                                                  PATCH     /registration(.:format)                                                                                                                           students/registrations#update
#                                                                  PUT       /registration(.:format)                                                                                                                           students/registrations#update
#                                                                  DELETE    /registration(.:format)                                                                                                                           students/registrations#destroy
#                                             student_confirmation POST      /verify(.:format)                                                                                                                                 students/confirmations#create
#                                         new_student_confirmation GET       /verify/new(.:format)                                                                                                                             students/confirmations#new
#                                                                  GET       /verify(.:format)                                                                                                                                 students/confirmations#show
#                                                   student_unlock POST      /unlock(.:format)                                                                                                                                 students/unlocks#create
#                                               new_student_unlock GET       /unlock/new(.:format)                                                                                                                             students/unlocks#new
#                                                                  GET       /unlock(.:format)                                                                                                                                 students/unlocks#show
#                                                         register GET       /register(.:format)                                                                                                                               students/registrations#new
#                                                   reset_password GET       /reset-password(.:format)                                                                                                                         students/passwords#new
#                                           new_instructor_session GET       /instructor/login(.:format)                                                                                                                       instructors/sessions#new
#                                               instructor_session POST      /instructor/login(.:format)                                                                                                                       instructors/sessions#create
#                                       destroy_instructor_session DELETE    /instructor/logout(.:format)                                                                                                                      instructors/sessions#destroy
#                                              instructor_password POST      /instructor/password(.:format)                                                                                                                    instructors/passwords#create
#                                          new_instructor_password GET       /instructor/password/new(.:format)                                                                                                                instructors/passwords#new
#                                         edit_instructor_password GET       /instructor/password/edit(.:format)                                                                                                               instructors/passwords#edit
#                                                                  PATCH     /instructor/password(.:format)                                                                                                                    instructors/passwords#update
#                                                                  PUT       /instructor/password(.:format)                                                                                                                    instructors/passwords#update
#                                   cancel_instructor_registration GET       /instructor/cancel(.:format)                                                                                                                      devise/registrations#cancel
#                                          instructor_registration POST      /instructor(.:format)                                                                                                                             devise/registrations#create
#                                      new_instructor_registration GET       /instructor/sign_up(.:format)                                                                                                                     devise/registrations#new
#                                     edit_instructor_registration GET       /instructor/edit(.:format)                                                                                                                        devise/registrations#edit
#                                                                  PATCH     /instructor(.:format)                                                                                                                             devise/registrations#update
#                                                                  PUT       /instructor(.:format)                                                                                                                             devise/registrations#update
#                                                                  DELETE    /instructor(.:format)                                                                                                                             devise/registrations#destroy
#                                                instructor_unlock POST      /instructor/unlock(.:format)                                                                                                                      instructors/unlocks#create
#                                            new_instructor_unlock GET       /instructor/unlock/new(.:format)                                                                                                                  instructors/unlocks#new
#                                                                  GET       /instructor/unlock(.:format)                                                                                                                      instructors/unlocks#show
#                                                  instructor_root GET       /instructor(.:format)                                                                                                                             instructor/portal#home
#                                                instructor_portal GET       /instructor/portal(.:format)                                                                                                                      instructor/portal#home
#                                       instructor_portal_schedule GET       /instructor/portal/schedule(.:format)                                                                                                             instructor/portal#schedule
#                                          instructor_show_profile GET       /instructor/portal/my-profile(.:format)                                                                                                           instructor/portal#show_profile
#                                        instructor_update_profile GET       /instructor/portal/update-profile(.:format)                                                                                                       instructor/portal#update_profile
#                                       instructor_change_password PATCH|PUT /instructor/portal/change-password(.:format)                                                                                                      instructor/portal#change_password
#                               instructor_section_folder_contents POST      /instructor/sections/:section_id/folders/:folder_id/contents(.:format)                                                                            instructor/contents#create
#                            new_instructor_section_folder_content GET       /instructor/sections/:section_id/folders/:folder_id/contents/new(.:format)                                                                        instructor/contents#new
#                                instructor_section_folder_content DELETE    /instructor/sections/:section_id/folders/:folder_id/contents/:id(.:format)                                                                        instructor/contents#destroy
#                                       instructor_section_folders GET       /instructor/sections/:section_id/folders(.:format)                                                                                                instructor/folders#index
#                                                                  POST      /instructor/sections/:section_id/folders(.:format)                                                                                                instructor/folders#create
#                                   edit_instructor_section_folder GET       /instructor/sections/:section_id/folders/:id/edit(.:format)                                                                                       instructor/folders#edit
#                                        instructor_section_folder GET       /instructor/sections/:section_id/folders/:id(.:format)                                                                                            instructor/folders#show
#                                                                  PATCH     /instructor/sections/:section_id/folders/:id(.:format)                                                                                            instructor/folders#update
#                                                                  PUT       /instructor/sections/:section_id/folders/:id(.:format)                                                                                            instructor/folders#update
#                                                                  DELETE    /instructor/sections/:section_id/folders/:id(.:format)                                                                                            instructor/folders#destroy
#                                       instructor_section_classes GET       /instructor/sections/:section_id/classes(.:format)                                                                                                instructor/classes#index
#                                                                  POST      /instructor/sections/:section_id/classes(.:format)                                                                                                instructor/classes#create
#                                     new_instructor_section_class GET       /instructor/sections/:section_id/classes/new(.:format)                                                                                            instructor/classes#new
#                                    edit_instructor_section_class GET       /instructor/sections/:section_id/classes/:id/edit(.:format)                                                                                       instructor/classes#edit
#                                         instructor_section_class GET       /instructor/sections/:section_id/classes/:id(.:format)                                                                                            instructor/classes#show
#                                                                  PATCH     /instructor/sections/:section_id/classes/:id(.:format)                                                                                            instructor/classes#update
#                                                                  PUT       /instructor/sections/:section_id/classes/:id(.:format)                                                                                            instructor/classes#update
#                                                                  DELETE    /instructor/sections/:section_id/classes/:id(.:format)                                                                                            instructor/classes#destroy
#                                  instructor_section_newrecurring GET       /instructor/sections/:section_id/classes/newrecurring(.:format)                                                                                   instructor/classes#newrecurring
#                               instructor_section_createrecurring POST      /instructor/sections/:section_id/classes/createrecurring(.:format)                                                                                instructor/classes#createrecurring
#                                 email_instructor_section_student GET       /instructor/sections/:section_id/students/:id/email(.:format)                                                                                     instructor/students#email
#                          emailparents_instructor_section_student GET       /instructor/sections/:section_id/students/:id/emailparents(.:format)                                                                              instructor/students#emailparents
#                             sendemail_instructor_section_student POST      /instructor/sections/:section_id/students/:id/sendemail(.:format)                                                                                 instructor/students#sendemail
#                    sendemailtoparents_instructor_section_student POST      /instructor/sections/:section_id/students/:id/sendemailtoparents(.:format)                                                                        instructor/students#sendemailtoparents
#                                      instructor_section_students GET       /instructor/sections/:section_id/students(.:format)                                                                                               instructor/students#index
#                                       instructor_section_student GET       /instructor/sections/:section_id/students/:id(.:format)                                                                                           instructor/students#show
#                               open_instructor_section_discussion POST      /instructor/sections/:section_id/discussions/:id/open(.:format)                                                                                   instructor/discussions#open
#                              close_instructor_section_discussion POST      /instructor/sections/:section_id/discussions/:id/close(.:format)                                                                                  instructor/discussions#close
#          instructor_section_discussion_topic_thread_thread_posts POST      /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts(.:format)                            instructor/thread_posts#create
#      edit_instructor_section_discussion_topic_thread_thread_post GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id/edit(.:format)                   instructor/thread_posts#edit
#           instructor_section_discussion_topic_thread_thread_post PATCH     /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)                        instructor/thread_posts#update
#                                                                  PUT       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)                        instructor/thread_posts#update
#                                                                  DELETE    /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:thread_id/thread_posts/:id(.:format)                        instructor/thread_posts#destroy
#                      instructor_section_discussion_topic_threads GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads(.:format)                                                    instructor/threads#index
#                                                                  POST      /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads(.:format)                                                    instructor/threads#create
#                   new_instructor_section_discussion_topic_thread GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/new(.:format)                                                instructor/threads#new
#                  edit_instructor_section_discussion_topic_thread GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id/edit(.:format)                                           instructor/threads#edit
#                       instructor_section_discussion_topic_thread GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                                                instructor/threads#show
#                                                                  PATCH     /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                                                instructor/threads#update
#                                                                  PUT       /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                                                instructor/threads#update
#                                                                  DELETE    /instructor/sections/:section_id/discussions/:discussion_id/topics/:topic_id/threads/:id(.:format)                                                instructor/threads#destroy
#                             instructor_section_discussion_topics GET       /instructor/sections/:section_id/discussions/:discussion_id/topics(.:format)                                                                      instructor/topics#index
#                                                                  POST      /instructor/sections/:section_id/discussions/:discussion_id/topics(.:format)                                                                      instructor/topics#create
#                          new_instructor_section_discussion_topic GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/new(.:format)                                                                  instructor/topics#new
#                         edit_instructor_section_discussion_topic GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:id/edit(.:format)                                                             instructor/topics#edit
#                              instructor_section_discussion_topic GET       /instructor/sections/:section_id/discussions/:discussion_id/topics/:id(.:format)                                                                  instructor/topics#show
#                                                                  PATCH     /instructor/sections/:section_id/discussions/:discussion_id/topics/:id(.:format)                                                                  instructor/topics#update
#                                                                  PUT       /instructor/sections/:section_id/discussions/:discussion_id/topics/:id(.:format)                                                                  instructor/topics#update
#                                                                  DELETE    /instructor/sections/:section_id/discussions/:discussion_id/topics/:id(.:format)                                                                  instructor/topics#destroy
#                                   instructor_section_discussions GET       /instructor/sections/:section_id/discussions(.:format)                                                                                            instructor/discussions#index
#                                                                  POST      /instructor/sections/:section_id/discussions(.:format)                                                                                            instructor/discussions#create
#                                new_instructor_section_discussion GET       /instructor/sections/:section_id/discussions/new(.:format)                                                                                        instructor/discussions#new
#                                 instructor_section_announcements POST      /instructor/sections/:section_id/announcements(.:format)                                                                                          instructor/announcements#create
#                              new_instructor_section_announcement GET       /instructor/sections/:section_id/announcements/new(.:format)                                                                                      instructor/announcements#new
#                                              instructor_sections GET       /instructor/sections(.:format)                                                                                                                    instructor/sections#index
#                                               instructor_section GET       /instructor/sections/:id(.:format)                                                                                                                instructor/sections#show
#                                                       admin_root GET       /admin(.:format)                                                                                                                                  admin/static_pages#home
#                                       open_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/open(.:format)                                                                                           admin/sections#open
#                                      close_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/close(.:format)                                                                                          admin/sections#close
#                                    admin_subject_section_classes GET       /admin/subjects/:subject_id/sections/:section_id/classes(.:format)                                                                                admin/classes#index
#                                                                  POST      /admin/subjects/:subject_id/sections/:section_id/classes(.:format)                                                                                admin/classes#create
#                                  new_admin_subject_section_class GET       /admin/subjects/:subject_id/sections/:section_id/classes/new(.:format)                                                                            admin/classes#new
#                                 edit_admin_subject_section_class GET       /admin/subjects/:subject_id/sections/:section_id/classes/:id/edit(.:format)                                                                       admin/classes#edit
#                                      admin_subject_section_class GET       /admin/subjects/:subject_id/sections/:section_id/classes/:id(.:format)                                                                            admin/classes#show
#                                                                  PATCH     /admin/subjects/:subject_id/sections/:section_id/classes/:id(.:format)                                                                            admin/classes#update
#                                                                  PUT       /admin/subjects/:subject_id/sections/:section_id/classes/:id(.:format)                                                                            admin/classes#update
#                                                                  DELETE    /admin/subjects/:subject_id/sections/:section_id/classes/:id(.:format)                                                                            admin/classes#destroy
#                                  admin_subject_section_newweekly GET       /admin/subjects/:subject_id/sections/:section_id/class/newweekly(.:format)                                                                        admin/classes#newweekly
#                               admin_subject_section_createweekly POST      /admin/subjects/:subject_id/sections/:section_id/class/createweekly(.:format)                                                                     admin/classes#createweekly
#                                           admin_subject_sections GET       /admin/subjects/:subject_id/sections(.:format)                                                                                                    admin/sections#index
#                                                                  POST      /admin/subjects/:subject_id/sections(.:format)                                                                                                    admin/sections#create
#                                        new_admin_subject_section GET       /admin/subjects/:subject_id/sections/new(.:format)                                                                                                admin/sections#new
#                                       edit_admin_subject_section GET       /admin/subjects/:subject_id/sections/:id/edit(.:format)                                                                                           admin/sections#edit
#                                            admin_subject_section GET       /admin/subjects/:subject_id/sections/:id(.:format)                                                                                                admin/sections#show
#                                                                  PATCH     /admin/subjects/:subject_id/sections/:id(.:format)                                                                                                admin/sections#update
#                                                                  PUT       /admin/subjects/:subject_id/sections/:id(.:format)                                                                                                admin/sections#update
#                                                                  DELETE    /admin/subjects/:subject_id/sections/:id(.:format)                                                                                                admin/sections#destroy
#                                                   admin_subjects GET       /admin/subjects(.:format)                                                                                                                         admin/subjects#index
#                                                                  POST      /admin/subjects(.:format)                                                                                                                         admin/subjects#create
#                                                new_admin_subject GET       /admin/subjects/new(.:format)                                                                                                                     admin/subjects#new
#                                               edit_admin_subject GET       /admin/subjects/:id/edit(.:format)                                                                                                                admin/subjects#edit
#                                                    admin_subject GET       /admin/subjects/:id(.:format)                                                                                                                     admin/subjects#show
#                                                                  PATCH     /admin/subjects/:id(.:format)                                                                                                                     admin/subjects#update
#                                                                  PUT       /admin/subjects/:id(.:format)                                                                                                                     admin/subjects#update
#                                                                  DELETE    /admin/subjects/:id(.:format)                                                                                                                     admin/subjects#destroy
#                                        sections_admin_instructor GET       /admin/instructors/:id/sections(.:format)                                                                                                         admin/instructors#sections
#                                                admin_instructors GET       /admin/instructors(.:format)                                                                                                                      admin/instructors#index
#                                                                  POST      /admin/instructors(.:format)                                                                                                                      admin/instructors#create
#                                             new_admin_instructor GET       /admin/instructors/new(.:format)                                                                                                                  admin/instructors#new
#                                            edit_admin_instructor GET       /admin/instructors/:id/edit(.:format)                                                                                                             admin/instructors#edit
#                                                 admin_instructor GET       /admin/instructors/:id(.:format)                                                                                                                  admin/instructors#show
#                                                                  PATCH     /admin/instructors/:id(.:format)                                                                                                                  admin/instructors#update
#                                                                  PUT       /admin/instructors/:id(.:format)                                                                                                                  admin/instructors#update
#                                                                  DELETE    /admin/instructors/:id(.:format)                                                                                                                  admin/instructors#destroy
#                                           admin_offline_payments GET       /admin/payments/offline-payments(.:format)                                                                                                        admin/payments#offline_payments
#                                     admin_verify_offline_payment POST      /admin/payments/:id/verify-offline-payment(.:format)                                                                                              admin/payments#verify_offline_payment
#                                     admin_cancel_offline_payment POST      /admin/payments/:id/cancel(.:format)                                                                                                              admin/payments#cancel_payment
#                                       admin_offline_payment_info GET       /admin/payments/:id/offline-payment-info(.:format)                                                                                                admin/payments#offline_payment_information
#                                   admin_complete_offline_payment PATCH|PUT /admin/payments/:id/complete-offline-payment(.:format)                                                                                            admin/payments#complete_offline_payment
#

Rails.application.routes.draw do

  devise_for :parents
  root 'static_pages#home'
  get 'contact-us' => 'static_pages#contactus'

  namespace :student do
    root to: 'portal#home'
    resources :parents, only: [:create, :update, :destroy]
    resources :subjects, only: [:index] do
      member do
        post 'register'
        get 'payment'

        # Offline Payment Routes
        get 'offline-payment', to: 'subjects#offline_payment'
        post 'initiate-offline-payment', to: 'subjects#initiate_offline_payment'
        get 'offline-payment-info', to: 'subjects#offline_payment_info'
        post 'register-offline-payment', to: 'subjects#register_offline_payment'

        #E-Payment Routes
        get 'e-payment/new', to: 'subjects#new_e_payment'
        post 'e-payment/', to: 'subjects#e_payment'
      end
      resources :sections, only: [:new, :create, :show] do
        resources :discussions, only: [:index] do
          resources :topics, only: [] do
            resources :threads do
              resources :thread_posts, only: [:create, :edit, :update, :destroy]
            end
          end
        end
        resources :folders, only: [:create]
      end
      post 'payments/offline-payment', to: 'payments#offline_payment', as: :offline_payment
      get 'payments/offline-payment-info', to: 'payments#offline_payment_information', as: :offline_payment_info
      match 'payments/register-payment/:id', to: 'payments#register_payment_information', as: :register_payment_info, via: [:patch, :put]
    end
    get 'verification_required' => 'static_pages#verification_required'
    get 'password-reset-instructions-sent' => 'static_pages#password_reset'
    get 'portal/' => 'portal#home'
    get 'schedules/' => 'portal#schedule'
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
  devise_for :instructors,
             controllers: {
                 sessions: 'instructors/sessions',
                 passwords: 'instructors/passwords',
                 unlocks: 'instructors/unlocks'
             },
             path: '/instructor/',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout'
             }
  namespace :instructor do
    root :to => 'portal#home'
    get 'portal' => 'portal#home'
    get 'portal/schedule' => 'portal#schedule'
    get 'portal/my-profile', to: 'portal#show_profile', as: :show_profile
    get 'portal/update-profile', to: 'portal#update_profile', as: :update_profile
    match 'portal/change-password', to: 'portal#change_password', as: :change_password, via: [:patch, :put]
    resources :sections, only: [:index, :show] do
      resources :folders, except: [:new] do
        resources :contents, only: [:new, :create, :destroy]
      end
      resources :classes
      get 'classes/newrecurring', to: 'classes#newrecurring', as: :newrecurring
      post 'classes/createrecurring', to: 'classes#createrecurring', as: :createrecurring
   	  resources :students, only: [:index, :show] do
   	  	member do
   	  	  get 'email'
   	  	  get 'emailparents'
   	  	  post 'sendemail'
   	  	  post 'sendemailtoparents'
   	  	end
      end
      resources :discussions, only: [:new, :index, :create] do
        member do
          post 'open'
          post 'close'
        end
        resources :topics do
          resources :threads do
            resources :thread_posts, only: [:create, :destroy, :edit, :update]
          end
        end
      end
      resources :announcements, only: [:new, :create]
    end
  end
  namespace :admin do
    root :to => 'static_pages#home'
    resources :subjects do
      resources :sections do
        member do
          get 'open'
          get 'close'
        end
        resources :classes
        get 'class/newweekly', to: 'classes#newweekly', as: :newweekly
        post 'class/createweekly', to: 'classes#createweekly', as: :createweekly
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
