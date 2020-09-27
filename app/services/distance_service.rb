class DistanceService

  def is_within_distance(customer, distance_limit_km)
    lat1 = customer.latitude
    lon1 = customer.longitude

    lat2 = INTERCOM_LATITUDE
    lon2 = INTERCOM_LONGITUDE

    # Convert to radian arcs
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180

    a = Math.sin(dLat / 2) *
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
            Math.cos(lat2 * Math::PI / 180) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    distance_km = 6371 * c * 1
    return distance_km <= distance_limit_km
  end

end