//
//  AKMaskFieldPatternCharacter.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 24.02.2021.
//
/// Single block character pattern constant.
enum AKMaskFieldPatternCharacter: String {

  //  MARK: - Constants

  case NumberDecimal = "d"
  case NonDecimal    = "D"
  case NonWord       = "W"
  case Alphabet      = "a"
  case AnyChar       = "."

  /// Returns regular expression pattern.
  func pattern() -> String {
    switch self {
    case .NumberDecimal   : return "\\d"
    case .NonDecimal      : return "\\D"
    case .NonWord         : return "\\W"
    case .Alphabet        : return "[a-zA-Z]"
    default               : return "."
    }
  }
}
