//
//  SubscriptionCategory.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Category Model
enum SubscriptionCategory: String, CaseIterable, Identifiable {
    case subscription = "Subscription"
    case utility = "Utility"
    case cardPayment = "Card Payment"
    case loan = "Loan"
    case rent = "Rent"
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .subscription: return "repeat.circle"
        case .utility: return "wrench.and.screwdriver"
        case .cardPayment: return "creditcard"
        case .loan: return "dollarsign.circle"
        case .rent: return "house"
        }
    }
}
