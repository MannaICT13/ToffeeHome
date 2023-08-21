//
//  UsagesHistory.swift
//  Binge
//
//  Created by Fahad on 3/8/23.
//

import SwiftUI

struct UsagesHistory: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var usagesHistoryRecords: Int = 2
    
   
    var body: some View {
        ZStack{
            Color("AdaptiveBackgroundColor")
            VStack(alignment: .leading,spacing: 10){
                Text("Total Content Watch Time")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                Text("200 Hour")
                    .font(.custom("Montserrat-SemiBold", size: 29))
                    .padding(.bottom,20)
                HStack(alignment: .center){
                    VStack(alignment: .leading) {
                        Text("Total Data Usages")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 16))
                        Text("70 GB")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 29))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Downlaod")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 16))
                        Text("50 GB")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-SemiBold", size: 29))
                    }
                }
                HStack(alignment: .center){
                    Button(action: {
                            usagesHistoryRecords = 1
                     
                    }, label: {
                        Text("Daily")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(usagesHistoryRecords == 1 ? Color.white : Color("AdaptiveTextColor"))
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(usagesHistoryRecords == 1 ? Color.red : Color.clear)
                            .cornerRadius(22)
                        
                        
                    })
                    Button(action: {
                            usagesHistoryRecords = 2
                    }, label: {
                        Text("Weekly")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(usagesHistoryRecords == 2 ? Color.white : Color("AdaptiveTextColor"))
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(usagesHistoryRecords == 2 ? Color.red : Color.clear)
                            .cornerRadius(22)
                        
                    })
                    Button(action: {
                            usagesHistoryRecords = 3
                        
                    }, label: {
                        Text("Monthly")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(usagesHistoryRecords == 3 ? Color.white : Color("AdaptiveTextColor"))
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(usagesHistoryRecords == 3 ? Color.red : Color.clear)
                            .cornerRadius(22)
                        
                    })
                }
                .padding(3)
                
                .background(
                    RoundedRectangle(cornerRadius: 27)
                        .stroke(Color("AdaptiveTextColor"), lineWidth: 1)
                )
                .padding(.leading,50)
                .padding(.vertical,25)
                Text("Analysis")
                    .foregroundColor(Color("AdaptiveTextColor"))
                    .font(.custom("Montserrat-SemiBold", size: 24))
                    .padding(.bottom,15)
                
                if usagesHistoryRecords == 1 {
                    UserDataChartDaily()
                }
                if usagesHistoryRecords == 2 {
                    UserDataChartWeekly()
                }
                if usagesHistoryRecords == 3 {
                    UserDataChartMonthly()
                }
                Spacer()
            }
            .padding(.horizontal,15)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("Usage History")
            .foregroundColor(Color("AdaptiveTextColor"))
            .font(.custom("Montserrat-Bold", size: 16))
        )
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("AdaptiveTextColor"))
                
            }
        })
    }
}

struct UsagesHistory_Previews: PreviewProvider {
    static var previews: some View {
        UsagesHistory()
    }
}
