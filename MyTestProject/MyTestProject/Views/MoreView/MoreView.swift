//
//  MoreView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct MoreView: View {
    
    @ObservedObject var viewModel: MoreViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("MoreView")
            }
            .padding(.bottom, 50)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(viewModel: .init(model: .emptyMock))
    }
}
