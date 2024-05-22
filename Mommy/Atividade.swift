//
//  Atividade.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 16/05/24.
//

import Foundation
import SwiftData

// Struct do tipo atividade, em variáveis desse tipo vou armazenar cada item meu

@Model
class Atividade {
    let nome: String = ""
    let frequencia: Int
    let ultimaVez: Int
    let duracao: Int
    let gosto: Int
    let opacidade = 1.0
    let nota: Double
    
    init(nome: String, frequencia: Int, ultimaVez: Int, duracao: Int, gosto: Int, opacidade: Double = 1.0) {
        self.nome = nome
        self.frequencia = frequencia
        self.ultimaVez = ultimaVez
        self.duracao = duracao
        self.gosto = gosto
        self.opacidade = opacidade
        self.nota = Self.getNota(ultimaVez: ultimaVez, frequencia: frequencia, gosto: gosto)
        
    }

    static func getNota(
        ultimaVez: Int,
        frequencia: Int,
        gosto: Int
    ) -> Double {
        let razao1 = Double(ultimaVez) / Double(frequencia)
        let razao2 = Double(gosto) / 5
        return 8 * razao1 + 2 * razao2
    }
}
