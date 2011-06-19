class String
  def to_lng_lat
    self.split(',').map(&:strip).map(&:to_f)
  end
end

class Array
  def to_lng_lat
    self[0..1].map(&:to_f)
  end
end  

class Hash
  def to_lng_lat
    [to_lng, to_lat]
  end

  def to_lat
    v = Mongoid::Geo.lat_symbols.select {|key| self[key] }
    return self[v.first].to_lat if !v.empty?
    raise "Hash must contain either of the keys: [:lat, :latitude] to be converted to a latitude"
  end

  def to_lng
    v = Mongoid::Geo.lng_symbols.select {|key| self[key] }
    return self[v.first].to_lng if !v.empty?
    raise "Hash must contain either of the keys: [:lon, :long, :lng, :longitude] to be converted to a longitude"
  end
end
