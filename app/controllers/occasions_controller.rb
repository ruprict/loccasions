class OccasionsController < InheritedResources::Base 
  belongs_to :event 
  actions :all, :except => [:show, :index]
  
  # Need to override this from inherited_resources
  # to scope the association chain to the current_user
  def begin_of_association_chain
    current_user
  end
end
