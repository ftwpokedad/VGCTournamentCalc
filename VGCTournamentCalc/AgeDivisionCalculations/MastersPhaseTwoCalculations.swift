//
//  MastersPhaseTwoCalculations.swift
//  TourneyCalc v1
//
//  Created by Michael Woitalla on 4/24/25.
//

import SwiftUI

struct MastersPhaseTwoCalculations: View {
	
	@Binding var mastersPhase1Swiss: Double
	@Binding var mastersPointCut: Double
	@Binding var numMastersPlayers: Double
	
	init(
		mastersPhase1Swiss: Binding<Double>,
		mastersPointCut: Binding<Double>,
		numMastersPlayers: Binding<Double>
	) {
		self._mastersPhase1Swiss = mastersPhase1Swiss
		self._mastersPointCut = mastersPointCut
		self._numMastersPlayers = numMastersPlayers
		
	}
	
	var body: some View {
		// Calculate Points per Record Category based on Phase 1 Swiss Rounds
		let recordCat1Points = mastersPhase1Swiss * 3
		let recordCat2Points = (mastersPhase1Swiss - 1) * 3
		let recordCat3Points = (mastersPhase1Swiss - 2) * 3
		let recordCat4Points = (mastersPhase1Swiss - 3) * 3
		let recordCat5Points = (mastersPhase1Swiss - 4) * 3
		let recordCat6Points = (mastersPhase1Swiss - 5) * 3
		let recordCat7Points = (mastersPhase1Swiss - 6) * 3
		let recordCat8Points = (mastersPhase1Swiss - 7) * 3
		let recordCat9Points = (mastersPhase1Swiss - 8) * 3
		let recordCat10Points = (mastersPhase1Swiss - 9) * 3
		
		// Establish the factors used to calculate # of Players in each Match Record Category at the end of Phase 1 Swiss
		let effectOfRounds: Double = pow(2, mastersPhase1Swiss)
		let effectOfRoundOne: Double = mastersPhase1Swiss
		let effectOfRoundTwo: Double = (mastersPhase1Swiss - 1) / 2
		let effectOfRoundThree: Double = (mastersPhase1Swiss - 2) / 3
		let effectOfRoundFour: Double = (mastersPhase1Swiss - 3) / 4
		let effectOfRoundFive: Double = (mastersPhase1Swiss - 4) / 5
		let effectOfRoundSix: Double = (mastersPhase1Swiss - 5) / 6
		let effectOfRoundSeven: Double = (mastersPhase1Swiss - 6) / 7
		let effectOfRoundEight: Double = (mastersPhase1Swiss - 7) / 8
		let effectOfRoundNine: Double = (mastersPhase1Swiss - 8) / 9
		
		// Calculate the # of Players in each Match Record Category at the end of Phase 1 Swiss
		let playersRecordCat1: Double = (Double((numMastersPlayers)) / effectOfRounds)
		let playersRecordCat2: Double = (playersRecordCat1 * effectOfRoundOne)
		let playersRecordCat3: Double = (playersRecordCat2 * effectOfRoundTwo)
		let playersRecordCat4: Double = (playersRecordCat3 * effectOfRoundThree)
		let playersRecordCat5: Double = (playersRecordCat4 * effectOfRoundFour)
		let playersRecordCat6: Double = (playersRecordCat5 * effectOfRoundFive)
		let playersRecordCat7: Double = (playersRecordCat6 * effectOfRoundSix)
		let playersRecordCat8: Double = (playersRecordCat7 * effectOfRoundSeven)
		let playersRecordCat9: Double = (playersRecordCat8 * effectOfRoundEight)
		let playersRecordCat10: Double = (playersRecordCat9 * effectOfRoundNine)
		
		//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		// This section Calculates # of Players advancing and determines which Match Records to Show
		Form {
			Section(header: Text("Number of Masters Advancing to Phase 2")) {
				if Int(mastersPointCut) == 0 {
					Text("No Phase 2")
				} else {
					if Int(recordCat10Points) >= Int(mastersPointCut) {
						let advPlayers =
						playersRecordCat1 + playersRecordCat2
						+ playersRecordCat3
						+ playersRecordCat4 + playersRecordCat5
						+ playersRecordCat6
						+ playersRecordCat7 + playersRecordCat8
						+ playersRecordCat9
						+ playersRecordCat10 + playersRecordCat10
						Text(
							"\(String(format: "%.1f", advPlayers))  Masters will advance"
						)
					} else {
						if Int(recordCat9Points) >= Int(mastersPointCut) {
							let advPlayers =
							playersRecordCat1 + playersRecordCat2
							+ playersRecordCat3
							+ playersRecordCat4 + playersRecordCat5
							+ playersRecordCat6
							+ playersRecordCat7 + playersRecordCat8
							+ playersRecordCat9
							Text(
								"\(String(format: "%.1f", advPlayers))  Masters will advance"
							)
						} else {
							if Int(recordCat8Points) >= Int(mastersPointCut) {
								let advPlayers =
								playersRecordCat1 + playersRecordCat2
								+ playersRecordCat3
								+ playersRecordCat4 + playersRecordCat5
								+ playersRecordCat6
								+ playersRecordCat7 + playersRecordCat8
								Text(
									"\(String(format: "%.1f", advPlayers))  Masters will advance"
								)
							} else {
								if Int(recordCat7Points) >= Int(mastersPointCut) {
									let advPlayers =
									playersRecordCat1
									+ playersRecordCat2
									+ playersRecordCat3
									+ playersRecordCat4
									+ playersRecordCat5
									+ playersRecordCat6
									+ playersRecordCat7
									Text(
										"\(String(format: "%.1f", advPlayers))  Masters will advance"
									)
								} else {
									if Int(recordCat6Points) >= Int(mastersPointCut) {
										let advPlayers =
										playersRecordCat1
										+ playersRecordCat2
										+ playersRecordCat3
										+ playersRecordCat4
										+ playersRecordCat5
										+ playersRecordCat6
										Text(
											"\(String(format: "%.1f", advPlayers))  Masters will advance"
										)
									} else {
										if Int(recordCat5Points) >= Int(mastersPointCut) {
											let advPlayers =
											playersRecordCat1
											+ playersRecordCat2
											+ playersRecordCat3
											+ playersRecordCat4
											+ playersRecordCat5
											Text(
												"\(String(format: "%.1f", advPlayers))  Masters will advance"
											)
										} else {
											if Int(recordCat4Points)
												>= Int(mastersPointCut)
											{
												let advPlayers =
												playersRecordCat1
												+ playersRecordCat2
												+ playersRecordCat3
												+ playersRecordCat4
												Text(
													"\(String(format: "%.1f", advPlayers))  Masters will advance"
												)
											} else {
												if Int(recordCat3Points)
													>= Int(mastersPointCut)
												{
													let advPlayers =
													playersRecordCat1
													+ playersRecordCat2
													+ playersRecordCat3
													Text(
														"\(String(format: "%.1f", advPlayers))  Masters will advance"
													)
												} else {
													if Int(recordCat2Points)
														>= Int(mastersPointCut)
													{
														let advPlayers =
														playersRecordCat1
														+ playersRecordCat2
														Text(
															"\(String(format: "%.1f", advPlayers))  Masters will advance"
														)
													} else {
														if Int(
															recordCat1Points
														) >= Int(mastersPointCut) {
															let advPlayers =
															playersRecordCat1
															Text(
																"\(String(format: "%.1f", advPlayers))   Masters will advance"
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
			Section(header: Text("# Masters with the following records:")) {
				if mastersPhase1Swiss > 0 {
					Text(
						Int(recordCat1Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", mastersPhase1Swiss))-0 Players: \(String(format: "%.2f", playersRecordCat1))"
						: "# \(String(format: "%.0f", mastersPhase1Swiss))-0 Players: \(String(format: "%.2f", playersRecordCat1))"
					)
				}
				
				if mastersPhase1Swiss >= 1 {
					Text(
						Int(recordCat2Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-1))-1 Players: \(String(format: "%.2f", playersRecordCat2))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-1))-1 Players: \(String(format: "%.2f", playersRecordCat2))"
					)
				}
				
				if mastersPhase1Swiss >= 2 {
					Text(
						Int(recordCat3Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-2))-2 Players: \(String(format: "%.2f", playersRecordCat3))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-2))-2 Players: \(String(format: "%.2f", playersRecordCat3))"
					)
				}
				
				if mastersPhase1Swiss >= 3 {
					Text(
						Int(recordCat4Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-3))-3 Players: \(String(format: "%.2f", playersRecordCat4))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-3))-3 Players: \(String(format: "%.2f", playersRecordCat4))"
					)
				}
				
				if mastersPhase1Swiss >= 4 {
					Text(
						Int(recordCat5Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-4))-4 Players: \(String(format: "%.2f", playersRecordCat5))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-4))-4 Players: \(String(format: "%.2f", playersRecordCat5))"
					)
				}
				
				if mastersPhase1Swiss >= 5 {
					Text(
						Int(recordCat6Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-5))-5 Players: \(String(format: "%.2f", playersRecordCat6))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-5))-5 Players: \(String(format: "%.2f", playersRecordCat6))"
					)
				}
				
				if mastersPhase1Swiss >= 6 {
					Text(
						Int(recordCat7Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-6))-6 Players: \(String(format: "%.2f", playersRecordCat7))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-6))-6 Players: \(String(format: "%.2f", playersRecordCat7))"
					)
				}
				
				if mastersPhase1Swiss >= 7 {
					Text(
						Int(recordCat8Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-7))-7 Players: \(String(format: "%.2f", playersRecordCat8))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-7))-7 Players: \(String(format: "%.2f", playersRecordCat8))"
					)
				}
				
				if mastersPhase1Swiss >= 8 {
					Text(
						Int(recordCat9Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-8))-8 Players: \(String(format: "%.2f", playersRecordCat9))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-8))-8 Players: \(String(format: "%.2f", playersRecordCat9))"
					)
				}
				
				if mastersPhase1Swiss >= 9 {
					Text(
						Int(recordCat10Points) >= Int(mastersPointCut)
						? "||  # \(String(format: "%.0f", (mastersPhase1Swiss)-9))-9 Players: \(String(format: "%.2f", playersRecordCat10))"
						: "# \(String(format: "%.0f", (mastersPhase1Swiss)-9))-9 Players: \(String(format: "%.2f", playersRecordCat10))"
					)
				}
			}
		}
	}
}
