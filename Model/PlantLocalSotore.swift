//
//  PlantLocalStore.swift
//  simpleViews
//
//  Created by Kateryna Gridina.
//  Copyright © 2019 Kateryna Gridina. All rights reserved.
//

import Combine
import SwiftUI

final class PlantLocalStore: BindableObject {
    let didChange = PassthroughSubject<PlantLocalStore, Never>()
    
    var plants = plantsData {
        didSet {
            didChange.send(self)
        }
    }
}



