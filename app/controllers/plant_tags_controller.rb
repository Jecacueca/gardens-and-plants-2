class PlantTagsController < ApplicationController
  # Call set_plant private method before action
  before_action :set_plant

  def new
    # populate the form (new plant_tag instance)
    @plant_tag = PlantTag.new
  end

  def create
    # We already have a plant id here from before action
    # Then find all the tags coming from the form
    @tags = Tag.where(params[:plant_tag][:tag])
    # for each tag
    @tags.each do |tag|
      # create a new plant_tag with that tag that was chosen in the form
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      plant_tag.save
    end
      redirect_to garden_path(@plant.garden)
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end
end
