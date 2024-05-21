//
//  informationOfActivityView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 18/05/24.
//

import SwiftUI

struct informationOfActivityView: View {
    
    @Binding var seeInformationOfActivity: Bool
    @Binding var atividade: Atividade
    var alteraAtividade: () -> Void
    @State var changeMode: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            
            VStack (alignment: .leading) {
                
                HStack {
                    Spacer()
                    
                    Text("Sair")
                        .font(.exitText)
                        .foregroundStyle(.exitButton)
                }
                .padding(.horizontal)
                .padding(.top)
                
                HStack{
                    ZStack {
                        Circle()
                            .foregroundColor(.activity)
                            .scaledToFit()
                            .frame(width: 80)
                            .opacity(atividade.opacidade)
                        
                        let notaCom1CasaDec = String(format: "%.1f", atividade.nota)
                        
                        
                        Text("\(notaCom1CasaDec)")
                            .font(.activityNote)
                            .foregroundStyle(.fundo)
                    }
                    .padding(.leading)
                    
                    Text(atividade.nome)
                        .font(.seeActivityTitle)
                        .frame(width: 150)
                        .frame(maxHeight: .infinity)
                    
                }
                
                HStack (alignment: .top) {
                    Image(systemName: "calendar.badge.clock")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                        .foregroundColor(.main)
                        .padding(.leading, 30)
                        .padding(.trailing, 20)
                        .padding(.bottom)
                    
                    
                    VStack (alignment: .leading, spacing: 5.0){
                        Text("REALIZAR A CADA \(atividade.frequencia) DIAS")
                        Text("REALIZADA HÁ \(atividade.ultimaVez) DIAS")
                    }
                    .font(.activitySubtitle)
                    .foregroundColor(.main)
                    
                }
                
                
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                        .foregroundColor(.tertiaryText)
                        .padding(.leading, 30)
                        .padding(.trailing, 35)
                    
                    if atividade.duracao == 60 {
                        Text("+1h")
                            .font(.activitySecondSubtitle)
                            .foregroundColor(.tertiaryText)
                    } else {
                        Text("\(atividade.duracao) min")
                            .font(.activitySecondSubtitle)
                            .foregroundColor(.tertiaryText)
                    }
                    
                }
                
                Button (action: {}) {
                    Rectangle()
                        .frame(width: 300)
                        .frame(height: 50)
                        .foregroundColor(.main)
                        
                        
                }
                .cornerRadius(6.0)
                .padding(.horizontal, 25)
                
                Spacer()
                
                
            }
            .frame(height: 450)
            .frame(width: 350)
            .background(.fundo)
            .cornerRadius(10.0)
            
        }
        .ignoresSafeArea()
    }
}


#Preview {
    informationOfActivityView(seeInformationOfActivity: .constant(true),atividade: .constant(.init(nome: "BLABLAUEBA",frequencia: 3, ultimaVez: 4, duracao: 5, gosto: 3)) , alteraAtividade: {print("oi")})
}
