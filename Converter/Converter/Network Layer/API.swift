//
//  API.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import Foundation

enum API {
    static let base = "http://api.coinlayer.com/api"
    /// To list all available crypto and standard (fiat) currencies
    static let list = "/list"
    /// To get the latest crypto rates for all available or a specific set of cryptocurrencies
    static let live = "/live"
    
    static func prevDate(date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: date)
    }
}
