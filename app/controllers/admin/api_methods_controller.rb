class Admin::ApiMethodsController < Admin::BaseController
  before_action :set_api_method, only: [:show, :edit, :update,:destroy]

  def index
    @api_methods = policy_scope(ApiMethod)
  end

  def show
    authorize @api_method
  end

  def new
    @api_method = ApiMethod.new
    authorize @api_method
  end

  def edit
    authorize @api_method
  end

  def create
    @api_method = ApiMethod.new(api_method_params)
    authorize @api_method
    if @api_method.save
      redirect_to admin_api_method_path(@api_method), notice: t('messages.created', model: @api_method.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @api_method
    if @api_method.update(api_method_params)
      redirect_to admin_api_method_path(@api_method), notice: t('messages.updated', model: @api_method.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @api_method
    @api_method.destroy
    flash[:success] = t('messages.deleted', model: @api_method.class.model_name.human)
    redirect_to admin_api_methods_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_api_method
      @api_method = ApiMethod.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def api_method_params
      params.require(:api_method).permit(
        :api_id, :name, :title, :link, :status, :content
      )
    end
end
