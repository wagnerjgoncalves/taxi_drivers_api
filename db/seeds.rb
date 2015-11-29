rui = TaxiDriver.create(name: 'Rui', license_plate: 'HTR-4919')
TaxiDriverLocation.create(latitude: -23.572952, longitude: -46.635125, taxi_driver_id: rui.id)
TaxiDriverLocation.create(latitude: -23.593561, longitude: -46.610920, taxi_driver_id: rui.id)

tite = TaxiDriver.create(name: 'Tite', license_plate: 'SHM-5967', available: true)
TaxiDriverLocation.create(latitude: -23.59492613, longitude: -46.69024011, taxi_driver_id: tite.id)

galvao = TaxiDriver.create(name: 'Galvão', license_plate: 'BVL-5452', available: true)
TaxiDriverLocation.create(latitude: -23.629266, longitude: -46.562340, taxi_driver_id: galvao.id)
TaxiDriverLocation.create(latitude: -23.629455, longitude: -46.562740, taxi_driver_id: galvao.id)
TaxiDriverLocation.create(latitude: -23.60810717, longitude: -46.67500346, taxi_driver_id: galvao.id)

carla = TaxiDriver.create(name: 'Carla', license_plate: 'TVO-6819', available: true)
TaxiDriverLocation.create(latitude: -23.618886, longitude: -46.676495, taxi_driver_id: carla.id)
TaxiDriverLocation.create(latitude: -23.59065045044675, longitude: -46.68837101634931, taxi_driver_id: carla.id)

wagner = TaxiDriver.create(name: 'Wagner', license_plate: 'HBO-1210', available: true)
TaxiDriverLocation.create(latitude: -23.60925506, longitude: -46.69390415, taxi_driver_id: wagner.id)

rosana = TaxiDriver.create(name: 'Rosana', license_plate: 'RAS-9876', available: true)
TaxiDriverLocation.create(latitude: -23.599871666666665, longitude: -46.680903333333326, taxi_driver_id: rosana.id)
