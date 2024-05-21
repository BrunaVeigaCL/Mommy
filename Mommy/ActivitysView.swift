//
//  activitysVView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 16/05/24.
//

import SwiftUI

struct ActivitysView: View {
    
    @Binding var activity: Atividade
    var didTapRemove: () -> Void
    var opacidade: Double
    @State var tentouApagar: Bool = false
    @State var tentouApagarTudo: Bool = false
    var didTapRemoveAll: () -> Void
    
    var body: some View {
        
        HStack (alignment: .center, spacing: 20){
            
            ZStack {
                Circle()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.activity)
                    .opacity(opacidade)
                
                
                let notaCom1CasaDec = String(format: "%.1f", activity.nota)
                
                
                Text("\(notaCom1CasaDec)")
                    .font(.activityNote)
                    .foregroundStyle(.fundo)
            }
            
            VStack (alignment: .leading) {
                
                Text(activity.nome)
                    .font(.activityTitle)
                    .foregroundStyle(.mainText)
                Text("REALIZADA HÁ \(activity.ultimaVez) DIAS")
                    .font(.activitySubtitle)
                    .foregroundStyle(.main)
                if activity.duracao == 60 {
                    Text("+1 h")
                        .font(.activitySecondSubtitle)
                        .foregroundStyle(.tertiaryText)
                } else {
                    Text("\(activity.duracao) min")
                        .font(.activitySecondSubtitle)
                        .foregroundStyle(.tertiaryText)
                }
                
            }
            Spacer()
            
            Button(action: {
                tentouApagar = true
            }) {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.mainText)
            }
            
            
            
        }
        .padding(.horizontal, 25.0)
        .alert("Você tem certeza?", isPresented: $tentouApagar) {
            Button("Apagar atividade", role: .destructive) {
                didTapRemove()
            }
            Button("Cancelar", role: .cancel, action: {})
            Button("Apagar todas as atividades", role: .destructive) {
                tentouApagarTudo = true
            }
        }
        .confirmationDialog("Isso apagará toda a sua lista", isPresented: $tentouApagarTudo, titleVisibility: .visible) {
            Button("OK", role: .cancel, action: {})
            
            Button("Apagar Tudo", role: .destructive) {
                didTapRemoveAll()
            }
            
        }
        
    }
}

#Preview {
    ActivitysView(activity: .constant(Atividade(nome: "TESTE", frequencia: 1, ultimaVez:365, duracao: 10, gosto: 5)), didTapRemove: {print("removeu")}, opacidade: 0.2, didTapRemoveAll: {print("removeu Tudo")})
}
