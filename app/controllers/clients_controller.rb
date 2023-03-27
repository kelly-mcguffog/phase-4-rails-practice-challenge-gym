class ClientsController < ApplicationController
    
    def index
        render json: Client.all, status: :ok
    end

    def show
        client = find_client
        # if client
            render json: client, status: :ok
        # else
        #     render json: {error: "Client not found"}, status: :not_found
        # end
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :approved
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def find_client
        client = Client.find(params[:id])
    end

end
