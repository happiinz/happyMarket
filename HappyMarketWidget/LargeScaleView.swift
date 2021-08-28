//
//  LargeScaleView.swift
//  HappyMarketWidgetExtension
//
//  Created by Pratchaya Yordming on 1/8/2564 BE.
//


import SwiftUI
import WidgetKit

struct LargeScaleView: View {
    var model: JSONModel
    var image: UIImage
    @AppStorage("logedIn", store: UserDefaults(suiteName: "group.com.hpnz.HappyMarket")) var isLogedIn: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isLogedIn {
                    fistRow(geometry: geometry, model: model)
                    secoundRow(geometry: geometry, image: image)
                }else {
                    notLoginView(geometry: geometry)
                }
                thirdRow(geometry: geometry)
            
            }.frame(width: geometry.size.width,
                    height: geometry.size.height,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
    
    struct notLoginView: View {
        
        var geometry: GeometryProxy
        
        var body: some View {
            
            VStack(alignment: .center, spacing: 5){
                Text("เข้าสู่ระบบเพื่อแสดงแต้ม")
                    .font(.custom("DB Adman X",
                                  size: 18,
                                  relativeTo: .title))
                    .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.65)))
                    .frame(width: geometry.size.width,
                           height: 30,
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
                        .padding(.bottom, 10)
                }
            }.frame(width: geometry.size.width, height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }

    struct fistRow: View {
        var geometry: GeometryProxy
        var model: JSONModel
        
        var body: some View {
            HStack{
                VStack(alignment: .leading, spacing: 0){
                    Text("แต้มสะสม")
                        .font(.custom("DB Adman X",
                                      size: 30,
                                      relativeTo: .title))
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width/2,
                               height: 30,
                               alignment: .leading)
                        .padding(.top, 20)
                    
                    Text("\(model.point)")
                        .font(.custom("DB Adman X",
                                      size: 50,
                                      relativeTo: .body))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                        .frame(width: geometry.size.width/2,
                               height: 40,
                               alignment: .leading)
                }
                
                VStack(alignment: .trailing){
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
                            .padding(.top, 20)
                    }
                }
            }
        }
    }

    struct secoundRow: View {
        var geometry: GeometryProxy
        var image: UIImage
        
        var body: some View {
            VStack(alignment: .center, spacing: 5){
                Text("โปรโมชั่นและสิทธิพิเศษ")
                    .font(.custom("DB Adman X",
                                  size: 20,
                                  relativeTo: .title))
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width,
                           height: 30,
                           alignment: .leading)
                    .padding(.init(top: 10,
                                   leading: 35,
                                   bottom: 0,
                                   trailing: 0))
                
                Link(destination: URL(string: "urlsceheme://productDetail")!) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: geometry.size.width-40,
                           height: 110,
                           alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                }
                
            }
        }
    }

    struct thirdRow: View {
        var geometry: GeometryProxy
        
        var body: some View {
            HStack(spacing: 25){
                buttonLayout(imageName: "delivery",
                             buttonName: "สถานะสินค้า",
                             nav: "deliveryStatus")
                buttonLayout(imageName: "promotions",
                             buttonName: "โปรโมชั่น",
                             nav: "promotions")
                buttonLayout(imageName: "notification",
                             buttonName: "แจ้งเดือน",
                             nav: "notifications")
            }.frame(width: geometry.size.width,
                    height: 100,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }

    struct buttonLayout: View {
        var imageName: String
        var buttonName: String
        var nav: String
        
        var body: some View {
            VStack (alignment: .center, spacing: 0){
                
                Link(destination: URL(string: "urlsceheme://\(nav)")!) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                        .frame(width: 50,
                               height: 50,
                               alignment: .leading)
                        .overlay(
                            Image(imageName)
                                .resizable()
                                .frame(width: 25,
                                       height: 25,
                                       alignment: .leading)
                        )
                    
                    Text(buttonName)
                        .font(.custom("DB Adman X",
                                      size: 14,
                                      relativeTo: .body))
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.65)))
                        .frame(width: 60,
                               height: 30,
                               alignment: .center)
                }
            }
        }
    }
}

struct LargeScaleView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = SimpleEntry(date: Date(),
                                widgetData: JSONModel(point: 0, promotion: JSONModel.Promotion(image: "")),
                                image: UIImage(named: "placeholder")!)
        HappyMarketWidgetEntryView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
