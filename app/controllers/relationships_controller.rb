class RelationshipsController < ApplicationController
before_action :authenticate_user!
	def create
		Relationship.create(create_params)
		redirect_to controller: 'users', action: 'index'
	end

	def destroy
		relationship = Relationship.find(params[:id])
		relationship.destroy
		redirect_to controller: 'users', action: 'index'
	end

	private
	def create_params
		params.permit(:following_id).merge(follower_id: current_user.id)
	end
end
