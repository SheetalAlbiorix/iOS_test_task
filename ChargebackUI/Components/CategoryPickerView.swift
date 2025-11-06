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
                    Text("Services")
                        .font(.system(size: 17, weight: .semibold))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(AppColors.activeBlue)
                }
            }
        }
       
    }
}
