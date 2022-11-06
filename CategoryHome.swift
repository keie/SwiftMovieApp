//
//  CategoryHome.swift
//  MovieApp
//
//  Created by Apple User on 11/5/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            List{
                ForEach(modelData.categories.keys.sorted(),id: \.self){ key in
                        Text(key)
                        
                }
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
