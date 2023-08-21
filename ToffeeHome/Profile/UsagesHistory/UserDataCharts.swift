//
//  UserDataCharts.swift
//  Binge
//
//  Created by Fahad on 8/8/23.
//

import SwiftUI



// MARK: - Daily Charts
struct UserDataChartDaily: View {
    struct ViewDaily: Identifiable {
        let id = UUID()
        let watchTime: Int
        let dataUsage: Double
        let days: String
    }
    let viewDailys: [ViewDaily] = [
        .init(watchTime: 7, dataUsage: 4.5, days: "Tue"),
        
    ]
    var body: some View{
        HStack(alignment: .bottom) {
            ForEach(viewDailys) { viewDaily in
                VStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 45, height: CGFloat(viewDaily.watchTime) * 25)
                        .overlay {
                            VStack{
                                Spacer()
                                Text("\(viewDaily.watchTime) Hours")
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                
                                Text("\(viewDaily.dataUsage,specifier: "%0.1f") GB")
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                
                            }
                            .minimumScaleFactor(0.1)
                            .padding(.vertical,20)
                        }
                    Text(viewDaily.days)
                    
                }
            }
        }
        .frame(height:240, alignment: .bottom)
        //  .padding(20)
        
    }
}


// MARK: - Weekly Chart
struct UserDataChartWeekly: View {
    struct ViewWeek: Identifiable {
        let id = UUID()
        let watchTime: Int
        let dataUsage: Double
        let days: String
    }
    let viewWeek: [ViewWeek] = [
        .init(watchTime: 7, dataUsage: 4.5, days: "Tue"),
        .init(watchTime: 6, dataUsage: 5.5, days: "Wed"),
        .init(watchTime: 5, dataUsage: 7.5, days: "Thu"),
        .init(watchTime: 8, dataUsage: 2.5, days: "Fri"),
        .init(watchTime: 4, dataUsage: 8.5, days: "Sat"),
        .init(watchTime: 9, dataUsage: 2.5, days: "Sun"),
        .init(watchTime: 7, dataUsage: 5.5, days: "Mon"),
    ]
    var body: some View{
        HStack(alignment: .bottom) {
            ForEach(viewWeek) { viewWeek in
                VStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 45, height: CGFloat(viewWeek.watchTime) * 25)
                        .overlay {
                            VStack{
                                Spacer()
                                Text("\(viewWeek.watchTime) Hours")
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                
                                Text("\(viewWeek.dataUsage,specifier: "%0.1f") GB")
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                
                            }
                            .minimumScaleFactor(0.1)
                            .padding(.vertical,20)
                        }
                    Text(viewWeek.days)
                    
                }
            }
        }
        .frame(height:240, alignment: .bottom)
        //  .padding(20)
        
    }
}

//MARK: - Monthly Data

struct UserDataChartMonthly: View {
    struct ViewMonthly: Identifiable {
        let id = UUID()
        let watchTime: Int
        let dataUsage: Double
        let days: String
    }
    let viewMonthly: [ViewMonthly] = [
        .init(watchTime: 7, dataUsage: 4.5, days: "Jan"),
        .init(watchTime: 6, dataUsage: 5.5, days: "Feb"),
        .init(watchTime: 5, dataUsage: 7.5, days: "Mar"),
        .init(watchTime: 8, dataUsage: 2.5, days: "Apr"),
        .init(watchTime: 4, dataUsage: 8.5, days: "May"),
        .init(watchTime: 9, dataUsage: 2.5, days: "Jun"),
        .init(watchTime: 7, dataUsage: 5.5, days: "Jul"),
        .init(watchTime: 7, dataUsage: 4.5, days: "Aug"),
        .init(watchTime: 6, dataUsage: 5.5, days: "Sep"),
        .init(watchTime: 5, dataUsage: 7.5, days: "Oct"),
        .init(watchTime: 8, dataUsage: 2.5, days: "Nov"),
        .init(watchTime: 4, dataUsage: 8.5, days: "Dec"),
    ]
    var body: some View{
        HStack(alignment: .bottom) {
            ForEach(viewMonthly) { viewMonthly in
                VStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 20, height: CGFloat(viewMonthly.watchTime) * 25)
                        .overlay {
                            VStack{
                                Text("\(viewMonthly.watchTime) Hours")
                                    .foregroundColor(.white)
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .lineLimit(1)
                                    .rotationEffect(.degrees(-90))
                                Spacer()
                                Text("\(viewMonthly.dataUsage,specifier: "%0.1f") GB")
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                    .font(.custom("Montserrat-Medium", size: 8))
                                    .rotationEffect(.degrees(-90))
                            }
                            .minimumScaleFactor(0.3)
                            .padding(.vertical,20)
                            
                        }
                    Text(viewMonthly.days)
                        .font(.custom("Montserrat-Medium", size: 8))
                        .minimumScaleFactor(0.5)
                    
                }
            }
        }
        .frame(height:240, alignment: .bottom)
        
    }
}



