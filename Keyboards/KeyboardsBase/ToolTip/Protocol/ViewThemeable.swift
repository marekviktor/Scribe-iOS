/**
 * Controls the ViewThemeable protocol
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

protocol ViewThemeable {
  var backgroundColor: UIColor { get set }
  var textFont: UIFont? { get set }
  var textColor: UIColor? { get set }
  var textAlignment: NSTextAlignment? { get set }
  var cornerRadius: CGFloat? { get set }
  var masksToBounds: Bool? { get set }
  var maskedCorners: CACornerMask? { get set }
}
