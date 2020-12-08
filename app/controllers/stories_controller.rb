class StoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_story, only: [:edit, :update, :destroy]
    def new
        @story = current_user.stories.new
    end

    def index
        @stories = current_user.stories.where(deleted_at: nil).order(created_at: :desc)
    end



    def create
        @story = current_user.stories.new(story_params)
        if @story.save
            redirect_to stories_path, notice: '新增成功'
        else
            render :new
        end
    end
    
    def edit
        
    end

    def update
        if @story.update(story_params)
            redirect_to stories_path,notice: '故事已更新'
            else
                render :edit
                end
    end


    def destroy
        # 完全刪除資料
        @story.destroy 

        redirect_to stories_path,notice: '故事已刪除'
    end



    private

    def find_story
        @story = current_user.stories.find(params[:id])
       
    end



    def story_params
        params.required(:story).permit(:title, :content)
    end
end
