//
//  PhoneNumberTextField.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import SwiftUI
import XUI

public struct PhoneNumberTextField: View {
    
    private var phoneNumber: Binding<PhNumber>
    @FocusState private var isTextFieldFocused: Bool?
    
    public init(phoneNumber: Binding<PhNumber>) {
        self.phoneNumber = phoneNumber
    }
    public var body: some View {
        HStack {
            HStack {
                Text(phoneNumber.wrappedValue.countryCode.flag)
                Divider()
                Text(phoneNumber.wrappedValue.countryCode.phoneCode)
            }
            ._presentSheet {
                CountryCodePickerView(countryCode: phoneNumber.countryCode)
            }
            Divider()
            
            TextField("\(phoneNumber.countryCode.wrappedValue.country) mobile no", text: phoneNumber.rawString)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($isTextFieldFocused, equals: true)
        }
        .padding(3)
    }
}
