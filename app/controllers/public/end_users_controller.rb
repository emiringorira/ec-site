class Public::EndUsersController < ApplicationController
	def show
		@public = Public.find(params[:id])
	end
	def edit
		@public = Public.find(params[:id])
	end
	def update
		@public = Public.find(params[:id])
		@public.update(public_params)
		redirect_to end_user_path(@public)
	end
	def unsubscribe
		@public = Public.find_by(email: params[:email])
	end
	def withdraw
		@public = current_public
		@public.update(is_deleted: true)
		reset_session
		redirect_to root_path
	end
	private
  	def public_params
    	params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  	end
end
