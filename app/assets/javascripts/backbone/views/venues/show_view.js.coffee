Cameracheck.Views.Venues ||= {}

class Cameracheck.Views.Venues.ShowView extends Backbone.View
  template: JST["backbone/templates/venues/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
