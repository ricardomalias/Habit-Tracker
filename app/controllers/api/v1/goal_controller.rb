module Api
	module V1
		class GoalController < ApplicationController

            # GET goals
			def index
				goals = Goal.order('created_at DESC');
				render json: {count:goals.count, data:goals},status: :ok
			end

            # GET goal by id
            def show
                goal = Goal.find(params[:id])
                render json: goal,status: :ok
            end

            # POST goal
			def create
				goal = Goal.new(goal_params)
				if goal.save
					render json: goal,status: :ok
				else
					render json: {status: 'ERROR', message:'goal not saved', errors:goal.errors},status: :unprocessable_entity
				end
			end

            # PUT goal
			def update
				goal = Goal.find(params[:id])
				if goal.update_attributes(goal_params)
					render json: goal,status: :ok
				else
					render json: {status: 'ERROR', message:'goal not updated', errors:goal.errors},status: :unprocessable_entity
				end
			end


            # DELETE goal
			def destroy
				goal = Goal.find(params[:id])
				goal.destroy
				render json: {status: 'SUCCESS', message:'Goal deleted'},status: :ok
			end

			# Params
			private def goal_params
				params.permit(:name, :color)
			end
		end
	end
end
