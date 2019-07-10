class Api::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: { message: 'user created successfully' }, status: :created
    else
      render json: { message: user.errors.full_messages }, stats: :bad_request
    end
  end
end
