//
//  Test.swift
//  Binge
//
//  Created by Fahad on 23/7/23.
//

import SwiftUI

struct Test: View {
    
    var body: some View {
        VStack{
            Text("hdsfs")
        }
    }
    
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
    // MARK: - Custom Text Field View
    struct bigTextFieldViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(height: 20)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal, 10)
        }
    }
    
    extension View {
        func bigTextField() -> some View {
            modifier(bigTextFieldViewModifier())
        }
    }
    //Text Field Modifier for Gray Background
    struct textFieldViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.horizontal,20)
                .frame(width: 184, height: 32)
                .background(Color("AdaptivePlaceholderColor").opacity(0.5))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .cornerRadius(39)
        }
    }
    extension View {
        func TextFieldView() -> some View {
            modifier(textFieldViewModifier())
        }
    }




    


func countryNames() -> [String] {
    let country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    return country_list
}

func returnFlagByCountryName(countryName: String) -> String {
    let countryWithFlag = ["Bangladesh": "BangladeshFlag",
                           "Australia" : "AustraliaFlag",
                           "India": "IndiaFlag"]
    
    if let x  = countryWithFlag[countryName] {
        return x
    }
    return " "
}

func returnCity(countryName: String) -> [String] {
    let cityName = ["Bangladesh" : ["Dhaka","Chittagong", "Cumilla","Barishal"],
                    "India" : ["Delhi","Mumbai","Kolkata"]]
    
    if let y = cityName[countryName] {
        return y
    }
    
    return [" "]
}
func returnArea(city: String) -> [String] {
    print(city)
    let areaName = ["Dhaka" : ["Banani","Gulshan", "Dhanmondi","Mirpur"],
                    "Cumilla" : ["Chortha","Kandirpar","Bagichagaion"]]
    
    if let y = areaName[city] {
        return y
    }
    
    return [" "]
}

func returnCodeByCountryName(countryName: String) -> String {
    let countryWithFlag = ["Bangladesh": "+880",
                           "Australia" : "+002",
                           "India": "+900"]
    
    if let x  = countryWithFlag[countryName] {
        return x
    }
    return " "
}
