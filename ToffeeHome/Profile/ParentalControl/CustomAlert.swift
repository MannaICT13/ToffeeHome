//
//  CustomAlert.swift
//  AleartWithIcon
//
//  Created by Fahad on 5/6/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var showingAlert: Bool
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack{
                Image("ParentalLockConfirm")
                    .resizable()
                    .frame(width: 34, height: 26)
                    .padding(.horizontal,105)
                    .padding(.top,23)
                    .padding(.bottom,17)
                Text("PARENTAL LOCK")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                Text("Your PIN in successfully used to unlock \n                 restricted 18+ content")
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .lineLimit(2)
                    
                Button("OK") {
                    showingAlert.toggle()
                }
                .frame(width: 64, height: 24)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(5)
                .padding(.bottom,18)
                .padding(.top)
                
                
            }
            .frame(width: 254,height: 218)
            .background(Color.red)
            .cornerRadius(15)
            .clipped()
        }
        .ignoresSafeArea(.all)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(showingAlert: .constant(false))
    }
}
