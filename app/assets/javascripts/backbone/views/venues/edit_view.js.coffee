Cameracheck.Views.Venues ||= {}

class Cameracheck.Views.Venues.EditView extends Backbone.View
  template : JST["backbone/templates/venues/edit"]

  events :
    "submit #edit-venue" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (venue) =>
        @model = venue
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
