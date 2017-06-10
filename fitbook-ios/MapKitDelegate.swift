//
//  MapKitDelegate.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import MapKit

class MapKitDelegate: NSObject, MKMapViewDelegate {

    let locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()
    }

    func getLocationRequest(mapView: MKMapView) -> GymRequestParameters {
        let bounds = mapView.bounds
        let nw = CGPoint(x: bounds.origin.x + bounds.size.width, y: bounds.origin.y)
        let se = CGPoint(x: bounds.origin.x,
                         y: bounds.origin.y + bounds.size.height)
        let nwCoord = mapView.convert(nw, toCoordinateFrom: mapView)
        let seCoord = mapView.convert(se, toCoordinateFrom: mapView)
        let nwLocation = Location(coord: nwCoord)
        let seLocation = Location(coord: seCoord)
        return GymRequestParameters(LocationRequest(nwLocation, seLocation))
    }

    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let locationCorrds: CLLocationCoordinate2D = mapView.userLocation.location!.coordinate
        let viewRegion = MKCoordinateRegionMakeWithDistance(locationCorrds, 3000, 3000)
        let adjustedRegion = mapView.regionThatFits(viewRegion)
        mapView.setRegion(adjustedRegion, animated: true)
    }

    func initLocationWithPermission(mapView: MKMapView, firstTime: Bool) {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            mapView.delegate = self
            DispatchQueue.main.async {
                self.locationManager.startUpdatingLocation()
            }
        } else if firstTime {
            locationManager.requestWhenInUseAuthorization()
            initLocationWithPermission(mapView: mapView, firstTime: false)
        }
    }

    func initMap(mapView: MKMapView) {
        locationManager.startUpdatingLocation()
        initLocationWithPermission(mapView: mapView, firstTime: true)
    }

}
