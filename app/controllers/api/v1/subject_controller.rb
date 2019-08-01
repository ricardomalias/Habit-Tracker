module Api
	module V1
		class SubjectController < ApplicationController

            # GET subjects
			def index
				subjects = Subject.order('created_at DESC');
				render json: {count:subjects.count, data:subjects},status: :ok
			end

            # GET subject by id
            def show
                subject = Subject.find(params[:id])
                render json: subject,status: :ok
            end

            # POST subject
			def create
				subject = Subject.new(subject_params)
				if subject.save
					render json: subject,status: :ok
				else
					render json: {status: 'ERROR', message:'subject not saved', errors:subject.errors},status: :unprocessable_entity
				end
			end

            # PUT subject
			def update
				subject = Subject.find(params[:id])
				if subject.update_attributes(subject_params)
					render json: subject,status: :ok
				else
					render json: {status: 'ERROR', message:'subject not updated', errors:subject.errors},status: :unprocessable_entity
				end
			end


            # DELETE subject
			def destroy
				subject = Subject.find(params[:id])
				subject.destroy
				render json: {status: 'SUCCESS', message:'Deleted subject'},status: :ok
			end

			# Params
			private def subject_params
				params.permit(:title)
			end
		end
	end
end
