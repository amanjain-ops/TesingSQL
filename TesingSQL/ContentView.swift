//
//  ContentView.swift
//  TesingSQL
//
//  Created by Aman Jain on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignUpView()
    }
}

#Preview {
    ContentView()
}

struct TextFieldView: View {
    var textLabel: String
    @Binding var txt: String
    var body: some View {
        VStack {
            if textLabel == "Password" {
                SecureField(textLabel, text: $txt)
                    .autocorrectionDisabled()
            }
            else {
                TextField(textLabel, text: $txt)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
            
        }
    }
}
