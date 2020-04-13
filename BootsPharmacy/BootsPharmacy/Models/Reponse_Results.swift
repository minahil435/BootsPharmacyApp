//
//  Reponse_Results.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 13/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let Response = try? newJSONDecoder().decode(Response.self, from: jsonData)

import Foundation

// MARK: - Response
struct Response: Codable {
    let latitude, longitude: Double
    let offset: Int
    let order: JSONNull?
    let radius: Int
    let results: [Results]
    let size, total: Int
    let type: String
}

// MARK: - Result
struct Results: Codable {
    let addressLine1, addressLine2, addressLine3, addressLine4: String
    let addressLine5: AddressLine5
    let administrativeArea: AdministrativeArea
    let clinicalSystems: [ClinicalSystem]?
    let contactTelephoneNumber, email, latitude, longitude: String
    let mobileNumber, postcode, practiceCode: String
    let practiceID: Int
    let practiceName: String
    let preferredMethodOfCommunication: PreferredMethodOfCommunication
    let prescriptionAvailable: Bool
    let status: String

    enum CodingKeys: String, CodingKey {
        case addressLine1, addressLine2, addressLine3, addressLine4, addressLine5, administrativeArea, clinicalSystems, contactTelephoneNumber, email, latitude, longitude, mobileNumber, postcode, practiceCode
        case practiceID = "practiceId"
        case practiceName, preferredMethodOfCommunication, prescriptionAvailable, status
    }
}

enum AddressLine5: String, Codable {
    case null = "null"
}

enum AdministrativeArea: String, Codable {
    case eng = "ENG"
}

// MARK: - ClinicalSystem
struct ClinicalSystem: Codable {
    let gpLinkEnabled, onlineAppointments, onlineOrder: Bool
    let type: String
}

enum PreferredMethodOfCommunication: String, Codable {
    case telephone = "Telephone"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

