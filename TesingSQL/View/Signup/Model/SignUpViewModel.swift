//
//  SignUpViewModel.swift
//  TesingSQL
//
//  Created by Aman Jain on 26/08/24.
//

import Foundation


class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isSignUp = false
    
    func signup() async{
        
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill all fields"
            return
        }
        
        let user = User(name: name, email: email, password: password)
        
        guard let url = URL(string: "http://127.0.0.1:5000/signup") else{
            errorMessage = "Invalid URL"
            return
        }
        
        guard let encodedData = try? JSONEncoder().encode(user) else {
            errorMessage = "Failed to encode user data"
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encodedData)
            print(response)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response_message =  try decoder.decode(responseText.self, from: data)
            print(response_message)
        } catch {
            errorMessage = "Checkout failed: \(error.localizedDescription)"
        }
        

    }
    
}


struct responseText: Codable {
    var textt: String
}
