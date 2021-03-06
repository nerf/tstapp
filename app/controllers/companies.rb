Tstapp::App.controllers :companies, :provides => [:json] do

  post :index do
    @company = Company.new parsed_params[:company]

    if @company.save
      render 'companies/show'
    else
      status 400
      Oj.dump({errors: @company.errors.as_json})
    end
  end

  get :index, with: :id do
    @company = Company.find params[:id]

    render 'companies/show'
  end

  get :index do
    @companies = Company.all

    render 'companies/index'
  end

  put :index, with: :id do
    @company = Company.find params[:id]

    if @company.update_attributes(parsed_params[:company])
      render 'companies/show'
    else
      status 400
      Oj.dump({errors: @company.errors.as_json})
    end
  end

  delete :index, with: :id do
    company = Company.find params[:id]

    if company.destroy
      status 200
    else
      status 400
    end
  end

end
