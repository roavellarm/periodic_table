class AnnotationsController < ApplicationController
  before_action :set_element

  def new
    @annotation = @element.annotations.build
  end

  def create
    @annotation = @element.annotations.build(annotation_params)
    if @annotation.save
      flash[:notice] = 'Anotação criada com sucesso.'
      redirect_to table_path(@element.id)
    else
      render :new
    end
  end

  def show
    @element = Element.find(params[:element_id])
    @annotation = Annotation.find(params[:id])
  end

  def edit
    @annotation = @element.annotations.find(params[:id])
  end

  def update
    @annotation = @element.annotations.find(params[:id])
    if @annotation.update(annotation_params)
      flash[:notice] = 'Anotação atualizada com sucesso.'
      redirect_to table_path(@element.id)
    else
      render :edit
    end
  end

  def destroy
    byebug
    @element = Element.find(params[:element_id])
    @annotation = Annotation.find(params[:id])
    @annotation.destroy

    flash[:notice] = 'Anotação removida com sucesso.'
    redirect_to table_path(@element)
  end

  private

  def set_element
    @element = Element.find(params[:element_id])
  end

  def annotation_params
    params.require(:annotation).permit(:content)
  end
end
