//
//  FrequencyPickerView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Frequency Picker View
struct FrequencyPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedFrequency: Frequency
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ForEach(Frequency.allCases, id: \.self) { frequency in
                    Button(action: {
                        selectedFrequency = frequency
                    }) {
                        HStack {
                            Text(frequency.rawValue)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if selectedFrequency == frequency {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(AppColors.activeBlue)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    if frequency != Frequency.allCases.last {
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
                    Text(AppStrings.frequency)
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
