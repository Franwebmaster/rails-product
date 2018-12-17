class ProductsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = current_user.products
  end

  # GET /products/1
  # GET /products/1.json

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = current_user.products.find_by(id: params[:id])
    if @product.nil?
      flash[:danger] = 'Produto não encontrado.'
      redirect_to user_products_path(current_user)
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = 'Contato criado com sucesso.'
      redirect_to user_products_path
    else
      render 'new'
    end
  end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      flash[:success] = 'Contato atualizado com sucesso'
      redirect_to user_products_path
    else
      render 'edit'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = current_user.products.find(params[:id])
    if @product.destroy
      flash[:success] = 'Contato removido com sucesso'
      redirect_to user_products_path
    else
      flash[:danger] = 'Contato não encontrado.'
      redirect_to user_products_path(current_user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:codigo, :nome)
    end
end
