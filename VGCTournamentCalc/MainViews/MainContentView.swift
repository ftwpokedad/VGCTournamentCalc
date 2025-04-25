//
//  MainContentView.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/24/25.
//

import SwiftUI

struct MainContentView: View {
	// State variables for whole app
	@State var numMastersPlayers = 0.0
	@State var numSeniorsPlayers = 0.0
	@State var numJuniorsPlayers = 0.0
	
	@State var phase1SwissRounds = 0.0
	@State var phase2SwissRounds = 0.0
	@State var topCut: Double = 0.0
	@State var pointsToAdvance: Double = 0.0
	
	@State var mastersPhase1Swiss = 0.0
	@State var mastersPhase2Swiss = 0.0
	@State var mastersTopCut: Double = 0.0
	@State var mastersPointCut: Double = 0.0
	
	@State var seniorsPhase1Swiss = 0.0
	@State var seniorsPhase2Swiss = 0.0
	@State var seniorsTopCut: Double = 0.0
	@State var seniorsPointCut: Double = 0.0
	
	@State var juniorsPhase1Swiss = 0.0
	@State var juniorsPhase2Swiss = 0.0
	@State var juniorsTopCut: Double = 0.0
	@State var juniorsPointCut: Double = 0.0
		
	var body: some View {
		// Display Tabs
		TabView {
			PhaseOneInformation(numMastersPlayers: $numMastersPlayers,
								numSeniorsPlayers: $numSeniorsPlayers,
								numJuniorsPlayers: $numJuniorsPlayers,
								mastersPhase1Swiss: $mastersPhase1Swiss,
								mastersPhase2Swiss: $mastersPhase2Swiss,
								mastersTopCut: $mastersTopCut,
								mastersPointCut: $mastersPointCut,
								seniorsPhase1Swiss: $seniorsPhase1Swiss,
								seniorsPhase2Swiss: $seniorsPhase2Swiss,
								seniorsTopCut: $seniorsTopCut,
								seniorsPointCut: $seniorsPointCut,
								juniorsPhase1Swiss: $juniorsPhase1Swiss,
								juniorsPhase2Swiss: $juniorsPhase2Swiss,
								juniorsTopCut: $juniorsTopCut,
								juniorsPointCut: $juniorsPointCut)
			.tabItem {
				Label("Tournament Info", systemImage: "list.dash")
			}
			
			MastersPhaseTwoCalculations(mastersPhase1Swiss: $mastersPhase1Swiss,
										mastersPointCut: $mastersPointCut,
										numMastersPlayers: $numMastersPlayers)
			.tabItem {
				Label("Masters Phase 2", systemImage: "person.circle")
			}
			
			SeniorsPhaseTwoCalculations(seniorsPhase1Swiss: $seniorsPhase1Swiss,
										seniorsPointCut: $seniorsPointCut,
										numSeniorsPlayers: $numSeniorsPlayers)
			.tabItem {
				Label("Seniors Phase 2", systemImage: "person.circle")
			}
			
			JuniorsPhaseTwoCalculations(juniorsPhase1Swiss: $juniorsPhase1Swiss,
										juniorsPointCut: $juniorsPointCut,
										numJuniorsPlayers: $numJuniorsPlayers)
			.tabItem {
				Label("Juniors Phase 2", systemImage: "person.circle")
			}
		}
	}
}

#Preview {
	MainContentView()
}
