class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(updated_at: :desc).includes(:vendor).with_attached_cover_image.with_rich_text_content_and_embeds
  end
end