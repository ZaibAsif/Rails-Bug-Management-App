class ProjectsController < ApplicationController
    load_and_authorize_resource param_method: :req_params
    # before_action :set_project, only:[:update, :show, :edit, :destroy]
    # before_action :authenticate_user!

    def index
        @project=current_user.manager_projects if current_user.manager?
        @project=current_user.projects if current_user.developer?
        @project=Project.all if current_user.qa?
    end
    def new
        @project=Project.new
    end

    def create
        @project = Project.new(req_params)
        @project.manager = current_user
        if @project.save
            flash[:notice] = "project was created successfully."
            render 'new'
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @project.update(req_params)
            flash[:notice]="project was updated successfully!"
            render 'new'
        else
            render 'new'
        end
    end

    def destroy
        @project.destroy
        render 'new'

    end

    private
    # def set_project
    #     @project = Project.find(params[:id])
    # end
    
    def req_params
     params.require(:project).permit(:name, developer_ids: [])
    end

end