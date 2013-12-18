Tstapp::App.controllers :owners, :parent => :companies, :provides => [:json] do
  
  get :index do
    company = Company.find params[:company_id]

    @owners = company.owners
  end

  post :index do
    @owner = company_owners.new parsed_params[:owner]

    if @owner.save
      render 'owners/show'
    else
      show_errors(@owner)
    end
  end

  put :index, with: :id do
    @owner = company_owners.find params[:id]

    if @owner.update_attributes(parsed_params[:owner])
      render 'owners/show'
    else
      show_errors(@owner)
    end
  end

  delete :index, with: :id do
    owner = company_owners.find params[:id]

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

  define_method :company_owners do
    Company.find(params[:company_id]).owners
  end

end
