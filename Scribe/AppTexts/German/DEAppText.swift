/**
 * The German app text for the Scribe app
 *
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

/// Formats and returns the title of the installation guidelines.
func getDEInstallationTitle(fontSize: CGFloat) -> NSMutableAttributedString {
  return NSMutableAttributedString(string: """
  Tastaturinstallation
  """, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize * 1.5)])
}

/// Formats and returns the directions of the installation guidelines.
func getDEInstallationDirections(fontSize: CGFloat) -> NSMutableAttributedString {
  let arrowString = getArrowIcon(fontSize: fontSize)
  let globeString = getGlobeIcon(fontSize: fontSize)

  let startOfBody = NSMutableAttributedString(string: """
  \n
  1.\u{0020}
  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  let settingsLink = addHyperLinks(
    originalText: "Einstellungen öffnen",
    links: ["Einstellungen öffnen": "<makeTextLink>"], // placeholder as there's a button over it
    fontSize: fontSize
  )

  let installStart = concatAttributedStrings(left: startOfBody, right: settingsLink)

  let installDirections = NSMutableAttributedString(string: """
  \n
  2. Gehen Sie im Allgemein wie folgt vor:

        Tastatur

  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  installDirections.addAttribute(
    NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize),
    range: NSRange(location: 18, length: "Allgemein".count)
  )
  installDirections.addAttribute(
    NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize),
    range: NSRange(location: 50, length: "Tastatur".count)
  )

  installDirections.append(NSAttributedString(string: "\n         "))

  installDirections.append(arrowString)

  let keyboardsStep = NSMutableAttributedString(string: """
  \u{0020} Tastaturen

  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  keyboardsStep.addAttribute(
    NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize),
    range: NSRange(location: 2, length: "Tastaturen".count)
  )

  installDirections.append(keyboardsStep)

  installDirections.append(NSMutableAttributedString(
    string: "\n                    ",
    attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]
  )
  )

  installDirections.append(arrowString)

  let finalSteps = NSMutableAttributedString(string: """
  \u{0020} Neue Tastatur hinzufügen

  3. Wählen Sie Scribe und aktivieren Sie Tastaturen

  4. Drücken Sie \u{0020}
  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  finalSteps.addAttribute(
    NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize),
    range: NSRange(location: 2, length: "Neue Tastatur hinzufügen".count)
  )
  finalSteps.addAttribute(
    NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize),
    range: NSRange(location: 42, length: "Scribe".count)
  )

  installDirections.append(finalSteps)

  installDirections.append(globeString)

  installDirections.append(NSMutableAttributedString(string: """
  , um Tastaturen auszuwählen
  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]))

  return concatAttributedStrings(left: installStart, right: installDirections)
}

/// Formats and returns the full text for the installation guidelines.
///
/// - Parameters
///  - fontSize: the size of the font derived for the app text given screen dimensions.
func setDEInstallation(fontSize: CGFloat) -> NSMutableAttributedString {
  let installTitle = getDEInstallationTitle(fontSize: fontSize)
  let installDirections = getDEInstallationDirections(fontSize: fontSize)

  return concatAttributedStrings(
    left: installTitle,
    right: installDirections
  )
}

/// Formats and returns the title of the GitHub information.
///
/// - Parameters
///  - fontSize: the size of the font derived for the app text given screen dimensions.
func getDEGitHubTitle(fontSize: CGFloat) -> NSMutableAttributedString {
  return NSMutableAttributedString(string: """
  Gemeinschaft
  """, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize * 1.5)])
}

/// Formats and returns the text of the GitHub information.
///
/// - Parameters
///  - fontSize: the size of the font derived for the app text given screen dimensions.
func getDEGitHubText(fontSize: CGFloat) -> NSMutableAttributedString {
  // Initialize the main body of the text.
  let ghInfoText = NSMutableAttributedString(string: """
  \n
  Scribe ist vollständig open-source. Um Probleme zu melden oder eine Kontribution zu leisten, besuchen Sie uns unter\u{0020}
  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  // A second NSAttributedString that includes a link to the GitHub.
  let ghLink = addHyperLinks(
    originalText: "github.com/scribe-org.",
    links: ["github.com/scribe-org": "https://github.com/scribe-org/Scribe-iOS"],
    fontSize: fontSize
  )

  return concatAttributedStrings(left: ghInfoText, right: ghLink)
}

/// Formats and returns the text for a notice about Scribe's GitHub.
///
/// - Parameters
///  - fontSize: the size of the font derived for the app text given screen dimensions.
func setDEGitHubText(fontSize: CGFloat) -> NSMutableAttributedString {
  let ghTextTitle = getDEGitHubTitle(fontSize: fontSize)
  let ghInfoTextAndLink = getDEGitHubText(fontSize: fontSize)

  return concatAttributedStrings(
    left: ghTextTitle,
    right: ghInfoTextAndLink
  )
}
