class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
        else
            flash[:danger] = "Invalid content!"
        end
        redirect_to root_url
    end

    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted!"
        redirect_to request.referrer || root_url
    end

    # Private methods
    private

        def micropost_params
            params.require(:micropost).permit(:content, :picture)
        end

        # Before filters

        def correct_user
            @micropost = Micropost.find(params[:id])
            user = @micropost.user
            redirect_to(root_url) unless (current_user?(user) || current_user.admin?)
        end
end
