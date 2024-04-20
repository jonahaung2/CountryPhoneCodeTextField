//
//  PhoneNumber.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import Foundation
import PhoneNumberKit

@Observable
public class PhNumber {

    public var id: String { countryCode.country + rawString }
    public var countryCode: CountryCode
    public var rawString: String
    public var number: PhoneNumber?
    private let phoneNumberKit = PhoneNumberKit()

    public var isValid: Bool {
        number != nil
    }

    public var formattedNumber: String? {
        guard let number else { return nil }
        return phoneNumberKit.format(number, toType: .e164)
    }

    public static let locale = PhNumber(countryCode: .current)
    
    public init(countryCode: CountryCode) {
        self.countryCode = countryCode
        self.rawString = String()
    }
    
    public func validate() {
        
        do {
            number = try phoneNumberKit.parse(rawString)
            if let regionID = number?.regionID {
                countryCode = .init(code: regionID)
            }
        } catch {
            number = nil
        }
    }
}
