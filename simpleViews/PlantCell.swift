//
//  ContentView.swift
//  simpleViews
//
//  Created by Kateryna Gridina.
//  Copyright © 2019 Kateryna Gridina. All rights reserved.
//

import SwiftUI



// 1. create eliptical image

//struct PlantImage: View {
//    var body: some View {
//        Image("plant1")
//            .frame(width: 120, height: 100) .scaledToFit()
//    }
//}


























// 2. add shadow to the image

//struct PlantImage: View {
//    var body: some View {
//        Image("plant1")
//            .frame(width: 120, height: 100) .scaledToFit().clipShape(Ellipse()).overlay(Ellipse().stroke(Color.gray, lineWidth: 4)).shadow(radius: 4)
//    }
//}




























// 3. add image title and subtitle on the right of the image

//struct PlantImage: View {
//    var body: some View {
//        Image("plant1")
//            .frame(width: 120, height: 100) .scaledToFit().clipShape(Ellipse()).overlay(Ellipse().stroke(Color.gray, lineWidth: 4)).shadow(radius: 4)
//    }
//}
//
//struct PantCell : View {
//    var body: some View {
//        GeometryReader { geometry in
//            HStack (alignment: .center, spacing: 16) {
//                PlantImage()
//                    .offset(x: 11.0)
//                VStack(alignment: .leading, spacing: 16) {
//                    Text("Aloe")
//                        .font(.title)
//                    Text("Non toxic")
//                        .font(.subheadline)
//                    }.offset(x: 11.0)
//            }
//        }
//    }
//}





























//// 4. place the cell on the top of the screen
//
//struct PlantImage: View {
//    var body: some View {
//        Image("plant1")
//            .frame(width: 120, height: 100) .scaledToFit().clipShape(Ellipse()).overlay(Ellipse().stroke(Color.gray, lineWidth: 4)).shadow(radius: 4)
//    }
//}
//
//struct PlantCell : View {
//    var body: some View {
//        GeometryReader { geometry in
//            HStack (alignment: .center, spacing: 16) {
//                PlantImage()
//                    .offset(x: 11.0)
//                VStack(alignment: .leading, spacing: 16) {
//                    Text("Aloe")
//                        .font(.title)
//                    Text("Non toxic")
//                        .font(.subheadline)
//                    }.offset(x: 11.0)
//            }
//        }
//    }
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        PlantCell()
//    }
//}
//#endif









//// 5. Transfer data to the cell
//
//struct PlantImage: View {
//
//    var imageURL: String?
//    @State var isImage: Bool = true
//
//    private var imgSource: CGImageSource? {
//        guard let imageURL = imageURL, let u = NSURL(string: imageURL) else {
//            isImage = false
//            return nil
//
//        }
//        return (CGImageSourceCreateWithURL(u, nil))
//    }
//
//    private var image: CGImage? {
//        guard let imgS = imgSource else {
//            isImage = false
//            return nil
//
//        }
//        return CGImageSourceCreateImageAtIndex(imgS, 0, nil)
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            if self.isImage {
//                Image(image!, scale: 2, label: Text("img"))
//                    .frame(width: 120, height: 100) .scaledToFit().clipShape(Ellipse()).overlay(Ellipse().stroke(Color.gray, lineWidth: 4)).shadow(radius: 4)
//
//            }
//        }
//    }
//}
//
//struct PlantCell : View {
//
//    @ObjectBinding var plant: Plant
//
//    var body: some View {
//        HStack (alignment: .center, spacing: 16) {
//            PlantImage(imageURL: self.plant.imageURL)
//                .offset(x: 11.0)
//            VStack(alignment: .leading, spacing: 16) {
//                Text(self.plant.name)
//                    .font(.title)
//                Text(self.plant.shortDescription)
//                    .font(.subheadline)
//                }.offset(x: 11.0)
//        }
//    }
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        PlantCell(plant: Plant())
//    }
//}
//#endif













// 6. add picker

struct PlantImage: View {
    
    var imageURL: String?
    @State var isImage: Bool = true
    
    private var imgSource: CGImageSource? {
        guard let imageURL = imageURL, let u = NSURL(string: imageURL) else {
            isImage = false
            return nil
            
        }
        return (CGImageSourceCreateWithURL(u, nil))
    }
    
    private var image: CGImage? {
        guard let imgS = imgSource else {
            isImage = false
            return nil
            
        }
        return CGImageSourceCreateImageAtIndex(imgS, 0, nil)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if self.isImage {
                Image(image!, scale: 2, label: Text("img"))
                    .frame(width: 120, height: 100) .scaledToFit().clipShape(Ellipse()).overlay(Ellipse().stroke(Color.gray, lineWidth: 4)).shadow(radius: 4)
                
            }
        }
    }
}

struct PlantCell : View {
    
    @ObjectBinding var plant: Plant
    
    var body: some View {
        HStack (alignment: .center, spacing: 16) {
            PlantImage(imageURL: self.plant.imageURL)
                .offset(x: 11.0)
            VStack(alignment: .leading, spacing: 16) {
                Text(self.plant.name)
                    .font(.title)
                Text(self.plant.shortDescription)
                    .font(.subheadline)
                Text("\(self.plant.toxicity.rawValue)")
                    .font(.subheadline)
                }.offset(x: 11.0)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        PlantCell(plant: Plant())
    }
}
#endif
