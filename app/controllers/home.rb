Tstapp::App.controllers :home do

  get :index, map: '/' do
    File.read(File.join('public', 'index.html'))
  end

end
