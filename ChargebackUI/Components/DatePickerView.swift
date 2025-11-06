//
//  DatePickerView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
                // Wheel Picker
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .accentColor(AppColors.activeBlue)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                
                Spacer()
            }
            .background(AppColors.white)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(AppStrings.startDate)
                        .font(.system(size: 18, weight: .medium))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppStrings.done) {
                        isPresented = false
                    }
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.activeBlue)
                }
            }
        }
    }
}
