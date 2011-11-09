module MongoidActions
  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.all)
  end
end

InheritedResources::Base.send :include, MongoidActions
