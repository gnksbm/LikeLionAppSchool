//
//  LocationResponse.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import CoreLocation
import Foundation

enum LocationResponse {
    case notAuthorized, error, authorized(CLLocation)
}
