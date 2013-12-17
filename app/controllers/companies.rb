Tstapp::App.controllers :companies, :provides => [:json] do

  post :index do
    @company = Company.new params[:company]

    if @company.save
      render 'companies/show'
    else
      status 400
    end
  end

  get :index, with: :id do
    begin
      @company = Company.find params[:id]

      render 'companies/show'
    rescue
      status 404
    end
  end

end
