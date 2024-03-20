//
//  SettingsView.swift
//  Happbit
//
//  Created by halm robin on 20/03/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        @State var nbNutification: Int = 1
        
        VStack {
            
            HStack {
                Text("Number of notification :")
                
                Spacer()
                
                TextField("Enter expense amount", value: $nbNutification, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .frame(width: 80, height: 55)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
