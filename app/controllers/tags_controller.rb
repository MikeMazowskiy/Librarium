class TagsController < ApplicationController
  def index
    entity = params[:entity].classify.constantize

    if params[:query].start_with?('#')
      query  = params[:query].gsub('#','')
      @collection = entity.joins(:tags).where(tags: { name: query })
    else
      @collection = entity.where("description like ?", "%#{params[:query]}%")
    end
  end

  def create
    @taggable = find_taggable
    @comment = @taggable.tags.build(permitted_params)
  end

  private

  def find_taggable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
