//
//  CryptoAppWidget.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/24/22.
//

import SwiftUI
import WidgetKit
import Charts

struct CryptoAppWidget: Widget {
  let kind: String = "CryptoAppWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      CryptoWidgetEntryView(crypto: entry)
    }
    .supportedFamilies([.systemMedium, .accessoryRectangular])
    .configurationDisplayName("My widget")
    .description("Example Widget")
  }
}

struct Crypto: TimelineEntry, Codable {
  var date: Date = .init()
  var priceChange: Double = 0.0
  var currentPrice: Double = 0.0
  var last7Days: SparklineData = .init()
  
  enum CodingKeys: String, CodingKey {
    case priceChange = "price_change_percentage_7d_in_currency"
    case currentPrice = "current_price"
    case last7Days = "sparkline_in_7d"
  }
}

struct SparklineData: Codable {
  var price: [Double] = []
  
  enum CodingKeys: String, CodingKey {
    case price = "price"
  }
}

struct Provider: TimelineProvider {
  func getTimeline(in context: Context, completion: @escaping (Timeline<Crypto>) -> Void) {
    let currentDate = Date()
    
    Task {
      if var cryptoData = try? await fetchData() {
        cryptoData.date = currentDate
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        let timeline = Timeline(entries: [cryptoData], policy: .after(nextUpdate))
        completion(timeline)
      }
    }
  }
  
  func fetchData() async throws -> Crypto {
    let session = URLSession(configuration: .default)
    let response = try await session.data(from: URL(string: APIURL)!)
    
    let cryptoData = try JSONDecoder().decode([Crypto].self, from: response.0)
    if let crpto = cryptoData.first {
      return crpto
    }
    return .init()
  }
  
  fileprivate let APIURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=7d"
  
  func placeholder(in context: Context) -> Crypto {
    Crypto(date: Date())
  }
  
  func getSnapshot(in context: Context, completion: @escaping (Crypto) -> Void) {
    let entry = Crypto(date: Date())
    completion(entry)
  }
}

struct CryptoWidgetEntryView: View {
  var crypto: Provider.Entry
  
  @Environment(\.widgetFamily) var family
  
  var body: some View {
    if family == .systemMedium {
      MediumSizeWidget()
    } else {
      LockScreenWidget()
    }
  }
  
  @ViewBuilder
  func LockScreenWidget() -> some View {
    VStack {
      
    }
  }
  
  @ViewBuilder
  func MediumSizeWidget() -> some View {
    ZStack {
      Rectangle()
        .fill(Color("WidgetBackground"))
      
      VStack {
        HStack {
          Image("Bitcoin")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
          
          VStack(alignment: .leading) {
            Text("Bitcoin")
              .foregroundColor(.white)
            Text("BTC")
              .foregroundColor(.white)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          
          Text(crypto.currentPrice.toCurrency())
            .fontWeight(.semibold)
            .foregroundColor(.white)
        }
        
        HStack(spacing: 15) {
          VStack(spacing: 8) {
            Text("This week")
              .font(.caption)
              .foregroundColor(.white)
            
            Text(crypto.priceChange.toString(floatingPoint: 1) + "%")
              .fontWeight(.semibold)
              .foregroundColor(crypto.priceChange < 0 ? .red : Color("Green"))
          }
        }
        Chart {
          let graphColor = crypto.priceChange < 0 ? Color.red : Color("Green")
          
          ForEach(crypto.last7Days.price.indices, id: \.self) { index in
            LineMark(x: .value("Hour", index), y: .value("Price", crypto.last7Days.price[index] - min()))
              .foregroundStyle(graphColor)
            
            AreaMark(x: .value("Hour", index), y: .value("Price", crypto.last7Days.price[index] - min()))
              .foregroundStyle(.linearGradient(colors: [
                graphColor.opacity(0.2), graphColor.opacity(0.1), .clear], startPoint: .top, endPoint: .bottom))
          }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
      }
      .padding(.all)
    }
  }
  
  func min() -> Double {
    if let min = crypto.last7Days.price.min() {
      return min
    }
    return 0.0
  }
}

extension Double {
  func toCurrency () -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    return formatter.string(from: .init(value: self)) ?? "$0.00"
  }
  
  func toString(floatingPoint: Int) -> String {
    let string = String(format: "%.\(floatingPoint)f", self)
    return string
  }
}

struct Previews_CryptoAppWidget_Previews: PreviewProvider {
  static var previews: some View {
    CryptoWidgetEntryView(crypto: Crypto(date: Date()))
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
