execute "turn on focus-follows-mouse for terminal" do
  command "defaults write com.apple.Terminal FocusFollowsMouse -string YES"
  user $ws_user
end
