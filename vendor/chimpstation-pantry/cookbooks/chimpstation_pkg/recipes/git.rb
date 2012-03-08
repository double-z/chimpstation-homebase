unless system("git --version | grep 'git version' > /dev/null")
  include_recipe "chimpstation_base::homebrew"

  execute "brew install git" do
    user $ws_user
    command "brew install git"
  end
end
