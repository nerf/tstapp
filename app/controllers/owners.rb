Tstapp::App.controllers :owners, :parent => :companies, :provides => [:json] do
  
  post :index do
    @owner = Owner.new params[:owner]

    if @owner.save
      render 'owners/show'
    else
      show_errors(@owner)
    end
  end

  put :index, with: :id do
    @owner = Owner.find params[:id]

    if @owner.update_attributes(params[:owner])
      render 'owners/show'
    else
      show_errors(@owner)
    end
  end

  delete :index, with: :id do
    owner = Owner.find params[:id]

    if owner.destroy
      status 200
    else 
      status 400
    end
  end

  define_method :show_errors do |owner|
    status 400

    Oj.dump({errors: owner.errors.as_json})
  end

end
