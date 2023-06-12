class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(10)
    if params[:sort_expired]
      @tasks = @tasks.reorder('period') 
    end

    if params[:sort_priority]
      @tasks = @tasks.reorder('priority')
    end

    # if params[:substance_keyword && :progress_keyword]
    #   @tasks = @tasks.search_by_substance(params[:substance_keyword])
    #   if params[:progress_keyword].present?
    #     @tasks = @tasks.search_by_state_for_progress(params[:progress_keyword])
    #   end
    # else 
    # end
    # 最初に作ったコード。なにをしているのかわかりづらい？コードレビューで聞く候補
    if params[:substance_keyword].present? && params[:progress_keyword].present? && params[:label_id].present?
      @tasks = @tasks.search_by_substance(params[:substance_keyword])
                      .search_by_state_for_progress(params[:progress_keyword])
                      .search_by_label(params[:label_id])
    elsif params[:substance_keyword].present? && params[:progress_keyword].present?
      @tasks = @tasks.search_by_substance(params[:substance_keyword])
                      .search_by_state_for_progress(params[:progress_keyword])
    elsif params[:substance_keyword].present? && params[:label_id].present?
      @tasks = @tasks.search_by_substance(params[:substance_keyword])
                      .search_by_label(params[:label_id])
    elsif params[:progress_keyword].present? && params[:label_id].present?
      @tasks = @tasks.search_by_state_for_progress(params[:progress_keyword])
                      .search_by_label(params[:label_id])
    elsif params[:substance_keyword].present?
      @tasks = @tasks.search_by_substance(params[:substance_keyword])
    elsif params[:progress_keyword].present?
      @tasks = @tasks.search_by_state_for_progress(params[:progress_keyword])
    elsif params[:labbel_id].present?
      @tasks = @tasks.search_by_label(params[:label_id])
    end

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを新規投稿しました！"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    # showと共通ですが、一連の流れを一目で見れるようにするために、あえてbefore_action化していません
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private

  def tasks_params
    params.require(:task).permit(:substance, :content, :period, :state_for_progress, :priority,:title, { label_ids: [] })
  end
end
