//
//  informationOfActivityView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 18/05/24.
//

import SwiftUI

struct informationOfActivityView: View {
    
    @Binding var seeInformationOfActivity: Bool
    @Binding var activity: Atividade
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Text("Sair")
                        .font(.exitText)
                        .foregroundStyle(.exitButton)
                }
                .padding(.horizontal)
                .padding(.top)
                
            
                
                
            }
            .frame(height: 300)
            .frame(width: 300)
            .background(.fundo)
            .cornerRadius(10.0)
            
        }
        .ignoresSafeArea()
    }
}


#Preview {
    informationOfActivityView(seeInformationOfActivity: .constant(true), activity: .constant(.init(frequencia: 3, ultimaVez: 4, duracao: 10, gosto: 4)))
}
