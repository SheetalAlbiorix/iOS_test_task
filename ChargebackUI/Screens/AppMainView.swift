//
//  AppMainView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

struct AppMainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text(AppStrings.welcomeToChargebackUI)
                    .font(.system(size: 18, weight: .semibold))
                
                // Navigation Button
                NavigationLink(destination: CreateSubscriptionView()) {
                    Text(AppStrings.createSubscriptionTitle)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(AppColors.activeBlue)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
            }
        }
    }
}


#Preview {
    AppMainView()
}
