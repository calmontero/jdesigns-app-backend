class JobsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        jobs = Job.all
        render json: jobs, except: [:created_at, :updated_at]
    end

    private
    def render_not_found_response
        render json: { error: "job not found" }, status: :not_found
    end
end
