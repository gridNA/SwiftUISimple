//
//  PlantsForm.swift
//  simpleViews
//
//  Created by Kateryna Gridina.
//  Copyright © 2019 Kateryna Gridina. All rights reserved.
//

import SwiftUI
import Combine

//// 1. create a form with the name of the plant
//
//struct LabelTextField : View {
//    var label: String
//    var placeHolder: String? = ""
//    @ObjectBinding var plant: Plant
//
//    var body: some View {
//
//        VStack(alignment: .leading) {
//            Text(label)
//                .font(.headline)
//            TextField($plant.name, placeholder: Text(placeHolder ?? ""))
//            .padding(.all)
//            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), cornerRadius: 5.0)
//            }
//            .padding(.horizontal, 15)
//    }
//}
//
//
//struct PlantsForm : View {
//    @ObjectBinding var plant: Plant
//
//    var body: some View {
//        NavigationView {
//            List {
//                VStack(alignment: .leading) {
//                    LabelTextField(label: "NAME", plant: plant)
//                }
//            }
//        }
//        .navigationBarTitle(Text("Plants editor"))
//    }
//}
//
//#if DEBUG
//struct PlantsForm_Previews : PreviewProvider {
//
//    static var previews: some View {
//       PlantsForm(plant: Plant())
//    }
//}
//#endif
//
//
//
//








// 2. add picker

struct LabelTextField : View {
    var label: String
    var placeHolder: String? = ""
    @ObjectBinding var plant: Plant
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField($plant.name, placeholder: Text(placeHolder ?? ""))
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), cornerRadius: 5.0)
            }
            .padding(.horizontal, 15)
    }
}


struct PlantsForm : View {
    @ObjectBinding var plant: Plant
    
    var body: some View {
        
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    LabelTextField(label: "NAME", plant: plant)
                    Picker(selection: $plant.toxicity, label: Text("Toxicity")) {
                        ForEach(Toxicity.allCases.identified(by: \.self)) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("Plants editor"))
        
    }
}

#if DEBUG
struct PlantsForm_Previews : PreviewProvider {
    
    static var previews: some View {
        PlantsForm(plant: Plant())
    }
}
#endif

