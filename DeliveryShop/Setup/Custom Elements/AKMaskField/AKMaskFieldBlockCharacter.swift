//
//  AKMaskFieldBlockCharacter.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 24.02.2021.
//
import Foundation

/// A structure that contains the block character main properties.
public struct AKMaskFieldBlockCharacter {

  //  MARK: - General

  /// Character index in the block.
  var index: Int

  /// The block index in the mask.
  var blockIndex: Int

  /// Current character status.
  var status: AKMaskFieldStatus

  //  MARK: - Pattern

  /// The mask pattern character.
  var pattern: AKMaskFieldPatternCharacter!

  /// Location of the pattern character in the mask.
  var patternRange: NSRange

  //  MARK: - Mask template

  /// The mask template character.
  var template: Character!

  /// Location of the mask template character in the mask template.
  var templateRange: NSRange
}
