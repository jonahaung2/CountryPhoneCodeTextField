//
//  PhoneNumber.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import Foundation

public struct PhoneNumber: Identifiable {

    public var id: String { countryCode.country + nationalNumber }
    public var countryCode: CountryCode
    public var nationalNumber: String

    public var isValid: Bool {
        nationalNumber.allSatisfy{ $0.isNumber } && !nationalNumber.isEmpty
    }

    public var formattedNumber: String {
        countryCode.phoneCode + nationalNumber
    }

    public static let locale = PhoneNumber(countryCode: .current, nationalNumber: String())
}
