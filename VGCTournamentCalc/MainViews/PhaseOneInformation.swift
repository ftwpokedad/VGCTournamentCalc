//
//  PhaseOneInformation.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct PhaseOneInformation: View {
	// Number Players Bindings
	@Binding var numMastersPlayers: Double
	@Binding var numSeniorsPlayers: Double
	@Binding var numJuniorsPlayers: Double
	
	// Masters Details Bindings
	@Binding var mastersPhase1Swiss: Double
	@Binding var mastersPhase2Swiss: Double
	@Binding var mastersTopCut: Double
	@Binding var mastersPointCut: Double
	
	// Seniors Details Bindings
	@Binding var seniorsPhase1Swiss: Double
	@Binding var seniorsPhase2Swiss: Double
	@Binding var seniorsTopCut: Double
	@Binding var seniorsPointCut: Double
	
	// Juniors Details Bindings
	@Binding var juniorsPhase1Swiss: Double
	@Binding var juniorsPhase2Swiss: Double
	@Binding var juniorsTopCut: Double
	@Binding var juniorsPointCut: Double
	
	var body: some View {
		// Create Age Division Panels
		NavigationView {
			let MastersInfoPanel: TournInfoMasters = TournInfoMasters(
				numMastersPlayers: $numMastersPlayers,
				mastersPhase1Swiss: $mastersPhase1Swiss,
				mastersPhase2Swiss: $mastersPhase2Swiss,
				mastersPointCut: $mastersPointCut,
				mastersTopCut: $mastersTopCut
			)
			let SeniorsInfoPanel: TournInfoSeniors = TournInfoSeniors(
				numSeniorsPlayers: $numSeniorsPlayers,
				seniorsPhase1Swiss: $seniorsPhase1Swiss,
				seniorsPhase2Swiss: $seniorsPhase2Swiss,
				seniorsPointCut: $seniorsPointCut,
				seniorsTopCut: $seniorsTopCut
			)
			let JuniorsInfoPanel: TournInfoJuniors = TournInfoJuniors(
				numJuniorsPlayers: $numJuniorsPlayers,
				juniorsPhase1Swiss: $juniorsPhase1Swiss,
				juniorsPhase2Swiss: $juniorsPhase2Swiss,
				juniorsPointCut: $juniorsPointCut,
				juniorsTopCut: $juniorsTopCut
			)
			
			// Display Age Division Panels
			Form {
				Section(header: Text("Masters Details:")) {
					MastersInfoPanel
				}
				
				Section(header: Text("Seniors Details")) {
					SeniorsInfoPanel
				}
				
				Section(header: Text("Juniors Details:")) {
					JuniorsInfoPanel
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .principal) {
					VStack {
						Text("Pokémon Tournament").font(.headline)
						Text("Details Calculator (2025 Championship Format)").font(.subheadline)
					}
				}
			}
		}
		.scrollDismissesKeyboard(.immediately)
	}
}
