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

    public var id: String { countryCode.country + rawString }
    public var countryCode: CountryCode
    public var rawString: String
    private let phoneNumberKit = PhoneNumberKit()

    public var isValid: Bool {
        phoneNumberKit.isValidPhoneNumber(rawString)
    }

    public var formattedNumber: String? {
        do {
            let phoneNumber = try phoneNumberKit.parse(rawString)
            return phoneNumberKit.format(phoneNumber, toType: .e164)
        } catch {
            print(error)
            return nil
        }
    }

    public static let locale = PhoneNumber(countryCode: .current)
    
    public init(countryCode: CountryCode) {
        self.countryCode = countryCode
        self.rawString = String()
    }
    
    public func validate() {
        guard isValid else {
            return
        }
        do {
            let phoneNumber = try phoneNumberKit.parse(rawString)
            rawString = phoneNumber.nationalNumber.description
            if let regionID = phoneNumber.regionID {
                countryCode = .init(code: regionID)
            }
        } catch {
            print(error)
        }
    }
}
