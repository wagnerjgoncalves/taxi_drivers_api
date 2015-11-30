# Taxi Drivers API

API to manage geographical information about taxi drivers and their locations.

## General project information

### Framework and language versions
* Rails Version: 4.2.5
* Ruby Version: 2.2.3
* PostgreSQL Version: 9.4
* PostGIS Version: 2.2

### Setup

* Instal PostgreSQL and PostGIS (OSX)

		brew install postgres
		brew install postgis
		
* Configure database

		# Create role
		psql -U USERNAME -d postgres
		CREATE ROLE taxi_drivers_api WITH CREATEDB LOGIN PASSWORD 'taxi_drivers_api’;
		
		# Create database and data
		bin/rake db:create && bin/rake db:migrate && bin/rake db:seed
		
## Endpoints

### taxi drivers 
* To create a taxi driver use:
	
		POST /api/taxi_drivers
		
		Parameters:
		taxi_driver_id, latitude, longitude and available

* To recover information abou a taxi driver use:

		GET  /api/taxi_drivers/:id
		
### taxi driver locations
* To recover taxi driver locations use:
		
		GET  /api/taxi_driver_locations?sw=...&ne=...
		
		Query filter:
		sw=latitude,longitude    Ex: sw=-23.612474,-46.702746
		ne=latitude,longitude    Ex: ne=-23.589548,-46.673392
		
* To create a new taxi driver location use:
		
		POST /api/taxi_driver_locations
		
		Parameters:
		name, license_plate and available

### Search location by sw and ne

To manage the GIS data we're using PostgreSQL with PostGIS extension.

To find the taxi driver locations by area was creates a scope called by_bbox that filters all locations using PostiGIS ST_Intersects method. See the PostiGIS sectio explanation.

## PostGIS

PostGIS is a spatial database extender for PostgreSQL object-relational database wich allows GIS (Geographic Information Systems) objets to be stored in the database.

PostGIS includes support for GiST-based R-Tree spatial indexes, and functions for analysis and processing of GIS objects.

The GIS objects supported by PostGIS are a superset of the "Simple Features" defined by the OpenGIS Consortium (OGC). As of version 0.9, PostGIS supports all the objects and functions specified in the OGC "Simple Features for SQL" specification.

The OpenGIS specification defines two standard ways of expressing spatial objects: the Well-Known Text (WKT) form and the Well-Known Binary (WKB) form. Both WKT and WKB include information about the type of the object and the coordinates which form the object.

Examples of the text representations (WKT):

	POINT (-46.673392 -23.589548)

	POLYGON ((-46.673392 -23.589548,-46.702746 -23.589548,-46.702746 -23.612474,-46.673392 -23.612474,-46.673392 -23.589548))

### Methods used

**ST_Intersects**: Returns TRUE if the Geometries/Geography "spatially intersect in 2D" - (share any portion of space) and FALSE if they don't (they are Disjoint).

**ST_GeomFromEWKT**: Return a specified ST_Geometry value from Extended Well-Known Text representation (EWKT).