//
//  PhoneNumber.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import Foundation

public class PhoneNumber: ObservableObject {

    public var id: String { countryCode.country + number }
    @Published public var countryCode: CountryCode
    @Published public var number: String

    public var isValid: Bool {
        number.allSatisfy{ $0.isNumber } && !number.isEmpty
    }

    public var formattedNumber: String {
        countryCode.phoneCode + number
    }

    public static let locale = PhoneNumber(countryCode: .current)
    
    public init(countryCode: CountryCode) {
        self.countryCode = countryCode
        self.number = String()
    }
}
