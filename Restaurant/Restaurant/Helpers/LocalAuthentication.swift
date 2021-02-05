//
//  LocalAuthentication.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 15/01/2021.
//

import Foundation
import LocalAuthentication
import SwiftUI

class LocalAuthentication: ObservableObject {
    
    @Published var hasEvaluated = false
    @Published var authError: (error: Bool, message: String) = (false, "")
    
    func authenticateUser() {
        if !hasEvaluated {
            print("authenticateUser")

            let context = LAContext()
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself to get In"
                print("SSS")
                
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                    [unowned self] success, authenticationError in
                    
                    DispatchQueue.main.async {
                        if success {
                            self.hasEvaluated = true
                        } else {
                            hasEvaluated = false
                            
                            switch authenticationError {
                            case .none: print("Ssss")
                            case .some(let error): print("Cascas \(error.localizedDescription)")
                            }
                            authError = (true, "Authentication failed")
                        }
                    }
                }
            } else {
                hasEvaluated = false
                authError = (true, "Your device is not configured for Touch ID.")
            }
        }
        
    }
    
}
