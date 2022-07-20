class ImagesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        if params[:job_id]
            job = find_job
            images = job.image
            render json: images, include: :job, except: [:created_at, :updated_at]
        end
    end

    private

    def find_job
        Job.find(params[:job_id])
    end

    def render_not_found_response
        render json: { error: "images not found" }, status: :not_found
    end
end
