Igbo::Application.routes.draw do
  root :to => 'home#dictionary'
  match 'dictionary' => 'home#dictionary'
end
