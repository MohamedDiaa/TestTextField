//
//  MainView.swift
//  TestTextField
//
//  Created by Mohamed Alwakil on 2022-06-27.
//

import SwiftUI

struct MainView: View {
    
    @State var text: String
    @State var text2: String

    @State public var txt1isFirstResponder: Bool = false
    @State public var txt2isFirstResponder: Bool = false

    var body: some View {
        
        VStack(alignment: .leading){
           
            Text("Text Fields!")
            Divider()
            TextFieldWrapper(text: $text, isFirstResponder: $txt1isFirstResponder)
            
            Button("Focus textfield iOS 15") {
                //print(text)
                txt1isFirstResponder = true
                txt2isFirstResponder = false
            }
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5 ))
            .border(.foreground)

            Divider()
            LegacyTextField(text: $text2, isFirstResponder: $txt2isFirstResponder) {field in
                field.placeholder = "Fill Field"
            }
                .frame(height: 30)
            Divider()
            
            Button("Focus Legacy text field iOS 14") {
                //print(text)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    txt2isFirstResponder = true
                    txt1isFirstResponder = false
                }
            }
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5 ))
            .border(.foreground)

            Divider()
            
            Button("dismiss all") {
                txt2isFirstResponder = false
                txt1isFirstResponder = false
            }
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5 ))
            .border(.foreground)

        }
        .padding(.leading, 20)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(text: "", text2: "")
    }
}
