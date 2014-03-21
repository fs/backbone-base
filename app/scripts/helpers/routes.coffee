define ->

  class RoutesHelper
    @rootPath: -> ''
    @dashboardPath: -> 'dashboard'
    @articlesPath: -> 'dashboard/articles'
    @articlePath: (id) -> "dashboard/articles/#{id}"
