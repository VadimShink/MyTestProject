//
//  CityView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var viewModel: CityViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("CityView")
            }
            .padding(.bottom, 50)
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(viewModel: .init(model: .emptyMock))
    }
}
