//
//  Plant.swift
//  simpleViews
//
//  Created by Kateryna Gridina.
//  Copyright © 2019 Kateryna Gridina. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

let plantsData: [Plant] = load("Plants.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


enum Toxicity: String, Codable, CaseIterable {
    case toxic = "toxic"
    case nonToxic = "non toxic"
    case toxicRoots = "toxic roots"
}

class Plant: Codable, Identifiable, BindableObject {
    
    static func == (lhs: Plant, rhs: Plant) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, shortDescription, toxicity, imageURL
    }
    
    let didChange = PassthroughSubject<Plant, Never>()
    
    var id: Int = 0 { didSet { didChange.send(self) }}
    var name: String = "" { didSet { didChange.send(self) }}
    var shortDescription: String = "" { didSet { didChange.send(self) }}
    var toxicity: Toxicity = .nonToxic { didSet { didChange.send(self) }}
    var imageURL: String? { didSet { didChange.send(self) }}
}
