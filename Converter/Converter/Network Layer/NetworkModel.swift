//
//  NetworkModel.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import Foundation

struct NetworkModel {
    
}
struct NetworkList: Decodable {
    /// Returns true or false depending on whether or not the given API request was successful
    let success: Bool
    
    let fiat: [String: String]
    let crypto: [String : NetworkCrypto]
}
struct NetworkCrypto: Decodable {
    /// Returns the symbol of the respective cryptocurrency.
    let symbol: String
    /// Returns the short name of the respective cryptocurrency.
    let name: String
    /// Returns the extended name of the respective cryptocurrency, including its symbol
    let nameFull: String
    /// Returns the maximum amount of circulating supply of the respective cryptocurrency
    let maxSupply: Any // приходит либо дабл либо стринг
    /// Returns an URL to a PNG icon of the respective cryptocurrency
    let iconUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case symbol, name
        case nameFull = "name_full"
        case maxSupply = "max_supply"
        case iconUrl = "icon_url"
    }
    
    init(symbol: String, name: String, nameFull: String, maxSupply: Any, iconUrl: String) {
        self.symbol = symbol
        self.name = name
        self.nameFull = nameFull
        self.maxSupply = maxSupply
        self.iconUrl = iconUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        nameFull = try values.decode(String.self, forKey: .nameFull)
        symbol = try values.decode(String.self, forKey: .symbol)
        iconUrl = try values.decode(String.self, forKey: .iconUrl)
        do {
            maxSupply = try values.decode(String.self, forKey: .maxSupply)
        } catch {
            maxSupply = try values.decode(Double.self, forKey: .maxSupply)
        }
    }
}
