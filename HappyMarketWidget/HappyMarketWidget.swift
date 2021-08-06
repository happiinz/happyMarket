//
//  HappyMarketWidget.swift
//  HappyMarketWidget
//
//  Created by Pratchaya Yordming on 30/7/2564 BE.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("logedIn", store: UserDefaults(suiteName: "group.com.hpnz.HappyMarket")) var isLogedIn: Bool = false
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),
                    widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                    image: UIImage(named: "placeholder")!)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),
                                widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                image: UIImage(named: "placeholder")!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let date = Date()
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: date)
        
        if isLogedIn {
            NetworkManager.shared.getData { models in
                if models.promotion.image != "" {
                    ImageLoader.shared.downloadWebImage(imageUrl: models.promotion.image) { image in
                        let data = SimpleEntry(date: date, widgetData: models, image: image)
                        
                        let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
                        completion(timeline)
                    }
                }else {
                    let entry = SimpleEntry(date: date,
                                            widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                            image: UIImage(named: "placeholder")!)
                    let timeline = Timeline(entries: [entry], policy: .after(nextUpdate!))
                    completion(timeline)
                }
            }
        }else {
            let entry = SimpleEntry(date: date,
                                    widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                    image: UIImage(named: "placeholder")!)
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate!))
            completion(timeline)
        }
    }
}

@main
struct HappyMarketWidget: Widget {
    let kind: String = "HappyMarketWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HappyMarketWidgetEntryView(entry: entry)
                .background(Color("WidgetBackground"))
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
