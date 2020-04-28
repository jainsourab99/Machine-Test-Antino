//
//  UserDetailsModel.swift
//  Machine Test
//
//  Created by Sourabh Jain on 28/04/20.
//  Copyright © 2020 Sourabh Jain. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct UserDetailsModel: Codable {
    let url: String?
    let name, age, location: String?
    let details: [String]?
    let bodyType, userDesire: String?

    enum CodingKeys: String, CodingKey {
        case url, name, age, location
        case details = "Details"
        case bodyType, userDesire
    }
}

typealias UserModel = [UserDetailsModel]
