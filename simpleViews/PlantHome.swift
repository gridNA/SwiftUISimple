//
//  PlantHome.swift
//  simpleViews
//
//  Created by Kateryna Gridina.
//  Copyright © 2019 Kateryna Gridina. All rights reserved.
//


import SwiftUI

// 1. create a simple tabbed view with 2 tabs in it, which contain text

//struct PlantHome : View {
//    @State var index: Int = 0
//
//    var body: some View {
//        TabbedView(selection: $index) {
//            PlantList(index: 0)
//                .tabItemLabel(Image("tab0"))
//                .tag(0)
//            PlantList(index: 1).tabItemLabel(Image("tab1"))
//                .tag(1)
//            }.navigationBarTitle(Text("Plants"))
//    }
//}
//
//struct PlantList: View {
//    var index: Int
//
//    var body: some View {
//        Text("list")
//    }
//}
//
//#if DEBUG
//struct PlantHome_Previews : PreviewProvider {
//    static var previews: some View {
//        PlantHome()
//    }
//}
//#endif

















// 2. create a list view with the static text in the cell

//struct PlantList1: View {
//    var index: Int
//    var labels = ["Plant1", "Plant2", "Plant"]
//
//    var body: some View {
//        List {
//            ForEach(labels.identified(by: \.self)) { label in
//                Text(label)
//            }
//        }
//    }
//}



















//// 3. create a List with data from Plants.json
//
//struct PlantList1: View {
//    var index: Int
//    @EnvironmentObject var plantsStore: PlantLocalStore
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(plantsStore.plants) { plant in
//                   PlantCell(plant: plant)
//                }
//            } .padding(.trailing, -32.0) // to hide chevron
//        }
//    }
//}
//
//#if DEBUG
//struct PlantHome_Previews : PreviewProvider {
//
//    static var previews: some View {
//        PlantList1(index: 0).environmentObject(PlantLocalStore())
//    }
//}
//#endif





















//// 4. create a navigation button to show another screen (with text). Connect all in tabs
//
//struct PlantHome : View {
//    @State var index: Int = 0
//    let plantStore = PlantLocalStore()
//
//    var body: some View {
//        TabbedView(selection: $index) {
//            PlantList1(index: 0).environmentObject(plantStore)
//                .tabItemLabel(Image("tab0"))
//                    .tag(0)
//            PlantList2(index: 1).tabItemLabel(Image("tab1"))
//                .tag(1)
//        }.navigationBarTitle(Text("Plants"))
//    }
//}
//
//struct PlantList1: View {
//    var index: Int
//    @EnvironmentObject var plantsStore: PlantLocalStore
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(plantsStore.plants) { plant in
//                    NavigationButton(
//                    destination: Text("test")) {
//                        PlantCell(plant: plant)
//                    }
//                }
//                .navigationBarTitle(Text("Plants"), displayMode: .large)
//            } .padding(.trailing, -32.0) // to hide chevron
//        }
//    }
//}
//
//struct PlantList2: View {
//    var index: Int
//
//    var body: some View {
//        Text("list2")
//    }
//}
//
//#if DEBUG
//struct PlantHome_Previews : PreviewProvider {
//    static var previews: some View {
//       PlantHome()
//    }
//}
//#endif










// 5. create a navigation button to show another screen (with form). Connect all in tabs

struct PlantHome : View {
    @State var index: Int = 0
    let plantStore = PlantLocalStore()

    var body: some View {
        TabbedView(selection: $index) {
            PlantList1(index: 0).environmentObject(plantStore)
                .tabItemLabel(Image("tab0"))
                    .tag(0)
            PlantList2(index: 1).tabItemLabel(Image("tab1"))
                .tag(1)
        }.navigationBarTitle(Text("Plants"))
    }
}

struct PlantList1: View {
    var index: Int
    @EnvironmentObject var plantsStore: PlantLocalStore

    var body: some View {
        NavigationView {
            List {
                ForEach(plantsStore.plants) { plant in
                    NavigationButton(
                        destination: PlantsForm(plant: plant)) {
                        PlantCell(plant: plant)
                    }
                }
                .navigationBarTitle(Text("Plants"), displayMode: .large)
            } .padding(.trailing, -32.0) // to hide chevron
        }
    }
}

struct PlantList2: View {
    var index: Int

    var body: some View {
        Text("list2")
    }
}

#if DEBUG
struct PlantHome_Previews : PreviewProvider {
    static var previews: some View {
       PlantHome()
    }
}
#endif
