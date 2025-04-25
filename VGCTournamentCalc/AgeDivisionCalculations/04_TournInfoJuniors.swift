//
//  04_TournInfoJuniors.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct TournInfoJuniors: View {
	// Number of Players
	@Binding var numJuniorsPlayers: Double
	@Binding var juniorsPhase1Swiss: Double
	@Binding var juniorsPhase2Swiss: Double
	@Binding var juniorsPointCut: Double
	@Binding var juniorsTopCut: Double
	
	
	init(
		numJuniorsPlayers: Binding<Double>,
		juniorsPhase1Swiss: Binding<Double>,
		juniorsPhase2Swiss: Binding<Double>,
		juniorsPointCut: Binding<Double>,
		juniorsTopCut: Binding<Double>
	)
	{
		self._numJuniorsPlayers = numJuniorsPlayers
		self._juniorsPhase1Swiss = juniorsPhase1Swiss
		self._juniorsPhase2Swiss = juniorsPhase2Swiss
		self._juniorsPointCut = juniorsPointCut
		self._juniorsTopCut = juniorsTopCut
	}
	
	var body: some View {
		// Define Section to calculate P1 and P2 Swiss Rounds, Top Cut Numbers and Points to advance
		Section {
			HStack {
				Text("Number of Juniors: ")
				TextField("# of Juniors", value: $numJuniorsPlayers, format: .number)
					.keyboardType(.numberPad)
					.onChange(of: numJuniorsPlayers, initial: true) {
						let juniorsDetails: TournamentInformation = TournamentInformation(phase1swissRounds: $juniorsPhase1Swiss,
																						  phase2SwissRounds: $juniorsPhase2Swiss,
																						  topCut: $juniorsTopCut,
																						  pointsToAdvance: $juniorsPointCut)
						
						juniorsPhase1Swiss = juniorsDetails.calculateTournamentDetails(numPlayers: numJuniorsPlayers).phase1Swiss
						juniorsPhase2Swiss = juniorsDetails.calculateTournamentDetails(numPlayers: numJuniorsPlayers).phase2Swiss
						juniorsTopCut = juniorsDetails.calculateTournamentDetails(numPlayers: numJuniorsPlayers).topCut
						juniorsPointCut = juniorsDetails.calculateTournamentDetails(numPlayers: numJuniorsPlayers).pointsToAdvance
					}
			}
			
			if numJuniorsPlayers > 0 {
				HStack {
					Text("Phase 1 Swiss Rounds:")
					Text(juniorsPhase1Swiss < 1 ? "N/A" : "\(Int(juniorsPhase1Swiss))")
				}
				HStack {
					Text("Phase 2 Swiss Rounds:")
					Text(juniorsPhase2Swiss < 1 ? "N/A" : "\(Int(juniorsPhase2Swiss))")
				}
				HStack {
					Text("Top Cut:")
					Text(juniorsTopCut < 4 ? "N/A" : "Asym Top \(Int(juniorsTopCut))")
				}
				HStack {
					Text("Points to Advance:")
					Text(juniorsPointCut <= 0 ? "N/A" : "\(Int(juniorsPointCut))")
				}
			}
		}
	}
}
