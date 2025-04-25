//
//  03_TournInfoSeniors.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct TournInfoSeniors: View {
	// Number of Players
	@Binding var numSeniorsPlayers: Double
	@Binding var seniorsPhase1Swiss: Double
	@Binding var seniorsPhase2Swiss: Double
	@Binding var seniorsPointCut: Double
	@Binding var seniorsTopCut: Double
	
	
	init(
		numSeniorsPlayers: Binding<Double>,
		seniorsPhase1Swiss: Binding<Double>,
		seniorsPhase2Swiss: Binding<Double>,
		seniorsPointCut: Binding<Double>,
		seniorsTopCut: Binding<Double>
	)
	{
		self._numSeniorsPlayers = numSeniorsPlayers
		self._seniorsPhase1Swiss = seniorsPhase1Swiss
		self._seniorsPhase2Swiss = seniorsPhase2Swiss
		self._seniorsPointCut = seniorsPointCut
		self._seniorsTopCut = seniorsTopCut
	}
	
	var body: some View {
		// Define Section to calculate P1 and P2 Swiss Rounds, Top Cut Numbers and Points to advance
		Section {
			HStack {
				Text("Number of Seniors: ")
				TextField("# of Seniors", value: $numSeniorsPlayers, format: .number)
					.keyboardType(.numberPad)
					.onChange(of: numSeniorsPlayers, initial: true) {
						let seniorsDetails: TournamentInformation = TournamentInformation(phase1swissRounds: $seniorsPhase1Swiss,
																						  phase2SwissRounds: $seniorsPhase2Swiss,
																						  topCut: $seniorsTopCut,
																						  pointsToAdvance: $seniorsPointCut)
						
						seniorsPhase1Swiss = seniorsDetails.calculateTournamentDetails(numPlayers: numSeniorsPlayers).phase1Swiss
						seniorsPhase2Swiss = seniorsDetails.calculateTournamentDetails(numPlayers: numSeniorsPlayers).phase2Swiss
						seniorsTopCut = seniorsDetails.calculateTournamentDetails(numPlayers: numSeniorsPlayers).topCut
						seniorsPointCut = seniorsDetails.calculateTournamentDetails(numPlayers: numSeniorsPlayers).pointsToAdvance
					}
			}
			if numSeniorsPlayers > 0{
				HStack {
					Text("Phase 1 Swiss Rounds:")
					Text(seniorsPhase1Swiss < 1 ? "N/A" : "\(Int(seniorsPhase1Swiss))")
				}
				HStack {
					Text("Phase 2 Swiss Rounds:")
					Text(seniorsPhase2Swiss < 1 ? "N/A" : "\(Int(seniorsPhase2Swiss))")
				}
				HStack {
					Text("Top Cut:")
					Text(seniorsTopCut < 4 ? "N/A" : "Asym Top \(Int(seniorsTopCut))")
				}
				HStack {
					Text("Points to Advance:")
					Text(seniorsPointCut <= 0 ? "N/A" : "\(Int(seniorsPointCut))")
				}
			}
		}
	}
}
