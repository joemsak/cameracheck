module ApplicationHelper
  def city_name
    @city_name ||= Venue.new.send(:city)
  end

  def alt_cities
    { 'New York' => 'nyc',
      'Chicago'  => 'chicago' }.reject { |_, v| v == schema }
  end

  def city_url(sub)
    %W{
      http://#{sub}
      #{request.subdomains.reject { |s| s == schema }.join('.')}
      #{request.domain}
    }.reject(&:blank?).join('.')
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder, parent_form: f)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  private
  def schema
    @schema ||= Venue.new.send(:schema)
  end
end
