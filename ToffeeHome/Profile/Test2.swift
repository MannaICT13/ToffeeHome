//
//  Test2.swift
//  Binge
//
//  Created by Fahad on 9/8/23.
//

import SwiftUI

struct Test2: View {
    var packItem: PackItem
    let colums: [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: .center)
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: colums,
                spacing: 5, pinnedViews: [],
                content: {
                    ForEach(0..<packItem.id.count,id: \.self){index in
                        Text(packItem.PackDuration)
                    }
            })
//            PackDetails()
            Text("kakakskas")
        }
    }
}

struct Test2_Previews: PreviewProvider {
    static  var packItem = PackItem(PackDuration: "", PackPrice: 0, PackPriceWithoutVAT: 0, PackValidity: 0)
    static var previews: some View {
        Test2(packItem: packItem)
    }
}

