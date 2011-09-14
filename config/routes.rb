Igbo::Application.routes.draw do
  resources :english_entries

  root :to => 'home#dictionary'
  match 'dictionary' => 'home#dictionary'
end
