Cameracheck.Views.Venues ||= {}

class Cameracheck.Views.Venues.NewView extends Backbone.View
  template: JST["backbone/templates/venues/new"]

  events:
    "submit #new-venue": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (venue) =>
        @model = venue
        window.location.hash = "/#{@model.id}"

      error: (venue, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
