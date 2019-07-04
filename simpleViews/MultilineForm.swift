////
////  MultilineForm.swift
////  simpleViews
////
////  Created by Kateryna Gridina.
////  Copyright © 2019 Kateryna Gridina. All rights reserved.
////
//
//import SwiftUI
//import Combine
//
//struct MultilineTextView: UIViewRepresentable {
//    @Binding var text: String
//    
//    func makeUIView(context: Context) -> UITextView {
//        let view = UITextView()
//        view.isScrollEnabled = true
//        view.isEditable = true
//        view.isUserInteractionEnabled = true
//        view.backgroundColor = .red
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//    }
//}
//
//final class UserInput: BindableObject  {
//    let didChange = PassthroughSubject<UserInput, Never>()
//    
//    var text = "" {
//        didSet {
//            didChange.send(self)
//        }
//    }
//    
//    init(text: String) {
//        self.text = text
//    }
//}
//
//struct MultilineForm : View {
//    @ObjectBinding var userInput = UserInput(text: "String")
//    var body: some View {
//      
//        MultilineTextView(text: $userInput.text).frame( minHeight: 100, idealHeight: 200, maxHeight: 250)
//    }
//}
//
//#if DEBUG
//struct MultilineForm_Previews : PreviewProvider {
//    static var previews: some View {
//        MultilineForm()
//    }
//}
//#endif
