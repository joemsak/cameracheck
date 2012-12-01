Cameracheck.Views.Venues ||= {}

class Cameracheck.Views.Venues.IndexView extends Backbone.View
  template: JST["backbone/templates/venues/index"]

  initialize: () ->
    @options.venues.bind('reset', @addAll)

  addAll: () =>
    @options.venues.each(@addOne)

  addOne: (venue) =>
    view = new Cameracheck.Views.Venues.VenueView({model : venue})
    @$("#venues").append(view.render().el)

  render: =>
    $(@el).html(@template(venues: @options.venues.toJSON() ))
    @addAll()

    return this
