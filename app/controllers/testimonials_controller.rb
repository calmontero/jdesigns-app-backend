class TestimonialsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        testimonials = Testimonial.all
        render json: testimonials, except: [:created_at, :updated_at]
    end

    def create
        testimonial = Testimonial.create!(testimonial_params)
        render json: testimonial, status: :created
    end

    def update
        testimonial = find_testimonial
        testimonial.update!(testimonial_params)
        render json: testimonial
    end

    def destroy
        testimonial = testimonial.destroy(find_testimonial)
        head :no_content
    end

    private
    def testimonial_params
        params.permit(:account, :comment, :image, :link)
    end

    def find_testimonial
        testimonial.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "testimonial not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
