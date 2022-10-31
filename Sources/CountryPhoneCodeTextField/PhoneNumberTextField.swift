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
            }
            .buttonStyle(.plain)

            TextField("Phone Number", text: phoneNumber.nationalNumber)
                .keyboardType(.phonePad)
                .textContentType(.telephoneNumber)
                .focused($isTextFieldFocused, equals: true)
        }
        .sheet(isPresented: $showPicker, onDismiss: {
            isTextFieldFocused = true
        }, content: {
            CountryCodePickerView(countryCode: phoneNumber.countryCode)
        })
    }
}
