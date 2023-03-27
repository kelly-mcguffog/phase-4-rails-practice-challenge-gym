class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :not_found

private

def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
end

def not_found
    render json: {error: "Not found"}, status: :not_found
end

end
