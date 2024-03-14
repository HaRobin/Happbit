//
//  StatsView.swift
//  Happbit
//
//  Created by quaile fyleas on 13/03/2024.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing:16){
                Image(systemName: "flame.fill")
                    .padding(.leading, 16)
                    .font(.title)
                    .foregroundColor(.red)
                Text("Streak")
                    .font(.largeTitle)
                    
                Spacer()
            }
            
            HStack(spacing: 16){
                Spacer()
                VStack(spacing: 16){
                    Text("3")
                        .font(.title2)
                    Text("Current")
                        .font(.title2)
                }
                Spacer()
                VStack(spacing: 16){
                    Text("15")
                        .font(.title2)
                    Text("Best")
                        .font(.title2)
                }
                Spacer()
            }
            
            HStack(spacing: 16){
                Image(systemName: "arrow.up.right.circle")
                    .padding(.leading, 16)
                    .font(.title)
                    .foregroundColor(.green)
                Text("Stats")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.top, 40)
            
            VStack(spacing: 16){
                //Picker("TimeStats", selection: )
                //update model pour enum day -> .week:7, .month:30
                
            }
            
            Spacer()
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
