//
//  Crypto.swift
//  CryptoView
//
//  Created by SAJAN  on 24/07/25.
//

import Foundation

struct Crypto: Codable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let current_price: Double
    let image: String
}
