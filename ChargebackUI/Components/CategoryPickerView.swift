//
//  CategoryPickerView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Bottom Sheet Category Picker
struct CategoryPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedCategory: SubscriptionCategory
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ForEach(SubscriptionCategory.allCases) { category in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedCategory = category
                        }
                    }) {
                        HStack(spacing: 16) {
                            // Icon
                            Image(systemName: category.icon)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 24)
                            
                            // Name
                            Text(category.rawValue)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            // Checkmark
                            if selectedCategory == category {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(AppColors.activeBlue)
                            }
                        }
                        .padding(.horizontal, 20)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if category != SubscriptionCategory.allCases.last {
                        Divider()
                            .padding(.leading, 20)
                    }
                }
                .padding(.top, 16)
                
                Spacer()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(AppStrings.category)
                        .font(.system(size: 18, weight: .medium))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppStrings.done) {
                        dismiss()
                    }
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.activeBlue)
                }
            }
        }
       
    }
}
