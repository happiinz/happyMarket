//
//  WidgetEntryView.swift
//  HappyMarketWidgetExtension
//
//  Created by Pratchaya Yordming on 1/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct HappyMarketWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        
        switch family {
        case .systemSmall:
            SmallScaleView()
        case .systemMedium:
            MediumScaleView(model: entry.widgetData)
        case .systemLarge:
            LargeScaleView(model: entry.widgetData, image: entry.image)
        @unknown default:
            fatalError()
        }
    }
}
