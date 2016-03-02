Rails.application.routes.draw do
  post '/api/v3/projects/:project_id/notices', to: 'notices#create'
  post '/api/v4/projects/113073/deploys', to: 'deploys#create'
end
