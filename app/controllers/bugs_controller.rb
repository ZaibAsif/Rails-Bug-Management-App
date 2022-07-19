class BugsController < ApplicationController
    load_and_authorize_resource param_method: :req_params
    before_action :find_project, only:[:new, :create, :index]
    before_action :set_bug, only:[:edit, :update, :destroy]
    before_action :authenticate_user!
    # before_action :check_current_user, except:[:show, :index, :new, :create]
    def index
        # can?
        @bugs=@project.bugs.all
        # @articles =@project.accessible_by(current_ability, :update)
    end
    def new
        # binding.pry
        @bug = @project.bugs.new
    end

    def create
        # binding.pry
        @bug = @project.bugs.new(req_params)
        @bug.qa=current_user
        if @bug.save
            flash[:notice] = "bug was created successfully."
            render 'new'
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @bug.update(req_params)
            flash[:notice]="bugs was updated successfully!"
            render 'new'
        else
            render 'new'
        end
    end

    def destroy
        @bug.destroy
    end

    private
    def set_bug
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:id])
    end

   

    def find_project
        @project = Project.find(params[:project_id])
    end
    
    def req_params
     params.require(:bug).permit(:title, :description, :deadline, :bug_type, :bug_status, :avatar, :project_id)
    end
    def check_current_user
        if current_user!= @project.user
            flash[:notice]="You are not able to edit other article!"
            redirect_to @article
       end
    end
end