//
//  Model.swift
//  rsttur_karavaev
//
//  Created by Sergey on 08/05/23.
//

import Foundation

struct Response: Codable {
    let success: Bool
    let error: String?
    let time: String
    let data: DataClass
}

struct DataClass: Codable {
    let geo: Geo
    let categories: [Category]
    let objects: [Object]
}

struct Geo: Codable {
    let lat: Double
    let lon: Double
}

struct Category: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let type: String
    let icon: String
    let color: String
    let count: Int
}

struct Object: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let type: String
    let icon: String
    let color: String
    let lat: Double
    let lon: Double
    let workingHours: [WorkingHour]?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, image, type, icon, color, lat, lon
        case workingHours = "workingHours"
    }
}

struct WorkingHour: Codable {
    let days: [Int]
    let from: String
    let to: String
}
