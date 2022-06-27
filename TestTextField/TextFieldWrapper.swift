//
//  TextFieldWrapper.swift
//  TestTextField
//
//  Created by Mohamed Alwakil on 2022-06-27.
//

import SwiftUI

struct TextFieldWrapper: View {
   
    @Binding var text: String
    @Binding var isFirstResponder: Bool
    @FocusState var focused: Bool

    var body: some View {

        TextField("Fill field", text: $text)
            .focused($focused)
            .onReceive([self.isFirstResponder].publisher.first()){ value in
                self.focused = value
            }
            .onSubmit {

                self.isFirstResponder = false
            }
            .onChange(of: focused) { newValue in
                self.isFirstResponder = newValue
            }
    }
}
