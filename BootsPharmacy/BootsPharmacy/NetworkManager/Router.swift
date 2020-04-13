//
//  Router.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 13/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import CoreLocation


// https://www.boots.com/online/pharmacy/gateway/api/1.0/search/gp?type=geo&latitude=53.10537679999999&longitude=-1.3272051999999803&radius=3&from=0

enum Router {
    
    case getPharmacies(_ location: CLLocation, _ radius : Float)
    // If there are other endpoints to hit, we will add more cases here.
    
    var scheme: String {
        switch self {
        case .getPharmacies:
            return "https"
        }
    }
    var host: String {
        switch self {
        case .getPharmacies:
            return "www.boots.com"
        }
    }
    var path: String {
        switch self {
        case .getPharmacies:
            return "/online/pharmacy/gateway/api/1.0/search/gp"
        }
    }
    var parameters: [URLQueryItem] {
        
        switch self {
        case .getPharmacies(let locattion, let radius):
            
            return [URLQueryItem(name: "type", value: "geo"),
                    URLQueryItem(name: "latitude",value: "\(locattion.coordinate.latitude)"),
                    URLQueryItem(name: "longitude",value: "\(locattion.coordinate.longitude)"),
                    URLQueryItem(name: "radius",value:"\(radius)"),
                    URLQueryItem(name: "from",value: "0")]
        }
    }
    var method: String {
        switch self {
        case .getPharmacies:
            return "GET"
        }
    }
}
