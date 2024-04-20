//
//  PhoneNumberTextField.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import SwiftUI
import XUI

public struct PhoneNumberTextField: View {
    
    private var phoneNumber: Binding<PhoneNumber>
    @FocusState private var isTextFieldFocused: Bool?
    
    init(phoneNumber: Binding<PhoneNumber>, isTextFieldFocused: Bool? = nil) {
        self.phoneNumber = phoneNumber
    }
    public var body: some View {
        HStack {
            Text(phoneNumber.countryCode.wrappedValue.flag)
                ._tapToPush {
                    CountryCodePickerView(countryCode: phoneNumber.countryCode)
                }
            Divider()
            
            TextField("\(phoneNumber.countryCode.wrappedValue.country) mobile no", text: phoneNumber.number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($isTextFieldFocused, equals: true)
        }
        .padding(3)
    }
}
