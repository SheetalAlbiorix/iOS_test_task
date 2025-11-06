//
//  FormRow.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Form Row Component
struct FormRow: View {
    let label: String
    let value: String
    let imageValue: String
    let placeholder: String
    let isButton: Bool
    var action: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color.gray)
            
            Spacer()
            
            if isButton {
                Button(action: { action?() }) {
                    HStack(spacing: 4) {
                        if (imageValue != "") {
                            Image(systemName: imageValue)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 24)
                        }

                        Text(value)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(value == placeholder ? Color.gray.opacity(0.5) : Color.black)
                        
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                }
            } else {
                Text(value)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.vertical, 12)
    }
}
