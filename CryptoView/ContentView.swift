//
//  ContentView.swift
//  CryptoView
//
//  Created by SAJAN  on 24/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CryptoViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.cryptos) { crypto in
                HStack {
                    AsyncImage(url: URL(string: crypto.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(crypto.name)
                            .font(.headline)
                        Text(crypto.symbol.uppercased())
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text("$\(crypto.current_price, specifier: "%.2f")")
                        .bold()
                }
            }
            .navigationTitle("CryptoView")
            .task {
                await viewModel.fetchCryptos()
            }
        }
    }
}

#Preview {
    ContentView()
}
