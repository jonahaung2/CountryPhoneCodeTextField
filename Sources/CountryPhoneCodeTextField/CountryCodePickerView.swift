//
//  CountryCodePickerView.swift
//  CountryPhoneCodePicker
//
//  Created by Aung Ko Min on 31/10/22.
//

import SwiftUI

public struct CountryCodePickerView: View {

    @Binding public var countryCode: CountryCode

    @State private var searchText = ""
    private var displayedCodes: [CountryCode] {
        if searchText.isEmpty {
            return CountryCode.allCodes
        } else {
            return CountryCode.allCodes.filter{ $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    @Environment(\.dismiss) private var dismiss

    public var body: some View {
        NavigationView {
            List {
                ForEach(displayedCodes) { code in
                    Button {
                        countryCode = code
                        dismiss()
                    } label: {
                        HStack {
                            Text(code.flag)
                            HStack {
                                Text(code.name)
                                    .foregroundColor(.primary)
                                Spacer()
                                Text(code.phoneCode)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .buttonStyle(.borderless)
                }
            }
            .navigationTitle("Country Picker")
            .searchable(text: $searchText, prompt: "Search country by name")
        }
    }
}
