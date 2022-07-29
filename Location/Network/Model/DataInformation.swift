//
//  DataInformation.swift
//  Location
//
//  Created by macbook on 27/07/2022.
//

import Foundation



// MARK: - InformationElement
struct DataInformationElement: Codable {
    let type: String
    let content: Content
}

// MARK: - Content
struct Content: Codable {
    let image: String?
    let name, email, title: String?
    let pin: String?
    let lat, lng: Double?
    let source, value: String?
}

typealias DataInformation = [DataInformationElement]
