//
//  MediumScaleView.swift
//  HappyMarketWidgetExtension
//
//  Created by Pratchaya Yordming on 1/8/2564 BE.
//


import SwiftUI
import WidgetKit

struct MediumScaleView: View {
    var model: JSONModel
    @AppStorage("logedIn", store: UserDefaults(suiteName: "group.com.hpnz.HappyMarket")) var isLogedIn: Bool = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack{
                    if isLogedIn {
                        logedInView(geometry: geometry,
                                    model: model)
                    }else {
                        notLoginView(geometry: geometry)
                    }
                    buttonDeeplinkView()
                }
            }
        }
    }
    
    struct notLoginView: View {
        
        var geometry: GeometryProxy
        
        var body: some View {
            
            VStack(alignment: .leading, spacing: 5){
                Spacer()
                Text("เข้าสู่ระบบเพื่อแสดงแต้ม")
                    .font(.custom("DB Adman X",
                                  size: 16,
                                  relativeTo: .title))
                    .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.65)))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width/2,
                           height: 50,
                           alignment: .center)
                
                
                Link(destination: URL(string: "urlsceheme://logIn")!) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                        .frame(width: 85,
                               height: 30,
                               alignment: .center)
                        .overlay(
                            Text("เข้าสู่ระบบ")
                                .font(.custom("DB Adman X",
                                              size: 16,
                                              relativeTo: .caption))
                                .foregroundColor(.black)
                        )
                        .padding(.leading, 25)
                }
                Spacer()
            }
        }
    }
    
    struct logedInView: View {
        var geometry: GeometryProxy
        var model: JSONModel
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0){
                Spacer()
                Spacer()
                Spacer()
                Text("แต้มสะสม")
                    .font(.custom("DB Adman X",
                                  size: 30,
                                  relativeTo: .title))
                    .foregroundColor(.black)
                    .frame(width: (geometry.size.width/2)-20,
                           height: 30,
                           alignment: .leading)
                    .padding(.leading, 20)
                
                Text("\(model.point)")
                    .font(.custom("DB Adman X",
                                  size: 50,
                                  relativeTo: .body))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                    .frame(width: (geometry.size.width/2)-20,
                           height: 40,
                           alignment: .leading)
                    .padding(.leading, 20)
                Spacer()
                
                Link(destination: URL(string: "urlsceheme://member")!) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                        .frame(width: 120,
                               height: 30,
                               alignment: .leading)
                        .overlay(
                            Text("กดดูข้อมูลสมาชิก")
                                .font(.custom("DB Adman X",
                                              size: 16,
                                              relativeTo: .caption))
                                .foregroundColor(.black)
                        )
                        .padding(.leading, 20)
                }
                Spacer()
                Spacer()
            }
        }
    }

    struct buttonDeeplinkView: View {
        var body: some View {
            VStack(alignment: .trailing, spacing: 0){
                
                HStack {
                    Link(destination: URL(string: "urlsceheme://deliveryStatus")!) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                            .frame(width: 50,
                                   height: 50,
                                   alignment: .leading)
                            .overlay(
                                Image("delivery")
                                    .resizable()
                                    .frame(width: 25,
                                           height: 25,
                                           alignment: .leading)
                            )
                        Text("สถานะสินค้า")
                            .font(.custom("DB Adman X",
                                          size: 20,
                                          relativeTo: .body))
                            .foregroundColor(.black)
                            .frame(width: 100,
                                   height: 30,
                                   alignment: .leading)
                            .padding(.init(top: 0,
                                           leading: 10,
                                           bottom: 0,
                                           trailing: 25))
                    }
                }
                
                HStack {
                    Link(destination: URL(string: "urlsceheme://promotions")!) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                            .frame(width: 50,
                                   height: 50,
                                   alignment: .leading)
                            .overlay(
                                Image("promotions")
                                    .resizable()
                                    .frame(width: 25,
                                           height: 25,
                                           alignment: .leading)
                            )
                        
                        Text("โปรโมชั่น")
                            .font(.custom("DB Adman X",
                                          size: 20,
                                          relativeTo: .body))
                            .foregroundColor(.black)
                            .frame(width: 100,
                                   height: 30,
                                   alignment: .leading)
                            .padding(.init(top: 0,
                                           leading: 10,
                                           bottom: 0,
                                           trailing: 25))
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

struct MediumScaleView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = SimpleEntry(date: Date(),
                                widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                image: UIImage(named: "placeholder")!)
        HappyMarketWidgetEntryView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
