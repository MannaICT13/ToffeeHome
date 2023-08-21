////
////  UserProfileEditCard.swift
////  Subscription
////
////  Created by Fahad on 11/6/23.
////
//
//import SwiftUI
//
//struct UserProfileEditCard: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var birthDate = Date.now
//
//    @State var Fname: String = ""
//    @State var Lname: String = ""
//    //    @State var DOB: String = ""
//    @State var countries = ["Bangladesh", "USA", "UK", "India"]
//    @State var cities = ["Dhaka","New York", "London","Delhi"]
//    @State var areas = ["Dhanmondi","Banani","Gulshan"]
//
//    @State var countrySelection: String = ""
//    @State var selectedCountryFlagImage: String = ""
//    @State var citySelection: String = ""
//    @State var areaSelection: String = ""
//
//
//
//    var body: some View {
//        ZStack{
//            Color("AdaptiveBackgroundColor")
//
//            VStack(alignment: .center) {
//                Image("ProfilePic")
//                    .resizable()
//                    .frame(width: 64,height: 64)
//                    .overlay(
//                        Circle()
//                            .stroke(Color.red, lineWidth: 4)
//
//                    )
//                    .clipShape(Circle())
//                Text("Upload/Change Photo")
//                    .foregroundColor(.red)
//                    .font(.custom("Montserrat-Medium", size: 12))
//
//
//
//                VStack(alignment: .leading){
//
//                    Text("First Name")
//                        .foregroundColor(Color("AdaptiveTextColor"))
//                        .font(.custom("Montserrat-SemiBold", size: 12))
//                    TextField("", text: $Fname)
//                        .padding(.horizontal,20)
//                        .frame(width: 362, height: 32)
//                        .background(Color("AdaptivePlaceholderColor").opacity(0.5))
//                        .textInputAutocapitalization(.never)
//                        .disableAutocorrection(true)
//                        .cornerRadius(10)
//
//
//                    Text("Last Name")
//                        .foregroundColor(Color("AdaptiveTextColor"))
//                        .font(.custom("Montserrat-SemiBold", size: 12))
//                        .padding(.top, 8)
//                    TextField("", text: $Lname)
//                        .padding(.horizontal,20)
//                        .frame(width: 362, height: 32)
//                        .background(Color("AdaptivePlaceholderColor").opacity(0.5))
//                        .textInputAutocapitalization(.never)
//                        .disableAutocorrection(true)
//                        .cornerRadius(10)
//
//
//
//                    HStack(alignment: .firstTextBaseline){
//                        VStack(alignment: .leading) {
//                            Text("Date of Birth")
//                                .font(.custom("Montserrat-SemiBold", size: 12))
//                                .foregroundColor(Color("AdaptiveTextColor"))
//                                .padding(.top, 8)
//                            HStack {
//                                DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
//                                    //                                    Text("Select a date")
//                                }
//                                Image("calender")
//                                    .resizable()
//                                    .renderingMode(.template)
//                                    .frame(width: 19, height: 19)
//
//                            }
//                        }
//                        .frame(width: UIScreen.main.bounds.width/3)
//                        Spacer()
//                        VStack(alignment: .leading) {
//                            Text("Sex:")
//                                .foregroundColor(Color("AdaptiveTextColor"))
//                                .padding(.top, 29)
//
//                            RadioButtonGroups{ selected in
//                                //print("Selected Gender is: \(selected)")
//                            }
//
//                        }
//                    }
//                    .padding(.horizontal,30)
//
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text("Country")
//                            Picker("Country", selection: $countrySelection) {
//                                ForEach(countries, id: \.self) { country in
//                                    Text(country)
//                                }
//                            }
//                            .frame(width: 140, height: 32)
//                            .background(Color.gray)
//                            .cornerRadius(9)
//                        }
//
//                        VStack(alignment: .leading){
//                            Text("City")
//                            Picker("City", selection: $citySelection) {
//                                ForEach(cities, id: \.self) { city in
//                                    Text(city)
//                                }
//                            }
//                            .frame(width: 140, height: 32)
//                            .background(Color.gray)
//                            .cornerRadius(9)
//                        }
//                        VStack(alignment: .leading){
//                            Text("Area")
//                            Picker("Area", selection: $areaSelection) {
//                                ForEach(areas, id: \.self) { area in
//                                    Text(area)
//                                }
//                            }
//                            .frame(width: 140, height: 32)
//                            .background(Color.gray)
//                            .cornerRadius(9)
//                        }
//
//                    }
//                    .padding(.vertical,10)
//
//                }
//
//
//
//                Button {
//                    //
//                } label: {
//                    Text("UPDATE")
//                }
//                .foregroundColor(.white)
//                .font(.custom("Montserrat-SemiBold", size: 14))
//                .frame(width: 82, height: 37)
//                .background(.red)
//                .cornerRadius(7)
//            }
//            .padding(.horizontal,14)
//            .offset(y: -100)
//        }
//        .ignoresSafeArea()
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading:  Text("User Profile Edit")
//            .foregroundColor(Color("AdaptiveTextColor"))
//            .font(.custom("Montserrat-Bold", size: 16))
//        )
//        .navigationBarItems(leading:
//                                Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//                Image(systemName: "arrow.backward")
//                    .foregroundColor(Color("AdaptiveTextColor"))
//
//            }
//        })
//
//    }
//}
//
//struct UserProfileEditCard_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileEditCard()
//    }
//}
//
//
//struct RadioButton: View{
//
//    let id: String
//    let label: String
//    let size: CGFloat
//    let color: Color
//    let textSize: CGFloat
//    let isMarked: Bool
//    let callback: (String) -> ()
//
//    init(
//        id: String,
//        label: String,
//        size: CGFloat = 20,
//        color: Color = Color.black,
//        textSize: CGFloat = 14,
//        isMarked: Bool = false,
//        callback: @escaping (String) -> Void
//    )
//    {
//        self.id = id
//        self.label = label
//        self.size = size
//        self.color = color
//        self.textSize = textSize
//        self.isMarked = isMarked
//        self.callback = callback
//    }
//    var body: some View{
//        Button (action:{
//            self.callback(self.id)
//        }) {
//            HStack (){
//                Image(systemName: self.isMarked ? "circle.inset.filled" : "circle")
//                    .renderingMode(.original)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 16, height: 16)
//                    .foregroundColor(.red)
//
//                Text(label)
//                    .font(Font.system(size: textSize))
//            }
//            .foregroundColor(Color("AdaptiveTextColor"))
//            .multilineTextAlignment(.leading)
//        }
//
//    }
//}
//
//
//enum Gender: String {
//    case male = "Male"
//    case female = "Female"
//    case other  = "Other"
//
//}
//
//struct RadioButtonGroups: View {
//    let callback: (String) -> ()
//
//    @State var selectedId: String = ""
//
//    var body: some View {
//        HStack {
//            radioMaleMajority
//            radioFemaleMajority
//            radioOtherMajority
//        }
//    }
//
//    var radioMaleMajority: some View {
//        RadioButton(
//            id: Gender.male.rawValue,
//            label: Gender.male.rawValue,
//            isMarked: selectedId == Gender.male.rawValue ? true : false,
//            callback: radioGroupCallback
//        )
//    }
//
//    var radioFemaleMajority: some View {
//        RadioButton(
//            id: Gender.female.rawValue,
//            label: Gender.female.rawValue,
//            isMarked: selectedId == Gender.female.rawValue ? true : false,
//            callback: radioGroupCallback
//        )
//    }
//    var radioOtherMajority: some View {
//        RadioButton(
//            id: Gender.other.rawValue,
//            label: Gender.other.rawValue,
//            isMarked: selectedId == Gender.other.rawValue ? true : false,
//            callback: radioGroupCallback
//        )
//    }
//
//    func radioGroupCallback(id: String) {
//        selectedId = id
//        callback(id)
//    }
//}
//
