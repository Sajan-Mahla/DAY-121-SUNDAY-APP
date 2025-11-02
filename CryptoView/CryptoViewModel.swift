//
//  CryptoViewModel.swift
//  CryptoView
//
//  Created by SAJAN  on 24/07/25.
//

import Foundation

@MainActor
class CryptoViewModel: ObservableObject {
    @Published var cryptos: [Crypto] = []
    
    func fetchCryptos() async {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedCryptos = try JSONDecoder().decode([Crypto].self, from: data)
            cryptos = decodedCryptos
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
}
