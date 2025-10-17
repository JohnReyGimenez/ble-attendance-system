class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:mac_address, :student_id)
  end
end
