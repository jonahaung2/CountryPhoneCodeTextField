//
//  PhoneNumber.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import Foundation
import PhoneNumberKit

@Observable
public class PhoneNumber {

    public var id: String { countryCode.country + number }
    public var countryCode: CountryCode
    public var number: String
    private let phoneNumberKit = PhoneNumberKit()

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
    
    public func validate() {
        do {
            let phoneNumber = try phoneNumberKit.parse(number)
            number = phoneNumber.nationalNumber.description
        } catch {
            print("Generic parser error")
        }
    }
}
