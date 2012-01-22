class OccasionsController < InheritedResources::Base 
  before_filter :authenticate_user!
  belongs_to :event 
  actions :all, :except => [:show]
  respond_to :html, :json
  
  # Need to override this from inherited_resources
  # to scope the association chain to the current_user
  def begin_of_association_chain
    current_user
  end

  def destroy
    destroy! do |format|
      format.json {render :ok}
    end
  end
end
