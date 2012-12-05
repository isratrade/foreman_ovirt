Rails.application.routes.draw do

  constraints(:id => /[^\/]+/) do
    get "hosts/:id/ovirt" => "foreman_ovirt/hosts#show"
  end

end
