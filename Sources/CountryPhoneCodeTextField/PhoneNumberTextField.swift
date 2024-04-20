//
//  PhoneNumberTextField.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import SwiftUI
import XUI

public struct PhoneNumberTextField: View {
    
    @Binding public var phoneNumber: PhoneNumber
    @FocusState private var isTextFieldFocused: Bool?
    
    public var body: some View {
        HStack {
            Text(phoneNumber.countryCode.flag)
                ._tapToPush {
                    CountryCodePickerView(countryCode: $phoneNumber.countryCode)
                }
            Divider()
            
            TextField("\(phoneNumber.countryCode.country) mobile no", text: $phoneNumber.number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($isTextFieldFocused, equals: true)
        }
        .padding(3)
    }
}
