define ->
  class RoutesHelper
    @rootPath: -> '/'
    @logoutPath: -> '/logout'
    @dashboardPath: -> '/dashboard'
    @articlesPath: -> '/dashboard/articles'
    @articlePath: (id) -> "/dashboard/articles/#{id}"
