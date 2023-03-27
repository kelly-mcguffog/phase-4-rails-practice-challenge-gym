class GymsController < ApplicationController

    def index
        render json: Gym.all, status: :ok
    end
    
    def show
        gym = find_gym
        # if gym
            render json: gym, status: :ok
        # else
        #     render json: {error: "Gym not found"}, status: :not_found
        # end
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: :approved
    end

    def destroy
        gym = find_gym
        # if gym
            gym.destroy
            head :no_content
        # else
        #     render json: {error: "Gym not found"}, status: :not_found
        # end
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

end
