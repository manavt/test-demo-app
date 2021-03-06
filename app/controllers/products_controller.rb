class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
     @product.images.build
  end

  def create
    image_attr = product_params["images_attributes"]["0"]["photo"]
    product_params.delete(:images_attributes)
    @product = Product.new(product_params)
    if @product.save
      image_attr.each do | im |
        image = Image.new(photo: im, entity: @product)
        # Image.new(photo: im, entity_id: @product.id, entity_type: @product.class)
        image.save(validate: false)
      end
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  def image
    @product = Product.find(params[:id])
  end
  def make_payment
    @product = Product.find_by_id params[:product_id]
  end
  def process_payment
      @product = Product.find_by_id params[:product_id]
      @result = Braintree::Transaction.sale(
      :amount => @product.price,
      :credit_card => {
        :number => params[:credit_card_number],
        :expiration_date => params["date"]["expiry_date(2i)"] + "/" + params["date"]["expiry_date(1i)"]
      },
      :options=> {
                      store_in_vault: true
                    })
    if @result.success?
      current_user.update_columns(braintree_customer_id: @result.transaction.customer_details.id)
      redirect_to :action=>"index", notice: "Congraulations! Your transaction has been successfully!"
    else
      redirect_to :action=>"index", notice: "Transaction fail"
    end
  end
  def product_params
    params.require(:product).permit!
  end
end
