class UnicornsController < ApplicationController
  def index
    @unicorns = Unicorn.all
    json_response(@unicorns)
  end
end
