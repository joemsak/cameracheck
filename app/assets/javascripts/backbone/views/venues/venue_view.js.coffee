Cameracheck.Views.Venues ||= {}

class Cameracheck.Views.Venues.VenueView extends Backbone.View
  template: JST["backbone/templates/venues/venue"]

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  tagName: 'div'

  className: 'venue'

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
