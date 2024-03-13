//
//  NavigationHappbit.swift
//  Happbit
//
//  Created by halm robin on 13/03/2024.
//

import SwiftUI

struct NavigationHappbit: View {
    var body: some View {
        TabView {
            HabitListView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
//                .tabItem{
//                    Label("Stats", systemImage: "arrow.up.right.circle")
//                }
//                .tabItem{
//                    Label("Settings", systemImage: "gearshape.fill")
//                }
        }
    }
}

struct NavigationHappbit_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHappbit()
    }
}
