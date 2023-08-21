//
//  ProfileEdit.swift
//  Binge
//
//  Created by Fahad on 30/7/23.
//

import SwiftUI
import PhotosUI

struct ProfileEdit: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedImage : UIImage
    
    @State private var openPhotos : Bool = false
    @State private var openCamera : Bool = false
    @State private var ShowImageOption: Bool = false
    
    @State private var birthDate = Date.now
    
    @Binding var Fname: String
    @Binding var Lname: String
    @State var  isClickedMale: Bool = true
    @State var isClickedFemale: Bool = false
    @State var isClickedOthers: Bool = false
    
    @State var selectedCountry: String = ""
    @State var selectedCity: String = ""
    @State var selectedArea: String = ""
    @State var isSelected : Bool = false
    
    
    
    @State var countrySelection: String = ""
    @State var selectedCountryFlagImage: String = ""
    @State var citySelection: String = ""
    @State var areaSelection: String = ""
    
    
    var isFormValid: Bool {
        !Fname.isEmpty && !Lname.isEmpty && Fname.count > 3 && Lname.count > 2
    }
    
    var body: some View {
        
        ZStack{
            Color("AdaptiveBackgroundColor")
            
            VStack(alignment: .center) {
                
                ZStack {
                    Circle()
                        .stroke(.red ,lineWidth: 3)
                        .frame(width: 85, height: 85)
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                        .onTapGesture{
                            ShowImageOption = true
                        }
                        .confirmationDialog("Change background", isPresented: $ShowImageOption) {
                            Button("Open Camera") {
                                openCamera = true
                            }
                            Button("Open Photos") {
                                openPhotos = true
                                print("Open Gallery")
                            }
                        } message: {
                            Text("Choose Your option")
                        }
                }
                .overlay(
                    content: {
                        HStack{
                            Spacer()
                            VStack {
                                Spacer()
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 11.5, height: 10)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.trailing, 5)
                    }
                )
                .sheet(isPresented: $openPhotos) {
                    ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
                }
                .sheet(isPresented: $openCamera) {
//                                print("Open Cameras")
                    ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
                }
                Text("Upload / Change Photo")
                    .foregroundColor(.red)
                    .font(.custom("Montserrat-Medium", size: 12))
                
                
                VStack(alignment: .leading){
                    
                    Text("First Name")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-SemiBold", size: 12))
                    TextField("Enter your first name", text: $Fname)
                        .padding(.horizontal,20)
                        .frame(width: 362, height: 32)
                        .background(Color("AdaptivePlaceholderColor").opacity(0.5))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .cornerRadius(10)
                    
                    
                    Text("Last Name")
                        .foregroundColor(Color("AdaptiveTextColor"))
                        .font(.custom("Montserrat-SemiBold", size: 12))
                        .padding(.top, 8)
                    TextField("Enter your last name", text: $Lname)
                        .padding(.horizontal,20)
                        .frame(width: 362, height: 32)
                        .background(Color("AdaptivePlaceholderColor").opacity(0.5))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .cornerRadius(10)
                    
                    
                    
                    HStack(alignment: .firstTextBaseline){
                        VStack(alignment: .leading) {
                            Text("Date of Birth")
                                .font(.custom("Montserrat-SemiBold", size: 12))
                                .foregroundColor(Color("AdaptiveTextColor"))
                                .padding(.top, 8)
                            HStack {
                                DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                                }
                                Image("calender")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 19, height: 19)
                                
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width/3)
                        Spacer()
                        VStack(alignment: .leading,spacing: 20) {
                            Text("Sex:")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(Color("AdaptiveTextColor"))
                                .padding(.top, 29)
                            HStack{
                                GenderRadioButton(isClicked: isClickedMale)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isClickedMale = true
                                            isClickedFemale = false
                                            isClickedOthers = false
                                        }
                                    }
                                Text("Male")
                                    .font(.system(size: 12))
                                GenderRadioButton(isClicked: isClickedFemale)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isClickedMale = false
                                            isClickedFemale = true
                                            isClickedOthers = false
                                        }
                                    }
                                Text("Female")
                                    .font(.system(size: 12))
                                GenderRadioButton(isClicked: isClickedOthers)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isClickedMale = false
                                            isClickedFemale = false
                                            isClickedOthers = true
                                        }
                                    }
                                Text("Other")
                                    .font(.system(size: 12))
                            }
                            .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal,10)
                    
                    // MARK: - Location
                    HStack {
                        //Country
                        VStack(alignment: .leading){
                            Text("Country")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(Color("AdaptiveTextColor"))
                            
                            Menu{
                                ForEach(countryNames(), id: \.self){ country in
                                    Button{
                                        selectedCountry =  country
                                        selectedCity = ""
                                        selectedArea = ""
                                    }label: {
                                        Text(country)
                                    }
                                }
                            } label: {
                                HStack{
                                    Image("ArrowDownThick")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(Color("AdaptiveTextColor"))
                                        .frame(width: 8, height: 3)
                                    if selectedCountry.isEmpty {
                                        Text("Country")
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                            .minimumScaleFactor(0.5)
                                    } else {
                                        
                                        HStack{
                                            Image(returnFlagByCountryName(countryName: selectedCountry))
                                                .resizable()
                                                .frame(width: 18,height: 11)
                                            Text(selectedCountry)
                                                .foregroundColor(Color("AdaptiveTextColor"))
                                                .background(Color.gray)
                                                .minimumScaleFactor(0.5)
                                                .cornerRadius(9)
                                        }
                                    }
                                }
                                .padding(.vertical,10)
                                .frame(width: 140, height: 32)
                                .background(Color.gray)
                                .minimumScaleFactor(0.5)
                                .cornerRadius(9)
                            }
                        }
                        // CITY
                        VStack(alignment: .leading){
                            Text("City")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(Color("AdaptiveTextColor"))
                            Menu{
                                ForEach(returnCity(countryName: selectedCountry), id: \.self){ city in
                                    Button{
                                        
                                        selectedCity = city
                                    }label: {
                                        Text(city)
                                    }
                                }
                            }label: {
                                if selectedCity.isEmpty{
                                    HStack {
                                        Image("ArrowDownThick")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                            .frame(width: 8, height: 3)
                                        Text("City")
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                        
                                    }
                                    .frame(width: 103, height: 32)
                                    .background(Color.gray)
                                    .minimumScaleFactor(0.5)
                                    .cornerRadius(9)
                                } else {
                                    HStack {
                                        Image("ArrowDownThick")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                            .frame(width: 8, height: 3)
                                        Text(selectedCity)
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                        
                                    }
                                    .frame(width: 103, height: 32)
                                    .background(Color.gray)
                                    .minimumScaleFactor(0.5)
                                    .cornerRadius(9)
                                }
                            }
                        }
                        // AREA
                        VStack(alignment: .leading){
                            Text("Area")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(Color("AdaptiveTextColor"))
                            
                            Menu{
                                ForEach(returnArea(city: selectedCity), id: \.self){ area in
                                    Button{
                                        selectedArea = area
                                        print(selectedArea)
                                    }label: {
                                        Text(area)
                                    }
                                }
                            } label: {
                                if selectedArea.isEmpty{
                                    HStack {
                                        Image("ArrowDownThick")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                            .frame(width: 8, height: 3)
                                        Text("Area")
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                        
                                    }
                                    .frame(width: 103, height: 32)
                                    .background(Color.gray)
                                    .minimumScaleFactor(0.5)
                                    .cornerRadius(9)
                                } else
                                {
                                    HStack {
                                        Image("ArrowDownThick")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(Color("AdaptiveTextColor"))
                                            .frame(width: 8, height: 3)
                                        Text(selectedArea)
                                    }
                                    .foregroundColor(Color("AdaptiveTextColor"))
                                    .frame(width: 103, height: 32)
                                    .background(Color.gray)
                                    .minimumScaleFactor(0.5)
                                    .cornerRadius(9)
                                }
                            }
                        }
                        
                    }
                }
                
                
                Spacer(minLength: 30)
                Button {
                    print("First Name:\(Fname)")
                    print("Last Name:\(Lname)")
                    print("Date of Birth:\(birthDate)")
                    print("Country:\(selectedCountry)")
                    print("City:\(selectedCity)")
                    print("Area:\(selectedArea)")
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("UPDATE")
                }
                .foregroundColor(.white)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .frame(width: 262, height: 48)
                .background(isFormValid ? Color.red : Color.gray)
                .cornerRadius(10)
                .disabled(!isFormValid)
                Spacer(minLength: 20)
            }
            .padding(.horizontal,10)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:  Text("User Profile Edit")
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

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit(selectedImage: .constant(UIImage()),Fname: .constant(""), Lname: .constant(""))
    }
}


struct GenderRadioButton: View{
    var isClicked: Bool
    var body: some View{
        ZStack{
            Circle()
                .stroke(.red ,lineWidth: 2)
                .frame(width: 20, height: 20)
            if isClicked {
                Circle()
                    .fill(Color.red)
                    .frame(width: 15, height: 15)
            }
            
        }
    }
}


