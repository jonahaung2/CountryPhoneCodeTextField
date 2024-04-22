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
    
    public init(phoneNumber: Binding<PhNumber>) {
        self.phoneNumber = phoneNumber
    }
    public var body: some View {
        HStack {
            Text(phoneNumber.wrappedValue.countryCode.country)
                ._presentSheet {
                    CountryCodePickerView(countryCode: phoneNumber.countryCode)
                }
            Divider()
            
            TextField(phoneNumber.wrappedValue.plceHolder, text: phoneNumber.rawString)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
            Text(phoneNumber.wrappedValue.countryCode.flag)
                ._presentSheet {
                    CountryCodePickerView(countryCode: phoneNumber.countryCode)
                }
        }
        .padding(3)
    }
}
