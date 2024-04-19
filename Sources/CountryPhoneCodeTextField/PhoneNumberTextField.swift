//
//  PhoneNumberTextField.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import SwiftUI

public struct PhoneNumberTextField: View {
    
    private var phoneNumber: Binding<PhoneNumber>
    @State private var showPicker = false
    @FocusState private var isTextFieldFocused: Bool?
    
    public init(phoneNumber: Binding<PhoneNumber>) {
        self.phoneNumber = phoneNumber
    }
    
    public var body: some View {
        HStack {
            Button {
                showPicker = true
            } label: {
                Text(phoneNumber.wrappedValue.countryCode.flag)
                    .font(.system(size: 30, weight: .light))
            }
            .buttonStyle(.borderless)
            Divider()
            
            TextField("\(phoneNumber.wrappedValue.countryCode.country) mobile no", text: phoneNumber.number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($isTextFieldFocused, equals: true)
                .font(.system(size: 28, weight: .light))
        }
        .padding(3)
        .sheet(isPresented: $showPicker, onDismiss: {
            
        }, content: {
            CountryCodePickerView(countryCode: phoneNumber.countryCode)
        })
        .onAppear {
            isTextFieldFocused = true
        }
    }
}
