module Api
	module V1
		class GoalTrackerController < ApplicationController

            # GET goal_trackers
			def index
				goal_trackers = GoalTracker.order('created_at DESC');
				render json: {count:goal_trackers.count, data:goal_trackers},status: :ok
			end

            # GET goal_tracker by id
            def show
                goal_tracker = GoalTracker.find(params[:id])
                render json: goal_tracker,status: :ok
            end

            # POST goal_tracker
			def create
				goal_tracker = GoalTracker.new(goal_tracker_params)
				if goal_tracker.save
					render json: goal_tracker,status: :ok
				else
					render json: {status: 'ERROR', message:'goal_tracker not saved', errors:goal_tracker.errors},status: :unprocessable_entity
				end
			end

            # PUT goal_tracker
			def update
				goal_tracker = GoalTracker.find(params[:id])
				if goal_tracker.update_attributes(goal_tracker_params)
					render json: goal_tracker,status: :ok
				else
					render json: {status: 'ERROR', message:'goal_tracker not updated', errors:goal_tracker.errors},status: :unprocessable_entity
				end
			end


            # DELETE goal_tracker
			def destroy
				goal_tracker = GoalTracker.find(params[:id])
				goal_tracker.destroy
				render json: {status: 'SUCCESS', message:'GoalTracker deleted'},status: :ok
			end

			# Params
			private def goal_tracker_params
				params.permit(:occurrence_at)
			end
		end
	end
end
