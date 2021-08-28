//
//  SmallScaleView.swift
//  HappyMarketWidgetExtension
//
//  Created by Pratchaya Yordming on 1/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct SmallScaleView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("เช็คสถานะสินค้าได้ง่ายๆ")
                    .font(.custom("DB Adman X",
                                  size: 22,
                                  relativeTo: .title))
                    .foregroundColor(.black)
                    .padding(.init(top: 20,
                                   leading: 20,
                                   bottom: 5,
                                   trailing: 0))
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                    .frame(width: 60,
                           height: 60,
                           alignment: .leading)
                    .overlay(
                        Image("delivery")
                            .resizable()
                            .widgetURL(URL(string: "urlsceheme://deliveryStatus"))
                            .frame(width: 30,
                                   height: 30,
                                   alignment: .leading)
                    )
                    .padding(.leading, 20.0)
            }
        }
    }
}

struct SmallScaleView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = SimpleEntry(date: Date(),
                                widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                image: UIImage(named: "placeholder")!)
        HappyMarketWidgetEntryView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
