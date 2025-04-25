//
//  01_PlayerInfo.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct PlayerInfo: View {
	// Number of Players
	@Binding var numMastersPlayers: Double
	@Binding var numSeniorsPlayers: Double
	@Binding var numJuniorsPlayers: Double
	
	@Binding var mastersPhase1Swiss: Double
	@Binding var mastersPhase2Swiss: Double
	@Binding var mastersTopCut: Double
	@Binding var mastersPointCut: Double
	
	@Binding var seniorsPhase1Swiss: Double
	@Binding var seniorsPhase2Swiss: Double
	@Binding var seniorsTopCut: Double
	@Binding var seniorsPointCut: Double
	
	@Binding var juniorsPhase1Swiss: Double
	@Binding var juniorsPhase2Swiss: Double
	@Binding var juniorsTopCut: Double
	@Binding var juniorsPointCut: Double
	
	// UI Control Variables
	@State private var hide = false
//	@FocusState private var isFocused: Bool
	
	init(
		numJuniorsPlayers: Binding<Double>,
		numMastersPlayers: Binding<Double>,
		numSeniorsPlayers: Binding<Double>,
		mastersPhase1Swiss: Binding<Double>,
		mastersPhase2Swiss: Binding<Double>,
		mastersTopCut: Binding<Double>,
		mastersPointCut: Binding<Double>,
		seniorsPhase1Swiss: Binding<Double>,
		seniorsPhase2Swiss: Binding<Double>,
		seniorsTopCut: Binding<Double>,
		seniorsPointCut: Binding<Double>,
		juniorsPhase1Swiss: Binding<Double>,
		juniorsPhase2Swiss: Binding<Double>,
		juniorsTopCut: Binding<Double>,
		juniorsPointCut: Binding<Double>
		
	) {
		self._numJuniorsPlayers = numJuniorsPlayers
		self._numSeniorsPlayers = numSeniorsPlayers
		self._numMastersPlayers = numMastersPlayers
		self._mastersTopCut = mastersTopCut
		self._mastersPointCut = mastersPointCut
		self._mastersPhase1Swiss = mastersPhase1Swiss
		self._mastersPhase2Swiss = mastersPhase2Swiss
		self._seniorsPhase1Swiss = seniorsPhase1Swiss
		self._seniorsPhase2Swiss = seniorsPhase2Swiss
		self._seniorsTopCut = seniorsTopCut
		self._seniorsPointCut = seniorsPointCut
		self._juniorsPhase1Swiss = juniorsPhase1Swiss
		self._juniorsPhase2Swiss = juniorsPhase2Swiss
		self._juniorsTopCut = juniorsTopCut
		self._juniorsPointCut = juniorsPointCut
	}
	
	var body: some View {
		// This section Collects Tournament Details
		Section() {
			// Collect number of Masters Players
			HStack {
				Text("Number of Masters: ")
				TextField("# of Masters", value: $numMastersPlayers, format: .number)
					.keyboardType(.numberPad)
//					.focused($isFocused)
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
			
			// Collect number of Seniors Players
			HStack {
				Text("Number of Seniors: ")
				TextField("# of Seniors", value: $numSeniorsPlayers, format: .number)
					.keyboardType(.numberPad)
//					.focused($isFocused)
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
			
			// Collect number of Juniors Players
			HStack {
				Text("Number of Juniors: ")
				TextField("# of Juniors", value: $numJuniorsPlayers, format: .number)
					.keyboardType(.numberPad)
//					.focused($isFocused)
					.onChange(of: numSeniorsPlayers, initial: true) {
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
		}
		
		
	}
}
