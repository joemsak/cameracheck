class Cameracheck.Routers.VenuesRouter extends Backbone.Router
  initialize: (options) ->
    @venues = new Cameracheck.Collections.VenuesCollection()
    @venues.reset options.venues

  routes:
    "new"      : "newVenue"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newVenue: ->
    @view = new Cameracheck.Views.Venues.NewView(collection: @venues)
    $("#venues").html(@view.render().el)

  index: ->
    @view = new Cameracheck.Views.Venues.IndexView(venues: @venues)
    $("#venues").html(@view.render().el)

  show: (id) ->
    venue = @venues.get(id)

    @view = new Cameracheck.Views.Venues.ShowView(model: venue)
    $("#venues").html(@view.render().el)

  edit: (id) ->
    venue = @venues.get(id)

    @view = new Cameracheck.Views.Venues.EditView(model: venue)
    $("#venues").html(@view.render().el)
