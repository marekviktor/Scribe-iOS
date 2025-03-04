//
//  InterfaceVariables.swift
//
//  Variables associated with the base keyboard interface.
//

import UIKit

// A proxy into which text is typed.
var proxy: UITextDocumentProxy!

// MARK: Display Variables

// Variables for the keyboard and its appearance.
var keyboard = [[String]]()
var usingExpandedKeyboard = false
var allKeys = [String]()
let specialKeys = [
  SpecialKeys.indent, SpecialKeys.capsLock, "shift", "delete", "ABC", "АБВ", "123", "#+=", "selectKeyboard", "space", "return", ".?123", "hideKeyboard",
]
var allNonSpecialKeys = [String]()
var keyboardHeight: CGFloat!
var keyCornerRadius: CGFloat!
var commandKeyCornerRadius: CGFloat!
var keyWidth = CGFloat(0)
var letterKeyWidth = CGFloat(0)
var numSymKeyWidth = CGFloat(0)
var isFirstKeyboardLoad = false

// Keyboard elements.
var spaceBar = String()
var language = String()
var languageTextForSpaceBar: String {
  "\(language) (Scribe)"
}

var showKeyboardLanguage = false

// Arrays for the possible keyboard views that are loaded with their characters.
var letterKeys = [[String]]()
var numberKeys = [[String]]()
var symbolKeys = [[String]]()

/// States of the keyboard corresponding to layouts found in KeyboardConstants.swift.
enum KeyboardState {
  case letters
  case numbers
  case symbols
}

/// What the keyboard state is in regards to the shift key.
/// - normal: not capitalized
/// - shift: capitalized
enum ShiftButtonState {
  case normal
  case shift
}

/// What the keyboard state is in regards to the all caps key.
/// - normal: not capitalized
/// - locked: caps-lock
enum CapsLockButtonState {
  case normal
  case locked
}

/// States of the keyboard corresponding to which commands the user is executing.
enum CommandState {
  case idle
  case selectCommand
  case translate
  case conjugate
  case selectVerbConjugation
  case selectCaseDeclension
  case plural
  case alreadyPlural
  case invalid
  case displayInformation
}

/// States of the keyboard corresponding to which auto actions should be presented.
enum AutoActionState {
  case complete
  case suggest
}

/// States for which conjugation table view shift button should be active.
enum ConjViewShiftButtonsState {
  case bothActive
  case bothInactive
  case leftInactive
  case rightInactive
}

// Baseline state variables.
var keyboardState: KeyboardState = .letters
var shiftButtonState: ShiftButtonState = .normal
var capsLockButtonState: CapsLockButtonState = .normal
var commandState: CommandState = .idle
var autoActionState: AutoActionState = .suggest
var conjViewShiftButtonsState: ConjViewShiftButtonsState = .bothInactive

// Variables and functions to determine display parameters.
enum DeviceType {
  static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
  static let isPad = UIDevice.current.userInterfaceIdiom == .pad
}

var isLandscapeView = false

/// Checks if the device is in landscape mode.
func checkLandscapeMode() {
  if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
    isLandscapeView = true
  } else {
    isLandscapeView = false
  }
}

// Keyboard language variables.
var controllerLanguage = String()
var controllerLanguageAbbr = String()

// Dictionary for accessing language abbreviations.
let languagesAbbrDict = [
  "French": "fr",
  "German": "de",
  "Italian": "it",
  "Portuguese": "pt",
  "Russian": "ru",
  "Spanish": "es",
  "Swedish": "sv",
]

/// Returns the abbreviation of the language for use in commands.
func getControllerLanguageAbbr() -> String {
  guard let abbreviation = languagesAbbrDict[controllerLanguage] else {
    return ""
  }
  return abbreviation
}

// Dictionary for accessing keyboard abbreviations and layouts.
let keyboardLayoutDict: [String: () -> Void] = [
  // Layouts for French checked within setFRKeyboardLayout.
  "French": setFRKeyboardLayout,
  "German": setDEKeyboardLayout,
  "Italian": setITKeyboardLayout,
  "Portuguese": setPTKeyboardLayout,
  "Russian": setRUKeyboardLayout,
  "Spanish": setESKeyboardLayout,
  "Swedish": setSVKeyboardLayout,
]

/// Sets the keyboard layout and its alternate keys.
func setKeyboard() {
  setKeyboardLayout()
  setKeyboardAlternateKeys()
}

/// Sets the keyboard layouts given the chosen keyboard and device type.
func setKeyboardLayout() {
  if commandState == .translate {
    setENKeyboardLayout()
  } else {
    let setLayoutFxn: () -> Void = keyboardLayoutDict[controllerLanguage]!
    setLayoutFxn()
  }

  // Variable type is String.
  allPrompts = [translatePromptAndCursor, conjugatePromptAndCursor, pluralPromptAndCursor, translatePromptAndPlaceholder, conjugatePromptAndPlaceholder, pluralPromptAndPlaceholder]

  // Variable type is NSAttributedString.
  allColoredPrompts = [translatePromptAndColorPlaceholder, conjugatePromptAndColorPlaceholder, pluralPromptAndColorPlaceholder]
}

// Variables that define which keys are positioned on the very left, right or in the center of the keyboard.
// The purpose of these is to define which key pop up functions should be ran.
var centralKeyChars = [String]()
var leftKeyChars = [String]()
var rightKeyChars = [String]()

// Variables for call out positioning.
var horizStart = CGFloat(0)
var vertStart = CGFloat(0)
var widthMultiplier = CGFloat(0)
var maxHeightMultiplier = CGFloat(0)
var maxHeight = CGFloat(0)
var heightBeforeTopCurves = CGFloat(0)
var maxWidthCurveControl = CGFloat(0)
var maxHeightCurveControl = CGFloat(0)
var minHeightCurveControl = CGFloat(0)

var keyPopChar = UILabel()
var keyHoldPopChar = UILabel()
var keyPopLayer = CAShapeLayer()
var keyHoldPopLayer = CAShapeLayer()
