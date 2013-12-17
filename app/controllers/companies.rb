Tstapp::App.controllers :companies, :provides => [:json] do

  post :index do
    @company = Company.new params[:company]

    if @company.save
      render 'companies/show'
    else
      status 400
    end
  end

end
