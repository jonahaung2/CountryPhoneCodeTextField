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
        phoneNumberKit.isValidPhoneNumber(number)
    }

    public var formattedNumber: String? {
        do {
            let phoneNumber = try phoneNumberKit.parse(number)
            return phoneNumberKit.format(phoneNumber, toType: .e164)
            
        } catch {
            print(error)
            return nil
        }
    }

    public static let locale = PhoneNumber(countryCode: .current)
    
    public init(countryCode: CountryCode) {
        self.countryCode = countryCode
        self.number = String()
    }
    
    public func validate() {
        guard isValid else {
            countryCode = .current
            return
        }
        do {
            let phoneNumber = try phoneNumberKit.parse(number)
            number = phoneNumber.nationalNumber.description
            if let regionID = phoneNumber.regionID {
                countryCode = .init(code: regionID, phoneCode: phoneNumber.countryCode.description)
            }
        } catch {
            countryCode = .current
        }
    }
}
