class HomeController < ApplicationController
  def index
    @databases = current_user.databases
  end

  def save_db

    flash[:success] = "Saved Successfully!"
    redirect_to "/"
  end

  def delete_db
    @databases = YAML.load(File.read("config/blazer.yml"))
    @databases["data_sources"].delete(params[:name])
    File.open("config/blazer.yml", "w") { |file| file.write(@databases.to_yaml) }
    system "touch tmp/restart.txt"
    flash[:success] = "Deleted Successfully!"
    redirect_to "/"
  end
end
