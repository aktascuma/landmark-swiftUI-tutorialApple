//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Cuma Aktaş on 19.02.2025.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List{
                
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                ForEach (modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    
                }
                .listRowInsets(EdgeInsets())
                }
            .navigationTitle("Featured")
            .listStyle(.inset)
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile){
                    ProfileHost()
                        .environment(modelData)
                    
                }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}
