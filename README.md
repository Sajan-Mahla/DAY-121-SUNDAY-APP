# 🪙 CryptoView  
**Day 121 — Sunday Build**

A minimal and elegant SwiftUI app that displays the top 10 cryptocurrencies with live pricing powered by the CoinGecko API.

## 🚀 Features
- Live crypto prices (USD)
- Async/Await API fetching
- SwiftUI + MVVM Architecture
- Lightweight and modern UI

## 🧩 Tech Stack
- **Language:** Swift
- **Framework:** SwiftUI
- **API:** CoinGecko (Public)
- **Architecture:** MVVM
- **Concurrency:** async/await

## 🧠 How It Works
1. `CryptoViewModel` fetches JSON from CoinGecko.
2. Data is decoded into `Crypto` model.
3. `ContentView` lists coins with images, symbols, and live prices.

## 📸 Preview
```swift
List(viewModel.cryptos) { crypto in
    HStack {
        AsyncImage(url: URL(string: crypto.image))
        Text(crypto.name)
        Spacer()
        Text("$\(crypto.current_price, specifier: "%.2f")")
    }
}
