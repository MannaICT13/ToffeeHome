//
//  MyWatchListTwo.swift
//  Subscription
//
//  Created by Fahad on 15/6/23.
//

import SwiftUI

struct MyWatchList: View {
    @Environment(\.presentationMode) var presentationMode
    @State var speed: Int
    var watchlistDatas: [WatchListItem] = WatchListCell.WLCellData
    var body: some View {
        
        ZStack {
//            Color.black
            Color("AdaptiveBackgroundColor2")
           
            VStack {
//                Rectangle()
//                    .fill(Color("AdaptiveBackgroundColor2"))
//                    .frame(width: 100, height: 100)
                List(watchlistDatas, id: \.id){ watchlistData in
                    
                    HStack(spacing: 10){
                        Image(watchlistData.imageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 106,height: 106)
                            .padding(.leading,10)
                        VStack(alignment: .leading){
                            Text(watchlistData.MovieName)
                                .foregroundColor(Color("AdaptiveTextColor"))
                            
                            ProgressView(value: watchlistData.progressvalue) {
                                
                            }
                            
                            Text(watchlistData.duration)
                                .foregroundColor(Color("AdaptiveTextColor"))
                            
                            
                        }
                        
                        Image("PlayButton")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing,10)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    )
                    //.padding(.horizontal,10)
                    
                    .listRowBackground(Color("AdaptiveBackgroundColor2"))
                    
                }
                .listStyle(.plain)
            }
        }
//        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("My watchlist")
            .foregroundColor(Color("AdaptiveTextColor")))
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("AdaptiveTextColor"))
            }
        })
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    //
                } label: {
                    Image("Search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 21)
                }
            }
        }
    }
}

struct MyWatchListTwo_Previews: PreviewProvider {
    static var previews: some View {
        MyWatchList(speed: Int(0.5))
    }
}
