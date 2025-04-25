//
//  TournamentInformation.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/5/25.
//

import SwiftUI

struct TournamentInformation: View {
	// Number of Players
	@Binding var phase1SwissRounds: Double
	@Binding var phase2SwissRounds: Double
	@Binding var pointsToAdvance: Double
	@Binding var topCut: Double
	
	init(
	phase1swissRounds: Binding<Double>,
	phase2SwissRounds: Binding<Double>,
	topCut: Binding<Double>,
	pointsToAdvance: Binding<Double>
	)
	{
		self._topCut = topCut
		self._pointsToAdvance = pointsToAdvance
		self._phase1SwissRounds = phase1swissRounds
		self._phase2SwissRounds = phase2SwissRounds
	}
	
	
	
	var body: some View {
		// Define Section to calculate P1 and P2 Swiss Rounds, Top Cut Numbers and Points to advance
		Section {
		}
	}
	
	// Performs calc to find out what the Number of Phase 1 and 2 Rounds, Top Cut and Points needed
	func calculateTournamentDetails(numPlayers: Double) -> (phase1Swiss: Double, phase2Swiss: Double, topCut: Double, pointsToAdvance: Double){
		switch numPlayers{
		case 4...8:
			phase1SwissRounds = 3
			pointsToAdvance = 0
			phase2SwissRounds = 0
			topCut = 0
							
			
		case 9...16:
			phase1SwissRounds = 4
			pointsToAdvance = 0
			phase2SwissRounds = 0
			topCut = 0
			
			
		case 17...32:
			phase1SwissRounds = 6
			pointsToAdvance = 0
			phase2SwissRounds = 0
			topCut = 4
			
			
		case 33...64:
			phase1SwissRounds = 7
			pointsToAdvance = 0
			phase2SwissRounds = 0
			topCut = 6
			
			
		case 65...128:
			phase1SwissRounds = 6
			pointsToAdvance = 10
			phase2SwissRounds = 2
			topCut = 8
			
			
		case 129...256:
			phase1SwissRounds = 7
			pointsToAdvance = 13
			phase2SwissRounds = 2
			topCut = 8
			
			
		case 257...512:
			phase1SwissRounds = 8
			pointsToAdvance = 16
			phase2SwissRounds = 2
			topCut = 8
			
			
		case 513...1024:
			phase1SwissRounds = 8
			pointsToAdvance = 16
			phase2SwissRounds = 3
			topCut = 8
			
			
		case 1025...2048:
			phase1SwissRounds = 8
			pointsToAdvance = 16
			phase2SwissRounds = 4
			topCut = 8
			
			
		case 2049...4096:
			phase1SwissRounds = 9
			pointsToAdvance = 19
			phase2SwissRounds = 4
			topCut = 8
			
			
		case 4097...:
			phase1SwissRounds = 9
			pointsToAdvance = 19
			phase2SwissRounds = 5
			topCut = 8
			
			
		default:
			phase1SwissRounds = 0
			pointsToAdvance = 0
			phase2SwissRounds = 0
			topCut = 0

		}
		return (phase1SwissRounds, phase2SwissRounds, topCut, pointsToAdvance)
	}
}

