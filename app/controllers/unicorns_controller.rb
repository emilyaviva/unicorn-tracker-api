class UnicornsController < ApplicationController
  before_action :set_unicorn, only: %i[show update destroy]

  # GET /unicorns
  def index
    @unicorns = Unicorn.all
    json_response(@unicorns)
  end

  # POST /unicorns
  def create
    @unicorn = Unicorn.create!(unicorn_params)
    json_response(@unicorn, :created)
  end

  # GET /unicorns/:id
  def show
    json_response(@unicorn)
  end

  # PUT /unicorns/:id
  def update
    @unicorn.update(unicorn_params)
    head :no_content
  end

  # DELETE /unicorns/:id
  def destroy
    @unicorn.destroy
    head :no_content
  end

  private

  def unicorn_params
    params.permit(:name, :color, :food, :location)
  end

  def set_unicorn
    @unicorn = Unicorn.find(params[:id])
  end
end
