class Cameracheck.Models.Venue extends Backbone.Model
  paramRoot: 'venue'

  defaults:
    name: null
    address: null

class Cameracheck.Collections.VenuesCollection extends Backbone.Collection
  model: Cameracheck.Models.Venue
  url: '/venues'
