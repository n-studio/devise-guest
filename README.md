# devise-guest

## Concern

`include DeviseGuestConcern`

## Helper methods

`current_or_guest_user`

## Migrations

`rails devise_guest_engine:install:migrations`

## Merging accounts

Override `merge_guest_user_with_user(user:, guest_user:)` in your User model.

`user.guest_users`

`guest_user.owner_user`

## Sessions

```
class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    session[:merge_guest_user] = !!params[:merge_guest_user]
    super
    current_or_guest_user
  end
end
```

## Initializer

```
DeviseGuest.setup do |config|
  config.email_domain = 'guest.mydomain.com'
end
```
