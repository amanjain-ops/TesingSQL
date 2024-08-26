//
//  SignUpView.swift
//  TesingSQL
//
//  Created by Aman Jain on 26/08/24.
//

import SwiftUI

struct SignUpView: View {
    
    
    @StateObject var user = SignUpViewModel()
    
    var body: some View {
        VStack(alignment:.leading) {
            
            if user.isSignUp {
                Text("Account Created.")
            }
            
            Text("Sign Up")
                .font(.title)
                .fontWeight(.semibold)
            
            // text field
            TextFieldView(textLabel: "Name", txt: $user.name)
                .padding(.vertical, 4)
                
            TextFieldView(textLabel: "Email", txt: $user.email)
                .padding(.vertical, 4)
            
            TextFieldView(textLabel: "Password", txt: $user.password)
                .padding(.vertical, 4)
            
            
            if let errorMessage = user.errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            // Button
            HStack {
                Spacer()
                Button {
                    Task {
                        await user.signup()
                    }
                } label: {
                    Text("Sign up")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.vertical, 4)
                Spacer()
            }
        }
        .padding()
        
        
    }
}

#Preview {
    SignUpView()
}
