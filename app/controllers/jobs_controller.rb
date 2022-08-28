class JobsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        jobs = Job.all
        render json: jobs, except: [:created_at, :updated_at]
    end

    def create
        job = Job.create!(job_params)
        render json: job, status: :created
    end

    def update
        job = find_job
        job.update!(job_params)
        render json: job
    end

    def destroy
        job = Job.destroy(params[:id])
        head :no_content
    end

    private
    def job_params
        params.permit(:title, :image_link, :text)
    end

    def find_job
        Job.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "job not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
