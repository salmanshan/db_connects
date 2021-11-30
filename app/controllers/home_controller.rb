class HomeController < ApplicationController
  def index
    @databases = YAML.load(File.read("config/blazer.yml"))
  end
  def save_db
    @databases = YAML.load(File.read("config/blazer.yml"))
    @databases['data_sources'][params[:db_name]] = {}
    @databases['data_sources'][params[:db_name]]['url'] = params[:db_url]
    File.open("config/blazer.yml", "w") { |file| file.write(@databases.to_yaml) }
    system "touch tmp/restart.txt"
    flash[:success] = "Saved Successfully!"
    redirect_to "/"
  end
end
