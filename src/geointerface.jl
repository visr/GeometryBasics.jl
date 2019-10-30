GeoInterfaceRFC.geomtype(g::Point) = GeoInterfaceRFC.Point()
GeoInterfaceRFC.geomtype(g::LineString) = GeoInterfaceRFC.LineString()
GeoInterfaceRFC.geomtype(g::Polygon) = GeoInterfaceRFC.Polygon()
GeoInterfaceRFC.geomtype(g::MultiPoint) = GeoInterfaceRFC.MultiPoint()
GeoInterfaceRFC.geomtype(g::MultiLineString) = GeoInterfaceRFC.MultiLineString()
GeoInterfaceRFC.geomtype(g::MultiPolygon) = GeoInterfaceRFC.MultiPolygon()

# some of these, such as ncoord(g::Point), can also use the fallback
# for clarity we implement all here

GeoInterfaceRFC.ncoord(g::Point) = length(g)
GeoInterfaceRFC.getcoord(g::Point, i::Int) = g[i]

GeoInterfaceRFC.ncoord(g::LineString) = length(first(g))
GeoInterfaceRFC.npoint(g::LineString) = length(g)
GeoInterfaceRFC.getpoint(g::LineString, i::Int) = g[i]
# TODO what to return for length 0 and 1?
# TODO should this be an approximate equals for floating point?
GeoInterfaceRFC.isclosed(g::LineString) = first(g) == last(g)

GeoInterfaceRFC.ncoord(g::Polygon) = length(first(g.exterior))
# TODO this should return a "LineString" according to GeoInterfaceRFC, but this cannot directly
# be identified as such, is that a problem?
GeoInterfaceRFC.getexterior(g::Polygon) = g.exterior
GeoInterfaceRFC.nhole(g::Polygon) = length(g.interiors)
GeoInterfaceRFC.gethole(g::Polygon, i::Int) = g.interiors[i]

GeoInterfaceRFC.ncoord(g::MultiPoint) = length(first(g))
GeoInterfaceRFC.npoint(g::MultiPoint) = length(g)
GeoInterfaceRFC.getpoint(g::MultiPoint, i::Int) = g[i]

GeoInterfaceRFC.ncoord(g::MultiLineString) = length(first(first(g)))
GeoInterfaceRFC.nlinestring(g::MultiLineString) = length(g)
GeoInterfaceRFC.getlinestring(g::MultiLineString, i::Int) = g[i]

GeoInterfaceRFC.ncoord(g::MultiPolygon) = length(first(first(g).exterior))
GeoInterfaceRFC.npolygon(g::MultiPolygon) = length(g)
GeoInterfaceRFC.getpolygon(g::MultiPolygon, i::Int) = g[i]

# TODO implement wellknowntext(geom) and wellknownbinary(geom)
