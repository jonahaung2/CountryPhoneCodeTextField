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
            HStack {
                Text(phoneNumber.wrappedValue.countryCode.flag)
                Text("+"+phoneNumber.wrappedValue.countryCode.phoneCode)
            }
            ._presentSheet {
                CountryCodePickerView(countryCode: phoneNumber.countryCode)
            }
            Divider()
            
            TextField("\(phoneNumber.countryCode.wrappedValue.country)", text: phoneNumber.rawString)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
        }
        .padding(3)
    }
}
