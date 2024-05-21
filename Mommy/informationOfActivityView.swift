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
                    
                    if changeMode {
                        //TextField
                    } else {
                        Text(atividade.nome)
                            .font(.seeActivityTitle)
                            .frame(width: 150)
                            .frame(maxHeight: .infinity)
                        
                        Spacer()
                        Button(action: {
                            changeMode = true
                        }){
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.tertiaryText)
                        }
                        .padding(.trailing)
                    }
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
                    
                    if changeMode {
                        // pickers
                    } else {
                        VStack (alignment: .leading, spacing: 5.0){
                            Text("REALIZAR A CADA \(atividade.frequencia) DIAS")
                            Text("REALIZADA HÁ \(atividade.ultimaVez) DIAS")
                        }
                        .font(.activitySubtitle)
                        .foregroundColor(.main)
                    }
                }
                
                
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                        .foregroundColor(.tertiaryText)
                        .padding(.leading, 30)
                        .padding(.trailing, 35)
                    
                    if changeMode {
                        
                    } else {
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
                }
                
                Spacer()
                
                
                
                
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
    informationOfActivityView(seeInformationOfActivity: .constant(true),atividade: .constant(.init(nome: "BLABLAUEBA",frequencia: 3, ultimaVez: 4, duracao: 5, gosto: 3)) , alteraAtividade: {print("oi")})
}
