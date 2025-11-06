//
//  SubscriptionService.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Subscription Service Model
struct SubscriptionService: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    let icon: String
}
