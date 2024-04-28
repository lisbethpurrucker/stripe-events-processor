Rails.application.routes.draw do
  root 'pages#home'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
