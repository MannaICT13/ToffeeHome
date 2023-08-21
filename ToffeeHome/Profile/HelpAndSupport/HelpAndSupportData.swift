//
//  HelpAndSupportData.swift
//  TestProfileUserPage
//
//  Created by Fahad on 12/6/23.
//

import SwiftUI

struct HelpAndSupportDatas: Identifiable {
    let id: String = UUID().uuidString
    let helpText: String
    let helpIcon: String
}

let helpDatas: [HelpAndSupportDatas] = [
    .init(helpText: "Check Internet Speed", helpIcon:"ExitButton" ),
    .init(helpText: "Terms of use", helpIcon: "ExitButton"),
    .init(helpText: "Frequently Asked Questions", helpIcon: "ExitButton"),
    .init(helpText: "Privacy Policy", helpIcon:"ExitButton" ),
    .init(helpText: "Send Feedback", helpIcon:"ExitButton" ),
    .init(helpText: "Contact Us", helpIcon: "ExitButton")

]
