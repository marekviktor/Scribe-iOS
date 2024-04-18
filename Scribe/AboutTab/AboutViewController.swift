//
//  Copyright (C) 2023 Scribe
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

import UIKit
import MessageUI
import StoreKit

final class AboutViewController: BaseTableViewController {

  override var dataSet: [ParentTableCellModel] {
    AboutTableData.aboutTableData
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    title = NSLocalizedString("about.title", comment: "The title of the about tab")

    tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: AboutTableViewCell.reuseIdentifier)
  }
}

// MARK: UITableViewDataSource

extension AboutViewController {

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.reuseIdentifier, for: indexPath) as! AboutTableViewCell

    cell.configureCell(for: dataSet[indexPath.section].section[indexPath.row])

    return cell
  }
}

// MARK: UITableViewDelegate

extension AboutViewController {

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let tableSection = dataSet[indexPath.section]
    let section = tableSection.section[indexPath.row]

    switch section.sectionState {
    case .github:
      openURLString(urlString: "https://github.com/scribe-org/Scribe-iOS", withEncoding: false)

    case .matrix:
      openURLString(urlString: "https://matrix.to/#/#scribe_community:matrix.org", withEncoding: true)

    case .wikimedia:
      if let viewController = storyboard?.instantiateViewController(identifier: "InformationScreenVC") as? InformationScreenVC {
        navigationController?.pushViewController(viewController, animated: true)
        viewController.section = .wikimedia
      }

    case .shareScribe:
      showShareSheet()

    case .rateScribe:
      showRateScribeUI()

    case .bugReport:
      openURLString(urlString: "https://github.com/scribe-org/Scribe-iOS/issues", withEncoding: false)

    case .email:
      showEmailUI()

      //      case .appHints:
      //        // reset functionality
      //        print("Resets app hints")

    case .privacyPolicy:
      if let viewController = storyboard?.instantiateViewController(identifier: "InformationScreenVC") as? InformationScreenVC {
        navigationController?.pushViewController(viewController, animated: true)
        viewController.section = .privacyPolicy
      }

    case .licenses:
      if let viewController = storyboard?.instantiateViewController(identifier: "InformationScreenVC") as? InformationScreenVC {
        navigationController?.pushViewController(viewController, animated: true)
        viewController.section = .licenses
      }

    case .appLang: break
    case .none: break
    case .specificLang(_): break
    }


    if let selectedIndexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedIndexPath, animated: false)
    }
  }

  private func openURLString(urlString: String, withEncoding: Bool) {
    if withEncoding {
      let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      guard let encodedURLString = encodedString, let url = URL(string: encodedURLString) else { return }
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
      guard let url = URL(string: urlString) else { return }
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }

  private func showRateScribeUI() {
    if #available(iOS 14.0, *) {
      guard let scene = UIApplication.shared.foregroundActiveScene else { return }
      SKStoreReviewController.requestReview(in: scene)
    } else {
      let alert = UIAlertController(title: "Enjoying Scribe?", message: "Rate Scribe on the App Store.", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: openScribeAppStore(alert:)))
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      present(alert, animated: true)
    }
  }

  private func openScribeAppStore(alert _: UIAlertAction) {
    openURLString(urlString: "itms-apps: //itunes.apple.com/app/id1596613886", withEncoding: true)
  }

  private func showEmailUI() {
    if MFMailComposeViewController.canSendMail() {
      let mailComposeViewController = MFMailComposeViewController()
      mailComposeViewController.mailComposeDelegate = self
      mailComposeViewController.setToRecipients(["team@scri.be"])
      mailComposeViewController.setSubject("Hey Scribe!")

      present(mailComposeViewController, animated: true, completion: nil)
    } else {
      /// Show alert mentioning the email address
      let alert = UIAlertController(title: "Send us an email?", message: "Reach out to us at team@scri.be", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      present(alert, animated: true)
    }
  }

  private func showShareSheet() {
    let urlString = "itms-apps: //itunes.apple.com/app/id1596613886"
    let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    guard let encodedURLString = encodedString, let url = URL(string: encodedURLString) else { return }

    let shareSheetVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
    
    present(shareSheetVC, animated: true, completion: nil)
  }
}

// MARK: - MFMailComposeViewControllerDelegate

extension AboutViewController: MFMailComposeViewControllerDelegate {

  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith _: MFMailComposeResult, error _: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
}
