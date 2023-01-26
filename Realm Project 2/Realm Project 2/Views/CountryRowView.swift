//
//  CountryRowView.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
//

import SwiftUI
import RealmSwift

struct CountryRowView: View {
    
    @ObservedRealmObject var country: Country
    @FocusState var isFocus: Bool?
    @State private var showFlagPicker = false
    var body: some View {
        HStack {
            Button{
                showFlagPicker = true
            }label: {
                Text(country.flag)
            }
            .buttonStyle(.plain)
            TextField("New Country", text: $country.name)
                .focused($isFocus, equals: true)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            Text("\(country.cities.count) cities")
            
        }
            .padding()
            .frame(height: 30)
            .sheet(isPresented: $showFlagPicker) {
                FlagPicker(country: country)
            }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "Shan State"))
    }
}
