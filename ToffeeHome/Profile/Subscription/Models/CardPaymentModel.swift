//
//  CardPaymentModel.swift
//  Binge
//
//  Created by Fahad on 14/8/23.
//

import SwiftUI

struct CardPaymentModel: View {
    @State var radioButtonsValues = [radioButtonValue1]()
    let loopIndex = 3
    @State var cards: [String] = ["AmericanExpress", "Visa", "MasterCard"]
    var body: some View {
        VStack{
            if radioButtonsValues.count > 0{
                HStack{
                    ForEach(0..<loopIndex){ i in
                        HStack{
                            radioButtonTest(isClicked: radioButtonsValues[i])
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        buttonFalse(Index: i)
                                    }
                                }
                                Image("\(cards[i])")
                         
                        }
                    }
                }
                
            }
        }
        .onAppear{
            addValueToButtonArray()
        }

    }
    func addValueToButtonArray(){
        var isClicked = false
        
        for i in 0..<loopIndex {
            
            if i == 0 {
                isClicked = true
            }else{
                isClicked = false
            }
            let x = radioButtonValue1(isClicked: isClicked)
            radioButtonsValues.append(x)
        }
    }
    
    func buttonFalse(Index: Int) {
        var isClicked = false
        for i in 0..<loopIndex {
            if i == Index {
                isClicked = true
            }else {
                isClicked = false
            }
            radioButtonsValues[i].isClicked = isClicked
        }
    }
}
struct radioButtonTest: View{
    var isClicked: radioButtonValue1
    var body: some View {
        ZStack{
            Circle()
                .stroke(.red ,lineWidth: 2)
                .frame(width: 20, height: 20)
            if isClicked.isClicked {
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.red)
            }
            
        }
    }
}

struct CardPaymentModel_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentModel()
    }
}

struct radioButtonValue1 {
    var isClicked: Bool
    
    init(isClicked: Bool) {
        self.isClicked = isClicked
       
    }
}
