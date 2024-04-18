/**
 * Constants and functions to load the Spanish Scribe keyboard.
 *
 * Copyright (C) 2023 Scribe
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import UIKit

public enum SpanishKeyboardConstants {
  // iPhone keyboard layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"], // "undo"
  ]

  static let letterKeysPhoneDisableAccents = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"], // "undo"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"], // "undo"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"], // "undo"
  ]

  // iPad keyboard layouts.
  static let letterKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "+"],
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ", "return"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", ",", ".", "shift"],
    ["selectKeyboard", ".?123", "space", ".?123", "hideKeyboard"], // "undo"
  ]

  static let letterKeysPadDisableAccents = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "+"],
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "return"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", ",", ".", "shift"],
    ["selectKeyboard", ".?123", "space", ".?123", "hideKeyboard"], // "undo"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["@", "#", "$", "&", "*", "(", ")", "'", "\"", "+", "return"],
    ["#+=", "%", "_", "-", "=", "/", ";", ":", ",", ".", "#+="],
    ["selectKeyboard", "ABC", "space", "ABC", "hideKeyboard"], // "undo"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["€", "£", "¥", "^", "[", "]", "{", "}", "ᵒ", "ᵃ", "return"],
    ["123", "§", "|", "~", "¶", "\\", "<", ">", "¡", "¿", "123"],
    ["selectKeyboard", "ABC", "space", "ABC", "hideKeyboard"], // "undo"
  ]

  // Expanded iPad keyboard layouts for wider devices.
  static let letterKeysPadExpanded = [
    ["`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "'", "¿", "delete"],
    [SpecialKeys.indent, "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "'", "+", "*"],
    [SpecialKeys.capsLock, "a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ", "{", "}", "return"],
    ["shift", "|", "z", "x", "c", "v", "b", "n", "m", ",", ".", "-", "shift"],
    ["selectKeyboard", ".?123", "space", ".?123", "hideKeyboard"], // "microphone", "scribble"
  ]

  static let letterKeysPadExpandedDisableAccents = [
    ["`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "'", "¿", "delete"],
    [SpecialKeys.indent, "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "'", "+", "*"],
    [SpecialKeys.capsLock, "a", "s", "d", "f", "g", "h", "j", "k", "l", "{", "}", "return"],
    ["shift", "|", "z", "x", "c", "v", "b", "n", "m", ",", ".", "-", "shift"],
    ["selectKeyboard", ".?123", "space", ".?123", "hideKeyboard"], // "microphone", "scribble"
  ]

  static let symbolKeysPadExpanded = [
    ["`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "<", ">", "delete"],
    [SpecialKeys.indent, "[", "]", "{", "}", "#", "%", "^", "*", "+", "=", "\"", "|", "§"],
    [SpecialKeys.capsLock, "-", "/", ":", ";", "(", ")", "$", "&", "@", "£", "¥", "~", "return"], // "undo"
    ["shift", "...", ".", ",", "?", "!", "'", "\"", "_", "€", "shift"], // "redo"
    ["selectKeyboard", "ABC", "space", "ABC", "hideKeyboard"], // "microphone", "scribble"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "c", "d", "n", "s"]
  static let keysWithAlternatesLeft = ["a", "e", "c", "d", "s"]
  static let keysWithAlternatesRight = ["i", "o", "u", "n"]

  static let aAlternateKeys = ["á", "à", "ä", "â", "ã", "å", "ą", "æ", "ā", "ᵃ"]
  static let eAlternateKeys = ["é", "è", "ë", "ê", "ę", "ė", "ē"]
  static let iAlternateKeys = ["ī", "į", "î", "ì", "ï", "í"]
  static let oAlternateKeys = ["ᵒ", "ō", "œ", "ø", "õ", "ô", "ö", "ó", "ò"]
  static let uAlternateKeys = ["ū", "û", "ù", "ü", "ú"]
  static let cAlternateKeys = ["ç", "ć", "č"]
  static let dAlternateKeys = ["đ"]
  static let nAlternateKeys = ["ń"]
  static let nAlternateKeysDisableAccents = ["ń", "ñ"]
  static let sAlternateKeys = ["š"]
}

/// Gets the keys for the Spanish keyboard.
func getESKeys() {
  let userDefaults = UserDefaults(suiteName: "group.scribe.userDefaultsContainer")!

  if DeviceType.isPhone {
    if userDefaults.bool(forKey: "esAccentCharacters") {
      letterKeys = SpanishKeyboardConstants.letterKeysPhoneDisableAccents
    } else {
      letterKeys = SpanishKeyboardConstants.letterKeysPhone
    }
    numberKeys = SpanishKeyboardConstants.numberKeysPhone
    symbolKeys = SpanishKeyboardConstants.symbolKeysPhone
    allKeys = Array(letterKeys.joined()) + Array(numberKeys.joined()) + Array(symbolKeys.joined())

    leftKeyChars = ["q", "a", "1", "-", "[", "_"]
    if userDefaults.bool(forKey: "esAccentCharacters") {
      rightKeyChars = ["p", "l", "0", "\"", "=", "·"]
    } else {
      rightKeyChars = ["p", "ñ", "0", "\"", "=", "·"]
    }
    centralKeyChars = allKeys.filter { !leftKeyChars.contains($0) && !rightKeyChars.contains($0) }
  } else {
    // Use the expanded keys layout if the iPad is wide enough and has no home button.
    if usingExpandedKeyboard {
      if userDefaults.bool(forKey: "esAccentCharacters") {
        letterKeys = SpanishKeyboardConstants.letterKeysPadExpandedDisableAccents
      } else {
        letterKeys = SpanishKeyboardConstants.letterKeysPadExpanded
      }
      symbolKeys = SpanishKeyboardConstants.symbolKeysPadExpanded

      allKeys = Array(letterKeys.joined()) + Array(symbolKeys.joined())
    } else {
      if userDefaults.bool(forKey: "esAccentCharacters") {
        letterKeys = SpanishKeyboardConstants.letterKeysPadDisableAccents
      } else {
        letterKeys = SpanishKeyboardConstants.letterKeysPad
      }
      numberKeys = SpanishKeyboardConstants.numberKeysPad
      symbolKeys = SpanishKeyboardConstants.symbolKeysPad

      letterKeys.removeFirst(1)

      allKeys = Array(letterKeys.joined()) + Array(numberKeys.joined()) + Array(symbolKeys.joined())
    }

    leftKeyChars = ["q", "a", "1", "@", "€"]
    // TODO: add "p" to rightKeyChar if the keyboard has 4 rows.
    rightKeyChars = []
    centralKeyChars = allKeys.filter { !leftKeyChars.contains($0) && !rightKeyChars.contains($0) }
  }

  keysWithAlternates = SpanishKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = SpanishKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = SpanishKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = SpanishKeyboardConstants.aAlternateKeys
  eAlternateKeys = SpanishKeyboardConstants.eAlternateKeys
  iAlternateKeys = SpanishKeyboardConstants.iAlternateKeys
  oAlternateKeys = SpanishKeyboardConstants.oAlternateKeys
  uAlternateKeys = SpanishKeyboardConstants.uAlternateKeys
  sAlternateKeys = SpanishKeyboardConstants.sAlternateKeys
  dAlternateKeys = SpanishKeyboardConstants.dAlternateKeys
  cAlternateKeys = SpanishKeyboardConstants.cAlternateKeys

  if userDefaults.bool(forKey: "esAccentCharacters") {
    nAlternateKeys = SpanishKeyboardConstants.nAlternateKeysDisableAccents
  } else {
    nAlternateKeys = SpanishKeyboardConstants.nAlternateKeys
  }
}

/// Provides the Spanish keyboard layout.
func setESKeyboardLayout() {
  getESKeys()

  currencySymbol = "$"
  currencySymbolAlternates = dollarAlternateKeys
  spaceBar = "espacio"
  language = "Español"
  invalidCommandMsg = "No en Wikidata"
  baseAutosuggestions = ["el", "la", "no"]
  numericAutosuggestions = ["que", "de", "en"]
  verbsAfterPronounsArray = ["ser", "REFLEXIVE_PRONOUN", "no"]
  pronounAutosuggestionTenses = [
    "yo": "presFPS",
    "tú": "presSPS",
    "él": "presTPS",
    "ella": "presTPS",
    "nosotros": "presFPP",
    "nosotras": "presFPP",
    "vosotros": "presSPP",
    "vosotras": "presSPP",
    "ellos": "presTPP",
    "ellas": "presTPP",
    "ustedes": "presTPP",
  ]

  translateKeyLbl = "Traducir"
  translatePlaceholder = "Ingrese una palabra"
  translatePrompt = commandPromptSpacing + "es -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + commandCursor
  translatePromptAndPlaceholder = translatePromptAndCursor + " " + translatePlaceholder
  translatePromptAndColorPlaceholder = NSMutableAttributedString(string: translatePromptAndPlaceholder)
  translatePromptAndColorPlaceholder.setColorForText(textForAttribute: translatePlaceholder, withColor: UIColor(cgColor: commandBarBorderColor))

  conjugateKeyLbl = "Conjugar"
  conjugatePlaceholder = "Ingrese un verbo"
  conjugatePrompt = commandPromptSpacing + "Conjugar: "
  conjugatePromptAndCursor = conjugatePrompt + commandCursor
  conjugatePromptAndPlaceholder = conjugatePromptAndCursor + " " + conjugatePlaceholder
  conjugatePromptAndColorPlaceholder = NSMutableAttributedString(string: conjugatePromptAndPlaceholder)
  conjugatePromptAndColorPlaceholder.setColorForText(textForAttribute: conjugatePlaceholder, withColor: UIColor(cgColor: commandBarBorderColor))

  pluralKeyLbl = "Plural"
  pluralPlaceholder = "Ingrese un sustantivo"
  pluralPrompt = commandPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + commandCursor
  pluralPromptAndPlaceholder = pluralPromptAndCursor + " " + pluralPlaceholder
  pluralPromptAndColorPlaceholder = NSMutableAttributedString(string: pluralPromptAndPlaceholder)
  pluralPromptAndColorPlaceholder.setColorForText(textForAttribute: pluralPlaceholder, withColor: UIColor(cgColor: commandBarBorderColor))
  alreadyPluralMsg = "Ya en plural"
}
