//
//  PaymentsView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct PaymentsView: View {
    
    @ObservedObject var viewModel: PaymentsViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("PaymentsView")
            }
            .padding(.bottom, 50)
        }
    }
}

struct PaymentsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsView(viewModel: .init(model: .emptyMock))
    }
}
