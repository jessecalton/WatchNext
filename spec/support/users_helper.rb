module UserHelper

  def login(a)
      visit "/login"
      fill_in "Email", with: a.email
      fill_in "Password", with: a.password

      click_button "Login"
  end

end