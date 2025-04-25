//
//  SeniorsPhaseTwoCalculations.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/24/25.
//

import SwiftUI

struct SeniorsPhaseTwoCalculations: View {
	@Binding var seniorsPhase1Swiss: Double
	@Binding var seniorsPointCut: Double
	@Binding var numSeniorsPlayers: Double
	
	init(
		seniorsPhase1Swiss: Binding<Double>,
		seniorsPointCut: Binding<Double>,
		numSeniorsPlayers: Binding<Double>
	)
	{
		self._seniorsPhase1Swiss = seniorsPhase1Swiss
		self._seniorsPointCut = seniorsPointCut
		self._numSeniorsPlayers = numSeniorsPlayers
	}
	
	var body: some View {
		// Calculate Points per Record Category based on Phase 1 Swiss Rounds
		let recordCat1Points = seniorsPhase1Swiss * 3
		let recordCat2Points = (seniorsPhase1Swiss - 1) * 3
		let recordCat3Points = (seniorsPhase1Swiss - 2) * 3
		let recordCat4Points = (seniorsPhase1Swiss - 3) * 3
		let recordCat5Points = (seniorsPhase1Swiss - 4) * 3
		let recordCat6Points = (seniorsPhase1Swiss - 5) * 3
		let recordCat7Points = (seniorsPhase1Swiss - 6) * 3
		let recordCat8Points = (seniorsPhase1Swiss - 7) * 3
		let recordCat9Points = (seniorsPhase1Swiss - 8) * 3
		let recordCat10Points = (seniorsPhase1Swiss - 9) * 3
		
		// Establish the factors used to calculate # of Players in each Match Record Category at the end of Phase 1 Swiss
		let effectOfRounds: Double = pow(2, seniorsPhase1Swiss)
		let effectOfRoundOne: Double = seniorsPhase1Swiss
		let effectOfRoundTwo: Double = (seniorsPhase1Swiss - 1) / 2
		let effectOfRoundThree: Double = (seniorsPhase1Swiss - 2) / 3
		let effectOfRoundFour: Double = (seniorsPhase1Swiss - 3) / 4
		let effectOfRoundFive: Double = (seniorsPhase1Swiss - 4) / 5
		let effectOfRoundSix: Double = (seniorsPhase1Swiss - 5) / 6
		let effectOfRoundSeven: Double = (seniorsPhase1Swiss - 6) / 7
		let effectOfRoundEight: Double = (seniorsPhase1Swiss - 7) / 8
		let effectOfRoundNine: Double = (seniorsPhase1Swiss - 8) / 9
		
		// Calculate the # of Players in each Match Record Category at the end of Phase 1 Swiss
		let playersRecordCat1: Double = (Double((numSeniorsPlayers)) / effectOfRounds)
		let playersRecordCat2: Double = (playersRecordCat1 * effectOfRoundOne)
		let playersRecordCat3: Double = (playersRecordCat2 * effectOfRoundTwo)
		let playersRecordCat4: Double = (playersRecordCat3 * effectOfRoundThree)
		let playersRecordCat5: Double = (playersRecordCat4 * effectOfRoundFour)
		let playersRecordCat6: Double = (playersRecordCat5 * effectOfRoundFive)
		let playersRecordCat7: Double = (playersRecordCat6 * effectOfRoundSix)
		let playersRecordCat8: Double = (playersRecordCat7 * effectOfRoundSeven)
		let playersRecordCat9: Double = (playersRecordCat8 * effectOfRoundEight)
		let playersRecordCat10: Double = (playersRecordCat9 * effectOfRoundNine)
		
		// This section Calculates # of Players advancing and determines which Match Records to Show
		Form {
			Section(header: Text("Number of Seniors Advancing to Phase 2")) {
				if Int(seniorsPointCut) == 0 {
					Text("No Phase 2")
				} else {
					if Int(recordCat10Points) >= Int(seniorsPointCut) {
						let advPlayers =
						playersRecordCat1 + playersRecordCat2
						+ playersRecordCat3
						+ playersRecordCat4 + playersRecordCat5
						+ playersRecordCat6
						+ playersRecordCat7 + playersRecordCat8
						+ playersRecordCat9
						+ playersRecordCat10 + playersRecordCat10
						Text(
							"\(String(format: "%.1f", advPlayers))  Seniors will advance"
						)
					} else {
						if Int(recordCat9Points) >= Int(seniorsPointCut) {
							let advPlayers =
							playersRecordCat1 + playersRecordCat2
							+ playersRecordCat3
							+ playersRecordCat4 + playersRecordCat5
							+ playersRecordCat6
							+ playersRecordCat7 + playersRecordCat8
							+ playersRecordCat9
							Text(
								"\(String(format: "%.1f", advPlayers))  Seniors will advance"
							)
						} else {
							if Int(recordCat8Points) >= Int(seniorsPointCut) {
								let advPlayers =
								playersRecordCat1 + playersRecordCat2
								+ playersRecordCat3
								+ playersRecordCat4 + playersRecordCat5
								+ playersRecordCat6
								+ playersRecordCat7 + playersRecordCat8
								Text(
									"\(String(format: "%.1f", advPlayers))  Seniors will advance"
								)
							} else {
								if Int(recordCat7Points) >= Int(seniorsPointCut) {
									let advPlayers =
									playersRecordCat1
									+ playersRecordCat2
									+ playersRecordCat3
									+ playersRecordCat4
									+ playersRecordCat5
									+ playersRecordCat6
									+ playersRecordCat7
									Text(
										"\(String(format: "%.1f", advPlayers))  Seniors will advance"
									)
								} else {
									if Int(recordCat6Points) >= Int(seniorsPointCut) {
										let advPlayers =
										playersRecordCat1
										+ playersRecordCat2
										+ playersRecordCat3
										+ playersRecordCat4
										+ playersRecordCat5
										+ playersRecordCat6
										Text(
											"\(String(format: "%.1f", advPlayers))  Seniors will advance"
										)
									} else {
										if Int(recordCat5Points) >= Int(seniorsPointCut) {
											let advPlayers =
											playersRecordCat1
											+ playersRecordCat2
											+ playersRecordCat3
											+ playersRecordCat4
											+ playersRecordCat5
											Text(
												"\(String(format: "%.1f", advPlayers))  Seniors will advance"
											)
										} else {
											if Int(recordCat4Points)
												>= Int(seniorsPointCut)
											{
												let advPlayers =
												playersRecordCat1
												+ playersRecordCat2
												+ playersRecordCat3
												+ playersRecordCat4
												Text(
													"\(String(format: "%.1f", advPlayers))  Seniors will advance"
												)
											} else {
												if Int(recordCat3Points)
													>= Int(seniorsPointCut)
												{
													let advPlayers =
													playersRecordCat1
													+ playersRecordCat2
													+ playersRecordCat3
													Text(
														"\(String(format: "%.1f", advPlayers))  Seniors will advance"
													)
												} else {
													if Int(recordCat2Points)
														>= Int(seniorsPointCut)
													{
														let advPlayers =
														playersRecordCat1
														+ playersRecordCat2
														Text(
															"\(String(format: "%.1f", advPlayers))  Seniors will advance"
														)
													} else {
														if Int(
															recordCat1Points
														) >= Int(seniorsPointCut) {
															let advPlayers =
															playersRecordCat1
															Text(
																"\(String(format: "%.1f", advPlayers))   Seniors will advance"
															)
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			
			// Display each Record Category that is valid based on Round Count in Phase 1 Swiss and identify which categories will advance to Phase 2
			Section(header: Text("# Seniors with the following records:")) {
				if seniorsPhase1Swiss > 0 {
					Text(
						Int(recordCat1Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", seniorsPhase1Swiss))-0 Players: \(String(format: "%.2f", playersRecordCat1))"
						: "# \(String(format: "%.0f", seniorsPhase1Swiss))-0 Players: \(String(format: "%.2f", playersRecordCat1))"
					)
				}
				
				if seniorsPhase1Swiss >= 1 {
					Text(
						Int(recordCat2Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-1))-1 Players: \(String(format: "%.2f", playersRecordCat2))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-1))-1 Players: \(String(format: "%.2f", playersRecordCat2))"
					)
				}
				
				if seniorsPhase1Swiss >= 2 {
					Text(
						Int(recordCat3Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-2))-2 Players: \(String(format: "%.2f", playersRecordCat3))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-2))-2 Players: \(String(format: "%.2f", playersRecordCat3))"
					)
				}
				
				if seniorsPhase1Swiss >= 3 {
					Text(
						Int(recordCat4Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-3))-3 Players: \(String(format: "%.2f", playersRecordCat4))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-3))-3 Players: \(String(format: "%.2f", playersRecordCat4))"
					)
				}
				
				if seniorsPhase1Swiss >= 4 {
					Text(
						Int(recordCat5Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-4))-4 Players: \(String(format: "%.2f", playersRecordCat5))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-4))-4 Players: \(String(format: "%.2f", playersRecordCat5))"
					)
				}
				
				if seniorsPhase1Swiss >= 5 {
					Text(
						Int(recordCat6Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-5))-5 Players: \(String(format: "%.2f", playersRecordCat6))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-5))-5 Players: \(String(format: "%.2f", playersRecordCat6))"
					)
				}
				
				if seniorsPhase1Swiss >= 6 {
					Text(
						Int(recordCat7Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-6))-6 Players: \(String(format: "%.2f", playersRecordCat7))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-6))-6 Players: \(String(format: "%.2f", playersRecordCat7))"
					)
				}
				
				if seniorsPhase1Swiss >= 7 {
					Text(
						Int(recordCat8Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-7))-7 Players: \(String(format: "%.2f", playersRecordCat8))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-7))-7 Players: \(String(format: "%.2f", playersRecordCat8))"
					)
				}
				
				if seniorsPhase1Swiss >= 8 {
					Text(
						Int(recordCat9Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-8))-8 Players: \(String(format: "%.2f", playersRecordCat9))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-8))-8 Players: \(String(format: "%.2f", playersRecordCat9))"
					)
				}
				
				if seniorsPhase1Swiss >= 9 {
					Text(
						Int(recordCat10Points) >= Int(seniorsPointCut)
						? "||  # \(String(format: "%.0f", (seniorsPhase1Swiss)-9))-9 Players: \(String(format: "%.2f", playersRecordCat10))"
						: "# \(String(format: "%.0f", (seniorsPhase1Swiss)-9))-9 Players: \(String(format: "%.2f", playersRecordCat10))"
					)
				}
			}
		}
	}
}
