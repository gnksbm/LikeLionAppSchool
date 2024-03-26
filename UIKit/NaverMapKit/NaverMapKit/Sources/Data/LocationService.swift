//
//  LocationService.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation
import CoreLocation

import RxSwift

final class LocationService: NSObject {
    private let locationManager = CLLocationManager()
    
    let locationResponse = BehaviorSubject<LocationResponse>(
        value: .notAuthorized
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAuthorize() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            locationResponse.onNext(.notAuthorized)
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        @unknown default:
            locationResponse.onNext(.error)
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            print(location)
            locationResponse.onNext(.authorized(location))
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        locationResponse.onNext(.error)
    }
}
