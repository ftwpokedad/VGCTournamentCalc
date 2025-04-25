//
//  02_TournInfoMasters.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct TournInfoMasters: View {
	// Number of Players
	@Binding var numMastersPlayers: Double
	@Binding var mastersPhase1Swiss: Double
	@Binding var mastersPhase2Swiss: Double
	@Binding var mastersPointCut: Double
	@Binding var mastersTopCut: Double
	
	init(
		numMastersPlayers: Binding<Double>,
		mastersPhase1Swiss: Binding<Double>,
		mastersPhase2Swiss: Binding<Double>,
		mastersPointCut: Binding<Double>,
		mastersTopCut: Binding<Double>
	) {
		self._numMastersPlayers = numMastersPlayers
		self._mastersPhase1Swiss = mastersPhase1Swiss
		self._mastersPhase2Swiss = mastersPhase2Swiss
		self._mastersPointCut = mastersPointCut
		self._mastersTopCut = mastersTopCut
	}
	
	var body: some View {
		// Define Section to calculate P1 and P2 Swiss Rounds, Top Cut Numbers and Points to advance
		Section {
			HStack {
				Text("Number of Masters: ")
				TextField("# of Masters", value: $numMastersPlayers, format: .number)
					.keyboardType(.numberPad)
					.onChange(of: numMastersPlayers, initial: true) {
						let mastersDetails: TournamentInformation = TournamentInformation(phase1swissRounds: $mastersPhase1Swiss,
																						  phase2SwissRounds: $mastersPhase2Swiss,
																						  topCut: $mastersTopCut,
																						  pointsToAdvance: $mastersPointCut)
						
						mastersPhase1Swiss = mastersDetails.calculateTournamentDetails(numPlayers: numMastersPlayers).phase1Swiss
						mastersPhase2Swiss = mastersDetails.calculateTournamentDetails(numPlayers: numMastersPlayers).phase2Swiss
						mastersTopCut = mastersDetails.calculateTournamentDetails(numPlayers: numMastersPlayers).topCut
						mastersPointCut = mastersDetails.calculateTournamentDetails(numPlayers: numMastersPlayers).pointsToAdvance
					}
			}
			if numMastersPlayers > 1 {
				HStack {
					Text("Phase 1 Swiss Rounds:")
					Text(mastersPhase1Swiss < 1 ? "N/A" : "\(Int(mastersPhase1Swiss))")
				}
				HStack {
					Text("Phase 2 Swiss Rounds:")
					Text(mastersPhase2Swiss < 1 ? "N/A" : "\(Int(mastersPhase2Swiss))")
				}
				HStack {
					Text("Top Cut:")
					Text(mastersTopCut < 4 ? "N/A" : "Asym Top \(Int(mastersTopCut))")
				}
				HStack {
					Text("Points to Advance:")
					Text(mastersPointCut <= 0 ? "N/A" : "\(Int(mastersPointCut))")
				}
			}
		}
	}
}
