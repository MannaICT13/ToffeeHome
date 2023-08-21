//
//  ContentView.swift
//  Binge
//
//  Created by Fahad on 23/7/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("isDarkMode") private var isDark = true
    @State var Fname:String = "Md Omar Faruque"
    @State var Lname: String = "Fahad"
    @State var image: UIImage = (UIImage(named: "ProfilePic") ?? UIImage())
    @State var isNavigateHome: Bool =  false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                Color("AdaptiveBackgroundColor")
                ScrollView{
                VStack{
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(Color("AdaptiveTextColor"))
                        }
                        Image("Binge")
                        Spacer()
                        HStack(spacing: 15) {
                            Image("VideoStreaming")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 21, height: 21)
                                .foregroundColor(Color("AdaptiveTextColor"))
                            Image("Search")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 21, height: 21)
                                .foregroundColor(Color("AdaptiveTextColor"))
                            Image("RedHead")
                                .resizable()
                                .frame(width: 21, height: 21)
                                .foregroundStyle(.white)
                            
                        }
                    }
                    .padding(.horizontal)
                    VStack{
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100,height: 100)
                            .overlay(
                                Circle()
                                    .stroke(Color.red, lineWidth: 4)
                            )
                        
                            .clipShape(Circle())
                        Text("\(Fname) \(Lname)")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-Bold", size: 14))
                            .fontWeight(.bold)
                        Text("01610182028")
                            .foregroundColor(Color("AdaptiveTextColor"))
                            .font(.custom("Montserrat-Bold", size: 14))
                            .fontWeight(.bold)
                        Button {
                            print("Button Tapped")
                            
                        } label: {
                            NavigationLink( destination: ProfileEdit(selectedImage: $image,Fname: $Fname, Lname: $Lname)){
                                Text("Edit Profile")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .frame(width: 118,height: 30)
                                    .background(.red)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    //MARK: - This is Profile Page's Items Section
                    ProfileItems()
                    
                    
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image("LogOut")
                    }
                    Button {
                        //
                    } label: {
                        Text("Delete Account")
                            .foregroundColor(Color.red)
                            .font(.custom("Montserrat-Bold", size: 14))
                            .fontWeight(.bold)
                        
                    }
                    Text("App Version 4.9.2")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.system(size: 10))
                    
                    Spacer(minLength: 30)
                }
            }
                
            }
            .padding(.top,42)
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: - Profile Items

struct ProfileItem: View{
    var name: String
    var iconImage: String
    var trailingImage: String
    
    var body: some View {
        HStack(spacing: 20){
            
            Image(iconImage)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("AdaptiveTextColor"))
            
            Text(name)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color("AdaptiveTextColor"))
                .font(.custom("Montserrat-SemiBold", size: 16))
            //                .fontWeight(.bold)
                .font(.system(size: 28))
                .lineLimit(1)
                
            Spacer()
            Image(trailingImage)
                .resizable()
                .frame(width: 24,height: 24)
                .foregroundColor(Color("AdaptiveTextColor"))
            
        }
        .padding(.horizontal,30)
        .padding(.vertical,7)
    }
}




struct ProfileItems: View {
    @State var collapsedInfo: Bool = false
    @AppStorage ("isDarkMode") private var isDark = true
    var body: some View {
        VStack {
            NavigationLink( destination: SubscriptionUI()){
                ProfileItem(name: "Subscription", iconImage: "Subscription", trailingImage: "arrow")
                
            }
            NavigationLink( destination: UsagesHistory()){
                ProfileItem(name: "Usages History", iconImage: "UsageHistory", trailingImage: "arrow")
            }
            NavigationLink( destination: MyWatchList(speed: Int(1.5))){
                ProfileItem(name: "My watchlist", iconImage: "MyWatchList", trailingImage: "arrow")
            }
        }
        
        
        NavigationLink( destination: ParentalControl()){
            ProfileItem(name: "Parental Control", iconImage: "ParentalControl", trailingImage: "arrow")
        }
        NavigationLink( destination: ReeferAFriend()){
            ProfileItem(name: "Refer a point and get point", iconImage: "Refer a friend & get point", trailingImage: "arrow")
        }
        NavigationLink( destination: RedeemReferalCode()){
            ProfileItem(name: "Redeem Referral Code", iconImage: "ReferalCode", trailingImage: "arrow")
        }
        NavigationLink( destination: AppSetting()){
            ProfileItem(name: "App Setting", iconImage: "Settings", trailingImage: "arrow")
        }
        
        
        Button {
            collapsedInfo.toggle()
        } label: {
            ProfileItem(name: "Information", iconImage: "Information", trailingImage: "arrow")
        }
        if collapsedInfo{
            InfoItems()
        }
        NavigationLink( destination: Feedback()){
            ProfileItem(name: "Feedback", iconImage: "Feedback", trailingImage: "arrow")
        }
        
        
        NavigationLink( destination: HelpAndSupport()){
            ProfileItem(name: "Help & Support", iconImage: "Help&Support", trailingImage: "arrow")
        }
        HStack {
            Image("DarkMode")
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("AdaptiveTextColor"))
                .padding(.leading,30)
            Toggle("Dark Mode", isOn: $isDark)
                .padding(.horizontal,15)
        }
        
        
    }
}

//MARK: - Information Seected Tab
struct InfoItem: View{
    @State var InfoItemName: String
    @State var InfoItemIcon: String
    var body: some View{
        HStack{
            Text(InfoItemName)
                .foregroundColor(Color("AdaptiveTextColor").opacity(0.5))
                .font(.custom("Montserrat-SemiBold", size: 16))
            //                .fontWeight(.bold)
                .font(.system(size: 28))
            Spacer()
            Image(InfoItemIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .foregroundColor(Color.white)
        }
    }
}
struct InfoItems: View{
    
    var body: some View{
        VStack{
            NavigationLink( destination: Terms_Condition()){
                InfoItem(InfoItemName: "T&C", InfoItemIcon: "arrow")
            }
            NavigationLink( destination: FrequentlyAskQuestions()){
                InfoItem(InfoItemName: "FAQ", InfoItemIcon: "arrow")
            }
            NavigationLink( destination: PrivacyNotice()){
                InfoItem(InfoItemName: "Privacy Notice", InfoItemIcon: "arrow")
            }
        }
        .padding(.leading,72)
        .padding(.trailing, 31)
    }
}
