//
//  SymbolLists.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 08/06/2025.
//

import Foundation

@_documentation(visibility: internal)
class SymbolLists{
    public static let symbolSections: [SymbolSection] = [
        .init(
            title: "Maps",
            symbols: [
                .init(
                    symbolName: "car.fill",
                    description: "Symbol of a car",
                    symbolMinimumVersion: 1.1
                ),
                .init(
                    symbolName: "bus.fill",
                    description: "Symbol of a bus",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bus.doubledecker.fill",
                    description: "Symbol of a double-decker bus",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tram.fill",
                    description: "Symbol of a tram",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bicycle",
                    description: "Symbol of a bicycle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "motorcycle.fill",
                    description: "Symbol of a motorcycle",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "airplane",
                    description: "Symbol of an airplane",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "fuelpump.fill",
                    description: "Symbol of a fuel pump",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "binoculars.fill",
                    description: "Symbol of binoculars",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "mecca",
                    description: "Symbol of Mecca",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "map.fill",
                    description: "Symbol of a map",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "figure.walk",
                    description: "Symbol of a person walking",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "location.fill",
                    description: "Symbol of a location pin",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "mappin.and.ellipse",
                    description: "Symbol of a map pin with an ellipse",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "arrow.up.and.down.and.arrow.left.and.right",
                    description: "Symbol of arrows in all directions",
                    symbolMinimumVersion: 2.0
                ),
                .init( // To add older names
                    symbolName: "arrow.trianglehead.turn.up.right.diamond.fill",
                    description: "Symbol of a directional arrow with a triangle head",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "arrow.turn.up.right",
                    description: "Symbol of an upward right turn arrow",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "figure.wave",
                    description: "Symbol of a person waving",
                    symbolMinimumVersion: 2.0
                )
            ]
        ),
        .init(
            title: "Devices",
            symbols: [
                .init(
                    symbolName: "macpro.gen1.fill",
                    description: "Symbol of a Mac Pro Gen 1",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "macpro.gen2.fill",
                    description: "Symbol of a Mac Pro Gen 2",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "macpro.gen3.fill",
                    description: "Symbol of a Mac Pro Gen 3",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "macmini.fill",
                    description: "Symbol of a Mac mini",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "macstudio.fill",
                    description: "Symbol of a Mac Studio",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "applewatch",
                    description: "Symbol of an Apple Watch",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "macbook",
                    description: "Symbol of a MacBook",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "keyboard.fill",
                    description: "Symbol of a keyboard",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "printer.fill",
                    description: "Symbol of a printer",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "server.rack",
                    description: "Symbol of a server rack",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tv",
                    description: "Symbol of a TV",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "magsafe.batterypack.fill",
                    description: "Symbol of a MagSafe battery pack",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "cable.connector",
                    description: "Symbol of a cable connector",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "applepencil.gen2",
                    description: "Symbol of an Apple Pencil Gen 2",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "magicmouse.fill",
                    description: "Symbol of a Magic Mouse",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "hifireceiver.fill",
                    description: "Symbol of a HiFi receiver",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "headphones.over.ear",
                    description: "Symbol of a headphones",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "computermouse.fill",
                    description: "Symbol of a computer mouse",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "gamecontroller.fill",
                    description: "Symbol of a game controller",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "headphones",
                    description: "Symbol of headphones",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "earbuds.bone.conduction",
                    description: "Symbol of earbuds with bone conduction",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "externaldrive.fill",
                    description: "Symbol of an external drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "internaldrive.fill",
                    description: "Symbol of an internal drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "opticaldiscdrive.fill",
                    description: "Symbol of an optical disc drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hearingdevice.ear.fill",
                    description: "Symbol of a hearing device",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "earbuds.in.ear",
                    description: "Symbol of earbuds",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "hifispeaker.fill",
                    description: "Symbol of a HiFi speaker",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolNameFilledNotFilled: "tv.and.hifispeaker.fill",
                    description: "Symbol of a TV with a HiFi speaker",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "earpods",
                    description: "Symbol of earpods",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "airpods",
                    description: "Symbol of AirPods",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "airpods.gen3",
                    description: "Symbol of AirPods Gen 3",
                    symbolMinimumVersion: 3.2
                ),
                .init(
                    symbolName: "airpods.max",
                    description: "Symbol of AirPods Max",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "airpods.pro",
                    description: "Symbol of AirPods Pro",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "beats.headphones",
                    description: "Symbol of Beats headphones",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "beats.earphones",
                    description: "Symbol of Beats earphones",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "beats.powerbeats",
                    description: "Symbol of Powerbeats",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "beats.powerbeats3",
                    description: "Symbol of Powerbeats 3",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "beats.studiobuds",
                    description: "Symbol of Beats Studio Buds",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "beats.fitpro",
                    description: "Symbol of Beats Fit Pro",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "appletv.fill",
                    description: "Symbol of an Apple TV",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "homepod.fill",
                    description: "Symbol of a HomePod",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "homepod.mini.fill",
                    description: "Symbol of a HomePod mini",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "applewatch.radiowaves.left.and.right",
                    description: "Symbol of Apple Watch with radiowaves",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "flipphone",
                    description: "Symbol of a flip phone",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "iphone.gen1",
                    description: "Symbol of an iPhone with Home button",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "iphone.gen3",
                    description: "Symbol of an iPhone Gen 3",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "iphone.gen1.radiowaves.left.and.right",
                    description: "Symbol of an iPhone with Home button with radiowaves on sides",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "iphone.gen3.radiowaves.left.and.right",
                    description: "Symbol of an iPhone with Dynamic Island with radiowaves on sides",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "apps.iphone",
                    description: "Symbol of iPhone apps",
                    symbolMinimumVersion: 2.0
                
                ),
                .init(
                    symbolName: "ipad.gen1",
                    description: "Symbol of an iPad with Home button",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "ipad.gen2",
                    description: "Symbol of an iPad Gen 2",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "ipad.gen1.landscape",
                    description: "Symbol of an iPad with Home Button in landscape mode",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "ipad.gen2.landscape",
                    description: "Symbol of an Modern iPad in landscape mode",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "ipod",
                    description: "Symbol of an iPod",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "scanner.fill",
                    description: "Symbol of a scanner",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "applewatch.side.right",
                    description: "Symbol of an Apple Watch on the right side",
                    symbolMinimumVersion: 2.2
                ),
                .init(
                    symbolName: "mediastick",
                    description: "Symbol of a media stick",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "vision.pro",
                    description: "Symbol of a Vision Pro headset",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "arcade.stick.console.fill",
                    description: "Symbol of an arcade stick console",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Transport",
            symbols: [
                .init(
                    symbolName: "car.fill",
                    description: "Symbol of a car",
                    symbolMinimumVersion: 1.1
                ),
                .init(
                    symbolName: "airplane",
                    description: "Symbol of an airplane",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "bus.fill",
                    description: "Symbol of a bus",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bus.doubledecker.fill",
                    description: "Symbol of a double-decker bus",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tram.fill",
                    description: "Symbol of a tram",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tram.fill.tunnel",
                    description: "Symbol of a tram in a tunnel",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "cablecar.fill",
                    description: "Symbol of a cable car",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "lightrail.fill",
                    description: "Symbol of a light rail",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "ferry.fill",
                    description: "Symbol of a ferry",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "car.ferry.fill",
                    description: "Symbol of a car ferry",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "sailboat.fill",
                    description: "Symbol of a sailboat",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.walk",
                    description: "Symbol of a person walking",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "truck.box.fill",
                    description: "Symbol of a box truck",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "bicycle",
                    description: "Symbol of a bicycle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "motorcycle.fill",
                    description: "Symbol of a motorcycle",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "scooter",
                    description: "Symbol of a scooter",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "wheelchair",
                    description: "Symbol of a wheelchair",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "moped.fill",
                    description: "Symbol of a moped",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "ev.charger.fill",
                    description: "Symbol of an electric vehicle charger",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Automotive",
            symbols: [
                .init(
                    symbolName: "car.fill",
                    description: "Symbol of a car",
                    symbolMinimumVersion: 1.1
                ),
                .init(
                    symbolName: "car.side.fill",
                    description: "Symbol of a car from the side",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "bolt.car.fill",
                    description: "Symbol of a car with a bolt, possibly indicating electric",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "snowflake",
                    description: "Symbol of a snowflake, often representing cold",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "gauge.with.dots.needle.50percent",
                    description: "Symbol of a gauge with a needle at 50%",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "fan.fill",
                    description: "Symbol of a fan",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "fuelpump.fill",
                    description: "Symbol of a fuel pump",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "ev.charger.fill",
                    description: "Symbol of an electric vehicle charger",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "car.rear.fill",
                    description: "Symbol of the rear of a car",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "engine.combustion.fill",
                    description: "Symbol of a combustion engine",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "headlight.high.beam.fill",
                    description: "Symbol of high beam headlights",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "truck.pickup.side.fill",
                    description: "Symbol of a pickup truck from the side",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "tirepressure",
                    description: "Symbol of tire pressure",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "glowplug",
                    description: "Symbol of a glow plug, used in diesel engines",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "suv.side.fill",
                    description: "Symbol of an SUV from the side",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "windshield.front.and.wiper",
                    description: "Symbol of a front windshield with wipers",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "oilcan.fill",
                    description: "Symbol of an oil can",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "figure.seated.seatbelt",
                    description: "Symbol of a person seated with a seatbelt",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "convertible.side.fill",
                    description: "Symbol of a convertible car from the side",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "hazardsign",
                    description: "Symbol of a hazard sign",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "steeringwheel",
                    description: "Symbol of a steering wheel",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "tire",
                    description: "Symbol of a tire",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "suspension.shock",
                    description: "Symbol of a suspension shock absorber",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "batteryblock.fill",
                    description: "Symbol of a battery block",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "horn.fill",
                    description: "Symbol of a horn",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Health",
            symbols: [
                .init(
                    symbolName: "list.bullet.clipboard.fill",
                    description: "Symbol of a clipboard with bullet points",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "heart.fill",
                    description: "Symbol of a heart",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "thermometer.variable",
                    description: "Symbol of a variable thermometer",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "microbe.fill",
                    description: "Symbol of a microbe",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "cross.case.fill",
                    description: "Symbol of a medical case with a cross",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bed.double.fill",
                    description: "Symbol of a double bed",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lungs.fill",
                    description: "Symbol of lungs",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "apple.meditate",
                    description: "Symbol of meditation, possibly related to Apple health",
                    symbolMinimumVersion: 5.3
                ),
                .init(
                    symbolName: "pills.fill",
                    description: "Symbol of pills",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "brain.fill",
                    description: "Symbol of a brain",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "allergens.fill",
                    description: "Symbol of allergens",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "medical.thermometer.fill",
                    description: "Symbol of a medical thermometer",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "syringe.fill",
                    description: "Symbol of a syringe",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "stethoscope",
                    description: "Symbol of a stethoscope",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "inhaler.fill",
                    description: "Symbol of an inhaler",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "facemask.fill",
                    description: "Symbol of a face mask",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "pill.fill",
                    description: "Symbol of a pill",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "ivfluid.bag",
                    description: "Symbol of an IV fluid bag",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "cross.vial.fill",
                    description: "Symbol of a vial with a cross",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "staroflife.fill",
                    description: "Symbol of the Star of Life, used in EMS",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "heart.text.square.fill",
                    description: "Symbol of a heart with text in a square",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "ivfluid.bag.fill",
                    description: "Symbol of a IV fluid bag",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "eye.fill",
                    description: "Symbol of an eye",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "brain.head.profile.fill",
                    description: "Symbol of a brain with a head profile",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "ear.fill",
                    description: "Symbol of an ear",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "waveform.path.ecg",
                    description: "Symbol of an ECG waveform",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Objects & Tools",
            symbols: [
                .init(
                    symbolName: "pencil",
                    description: "Symbol of a pencil",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "eraser.fill",
                    description: "Symbol of an eraser",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "internaldrive",
                    description: "Symbol of an internal drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "square.and.pencil",
                    description: "Symbol of a pencil and square",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "opticaldiscdrive.fill",
                    description: "Symbol of an optical disc drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "pencil.and.scribble",
                    description: "Symbol of a pencil with a scribble",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "list.bullet.clipboard.fill",
                    description: "Symbol of a clipboard with bullet points",
                    symbolMinimumVersion: 4.0
                ),
                .init(symbolName: "chart.line.text.clipboard.fill",
                      description: "Symbol of a clipboard with chart and text",
                      symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "text.pad.header",
                    description: "Symbol of a text note",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "tray.full.fill",
                    description: "Symbol of a full tray",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "highlighter",
                    description: "Symbol of a highlighter",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "pencil.and.outline",
                    description: "Symbol of a pencil and outline",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "internaldrive.fill",
                    description: "Symbol of a internal drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "lasso",
                    description: "Symbol of a lasso",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hat.widebrim.fill",
                    description: "Symbol of a wide-brim hat",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "trash.fill",
                    description: "Symbol of a trash bin",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "oar.2.crossed",
                    description: "Symbol of two crossed oars",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "text.document",
                    description: "Symbol of a document",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "ruler.fill",
                    description: "Symbol of a ruler",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "folder.fill",
                    description: "Symbol of a folder",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "paperplane.fill",
                    description: "Symbol of a paper plane",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tray.fill",
                    description: "Symbol of a tray",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tray.2.fill",
                    description: "Symbol of a double tray",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "teddybear.fill",
                    description: "Symbol of a teddybear",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "newspaper.fill",
                    description: "Symbol of a newspaper",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "externaldrive.fill",
                    description: "Symbol of an external drive",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "archivebox.fill",
                    description: "Symbol of an archive box",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "document.fill",
                    description: "Symbol of a document",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "link",
                    description: "Symbol of a link",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "text.document.fill",
                    description: "Symbol of a text document",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "calendar",
                    description: "Symbol of a calendar",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "photo.artframe",
                    description: "Symbol of a framed photo",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "book.fill",
                    description: "Symbol of a book",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "crown.fill",
                    description: "Symbol of a crown",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "books.vertical.fill",
                    description: "Symbol of vertically stacked books",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "book.closed.fill",
                    description: "Symbol of a closed book",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "text.book.closed.fill",
                    description: "Symbol of a closed text book",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "character.book.closed.fill",
                    description: "Symbol of a closed character book",
                    symbolMinimumVersion: 2.1
                ),
                .init(
                    symbolName: "tshirt.fill",
                    description: "Symbol of a T-shirt",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "jacket.fill",
                    description: "Symbol of a jacket",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "shoe.fill",
                    description: "Symbol of a shoe",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "film.fill",
                    description: "Symbol of a film reel",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "flask.fill",
                    description: "Symbol of a flask",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "menucard.fill",
                    description: "Symbol of a menu card",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "magazine.fill",
                    description: "Symbol of a magazine",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "bookmark.fill",
                    description: "Symbol of a bookmark",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "graduationcap.fill",
                    description: "Symbol of a graduation cap",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "pencil.and.ruler.fill",
                    description: "Symbol of a pencil and ruler",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "backpack.fill",
                    description: "Symbol of a backpack",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "studentdesk",
                    description: "Symbol of a student desk",
                    symbolMinimumVersion: 1.1
                ),
                .init(
                    symbolName: "paperclip",
                    description: "Symbol of a paperclip",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lanyardcard.fill",
                    description: "Symbol of a lanyard with card",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "dumbbell.fill",
                    description: "Symbol of a dumbbell",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tennis.racket",
                    description: "Symbol of a tennis racket",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "rosette",
                    description: "Symbol of a rosette",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "duffle.bag.fill",
                    description: "Symbol of a duffle bag",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "medal.fill",
                    description: "Symbol of a medal",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fire.extinguisher.fill",
                    description: "Symbol of a fire extinguisher",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "beach.umbrella.fill",
                    description: "Symbol of a beach umbrella",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "umbrella.fill",
                    description: "Symbol of an umbrella",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "megaphone.fill",
                    description: "Symbol of a megaphone",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "speaker.wave.3.fill",
                    description: "Symbol of a speaker with sound waves",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "music.microphone",
                    description: "Symbol of a microphone",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "key.card.fill",
                    description: "Symbol of a key card",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "minus.plus.batteryblock.fill",
                    description: "Symbol of a battery block with plus and minus signs",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "magnifyingglass",
                    description: "Symbol of a magnifying glass",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "medal.star.fill",
                    description: "Symbol of a star-shaped medal",
                    symbolMinimumVersion: 5.3
                ),
                .init(
                    symbolName: "shield.fill",
                    description: "Symbol of a shield",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "staroflife.shield.fill",
                    description: "Symbol of a Star of Life on a shield",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "flag.pattern.checkered",
                    description: "Symbol of a checkered flag",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "bell.fill",
                    description: "Symbol of a bell",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tag.fill",
                    description: "Symbol of a tag",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bolt.shield.fill",
                    description: "Symbol of a shield with a bolt",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "medical.thermometer.fill",
                    description: "Symbol of a medical thermometer",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolNameFilledNotFilled: "flashlight.on.fill",
                    description: "Symbol of a flashlight turned on",
                    symbolMinimumVersion: 1.1
                ),
                .init(
                    symbolName: "camera.fill",
                    description: "Symbol of a camera",
                    symbolMinimumVersion: 1.0
                
                ),
                .init(
                    symbolName: "gear",
                    description: "Symbol of a gear",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "gearshape.2.fill",
                    description: "Symbol of a second gear shape",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "frying.pan.fill",
                    description: "Symbol of a frying pan",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "scissors",
                    description: "Symbol of a pair of scissors",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bag.fill",
                    description: "Symbol of a bag",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cart.fill",
                    description: "Symbol of a cart",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "horn.fill",
                    description: "Symbol of a horn",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "basket.fill",
                    description: "Symbol of a basket",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.beacon.max.fill",
                    description: "Symbol of a maximum intensity light beacon",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "creditcard.fill",
                    description: "Symbol of a credit card",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wallet.pass.fill",
                    description: "Symbol of a pass wallet",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "wallet.bifold.fill",
                    description: "Symbol of a bifold wallet",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "wand.and.sparkles",
                    description: "Symbol of a wand with sparkles",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "faxmachine.fill",
                    description: "Symbol of a fax machine",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "puzzlepiece.fill",
                    description: "Symbol of a puzzle piece",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "gyroscope",
                    description: "Symbol of a gyroscope",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "metronome.fill",
                    description: "Symbol of a metronome",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "amplifier",
                    description: "Symbol of an amplifier",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "dice.fill",
                    description: "Symbol of dice",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "pianokeys",
                    description: "Symbol of piano keys",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "suitcase.rolling.fill",
                    description: "Symbol of a rolling suitcase",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "radio.fill",
                    description: "Symbol of a radio",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tuningfork",
                    description: "Symbol of a tuning fork",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "printer.dotmatrix.fill",
                    description: "Symbol of a dot matrix printer",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "paintbrush.fill",
                    description: "Symbol of a paintbrush",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "paintbrush.pointed.fill",
                    description: "Symbol of a pointed paintbrush",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "poweroutlet.strip.fill",
                    description: "Symbol of a power outlet strip",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "level.fill",
                    description: "Symbol of a level",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "wrench.adjustable.fill",
                    description: "Symbol of an adjustable wrench",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "book.and.wrench.fill",
                    description: "Symbol of a book with a wrench",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "comb.fill",
                    description: "Symbol of a comb",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hammer.fill",
                    description: "Symbol of a hammer",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "screwdriver.fill",
                    description: "Symbol of a screwdriver",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "fossil.shell.fill",
                    description: "Symbol of a fossil shell",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "eyedropper.halffull",
                    description: "Symbol of an eyedropper half full",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "wrench.and.screwdriver.fill",
                    description: "Symbol of a wrench and screwdriver",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hifireceiver.fill",
                    description: "Symbol of a HiFi receiver",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "lifepreserver",
                    description: "Symbol of a life preserver",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "scroll.fill",
                    description: "Symbol of a scroll",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "printer.fill",
                    description: "Symbol of a printer",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "scanner.fill",
                    description: "Symbol of a scanner",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "handbag.fill",
                    description: "Symbol of a handbag",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "briefcase.fill",
                    description: "Symbol of a briefcase",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "balloon.2.fill",
                    description: "Symbol of two balloons",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "case.fill",
                    description: "Symbol of a case",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "latch.2.case.fill",
                    description: "Symbol of two latches on a case",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "globe.desk.fill",
                    description: "Symbol of a globe on a desk",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "cross.case.fill",
                    description: "Symbol of a case with a cross",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "guitars.fill",
                    description: "Symbol of guitars",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "drone.fill",
                    description: "Symbol of a drone",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "helmet.fill",
                    description: "Symbol of a helmet",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "stroller.fill",
                    description: "Symbol of a stroller",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "movieclapper.fill",
                    description: "Symbol of a movie clapper",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "suitcase.fill",
                    description: "Symbol of a suitcase",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "theatermasks.fill",
                    description: "Symbol of theater masks",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "theatermask.and.paintbrush.fill",
                    description: "Symbol of a theater mask with a paintbrush",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "popcorn.fill",
                    description: "Symbol of popcorn",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chair.fill",
                    description: "Symbol of a chair",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "cabinet.fill",
                    description: "Symbol of a cabinet",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tent.fill",
                    description: "Symbol of a tent",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "gift.fill",
                    description: "Symbol of a gift",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "house.lodge.fill",
                    description: "Symbol of a house or lodge",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "house.and.flag.fill",
                    description: "Symbol of a house with a flag",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "signpost.left.fill",
                    description: "Symbol of a left signpost",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "signpost.right.fill",
                    description: "Symbol of a right signpost",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "signpost.right.and.left.fill",
                    description: "Symbol of a signpost pointing right and left",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "building.2.fill",
                    description: "Symbol of a building",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "sunglasses.fill",
                    description: "Symbol of sunglasses",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "binoculars.fill",
                    description: "Symbol of binoculars",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "lock.fill",
                    description: "Symbol of a lock",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "key.fill",
                    description: "Symbol of a key",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "key.2.on.ring.fill",
                    description: "Symbol of two keys on a ring",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "cpu.fill",
                    description: "Symbol of a CPU",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "memorychip.fill",
                    description: "Symbol of a memory chip",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "opticaldisc.fill",
                    description: "Symbol of an optical disc",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "sensor.tag.radiowaves.forward.fill",
                    description: "Symbol of a sensor with radiowaves",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "watch.analog",
                    description: "Symbol of an analog watch",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "shippingbox.fill",
                    description: "Symbol of a shipping box",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "swatchpalette.fill",
                    description: "Symbol of a swatch palette",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "mug.fill",
                    description: "Symbol of a mug",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "wineglass.fill",
                    description: "Symbol of a wineglass",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "birthday.cake.fill",
                    description: "Symbol of a birthday cake",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "scalemass.fill",
                    description: "Symbol of a mass scale",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "simcard.fill",
                    description: "Symbol of a SIM card",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "sdcard.fill",
                    description: "Symbol of an SD card",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "waterbottle.fill",
                    description: "Symbol of a water bottle",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "cup.and.heat.waves.fill",
                    description: "Symbol of a cup with heat waves",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "esim.fill",
                    description: "Symbol of an eSIM",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "carrot.fill",
                    description: "Symbol of a carrot",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "battery.100percent",
                    description: "Symbol of a fully charged battery",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Gaming",
            symbols: [
                .init(
                    symbolName: "house.fill",
                    description: "Symbol of a house",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "gamecontroller.fill",
                    description: "Symbol of a game controller",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolNameFilledNotFilled: "flag.pattern.checkered",
                    description: "Symbol of a checkered flag",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "flag.2.crossed.fill",
                    description: "Symbol of two crossed flags",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "flag.pattern.checkered.2.crossed",
                    description: "Symbol of two crossed checkered flags",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "xmark",
                    description: "Symbol of an xmark",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "target",
                    description: "Symbol of a target",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "scope",
                    description: "Symbol of a scope",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "playstation.logo",
                    description: "Symbol of the PlayStation logo",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "xbox.logo",
                    description: "Symbol of the Xbox logo",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "arcade.stick.console.fill",
                    description: "Symbol of an arcade stick console",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "formfitting.gamecontroller.fill",
                    description: "Symbol of a form-fitting game controller",
                    symbolMinimumVersion: 6.0
                )
            ]
        ),
        .init(
            title: "Home",
            symbols: [
                .init(
                    symbolName: "house.fill",
                    description: "Symbol of a house",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "lightbulb.fill",
                    description: "Symbol of a lightbulb",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "lamp.desk.fill",
                    description: "Symbol of a desk lamp",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sink.fill",
                    description: "Symbol of a sink",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "washer.fill",
                    description: "Symbol of a washer",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fan.fill",
                    description: "Symbol of a fan",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "av.remote.fill",
                    description: "Symbol of an AV remote",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "humidifier.and.droplets.fill",
                    description: "Symbol of a humidifier with droplets",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "entry.lever.keypad.fill",
                    description: "Symbol of an entry lever keypad",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "poweroutlet.strip.fill",
                    description: "Symbol of a power outlet strip",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "roller.shade.closed",
                    description: "Symbol of a closed roller shade",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sensor.fill",
                    description: "Symbol of a sensor",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sofa.fill",
                    description: "Symbol of a sofa",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "robotic.vacuum.fill",
                    description: "Symbol of a robotic vacuum",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "cooktop.fill",
                    description: "Symbol of a cooktop",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chandelier.fill",
                    description: "Symbol of a chandelier",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "video.doorbell.fill",
                    description: "Symbol of a video doorbell",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fan.floor.fill",
                    description: "Symbol of a floor fan",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "shower.fill",
                    description: "Symbol of a shower",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fireplace.fill",
                    description: "Symbol of a fireplace",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chair.lounge.fill",
                    description: "Symbol of a lounge chair",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fan.ceiling.fill",
                    description: "Symbol of a ceiling fan",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolNameFilledNotFilled: "lamp.ceiling.inverse",
                    description: "Symbol of an inverse ceiling lamp",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "homekit",
                    description: "Symbol of HomeKit",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "dishwasher.fill",
                    description: "Symbol of a dishwasher",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "dryer.fill",
                    description: "Symbol of a dryer",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "pedestrian.gate.closed",
                    description: "Symbol of a closed pedestrian gate",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "shower.handheld.fill",
                    description: "Symbol of a handheld shower",
                    symbolMinimumVersion: 4.0
                
                ),
                .init(
                    symbolName: "light.cylindrical.ceiling.inverse",
                    description: "Symbol of an inverse cylindrical ceiling light",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.panel.fill",
                    description: "Symbol of a light panel",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "blinds.vertical.open",
                    description: "Symbol of open vertical blinds",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.recessed.inverse",
                    description: "Symbol of an inverse recessed light",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.recessed.3.inverse",
                    description: "Symbol of three inverse recessed lights",
                    symbolMinimumVersion: 4.0
                  ),
                .init(
                    symbolName: "lamp.floor.fill",
                    description: "Symbol of a floor lamp",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bathtub.fill",
                    description: "Symbol of a bathtub",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "oven.fill",
                    description: "Symbol of an oven",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "door.garage.closed",
                    description: "Symbol of a closed garage door",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chair.fill",
                    description: "Symbol of a chair",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "toilet.fill",
                    description: "Symbol of a toilet",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "microwave.fill",
                    description: "Symbol of a microwave",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "blinds.horizontal.open",
                    description: "Symbol of open horizontal blinds",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "lamp.table.fill",
                    description: "Symbol of a table lamp",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fan.and.light.ceiling.fill",
                    description: "Symbol of a ceiling fan and light",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "hifireceiver.fill",
                    description: "Symbol of a HiFi receiver",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.strip.2.fill",
                    description: "Symbol of two light strips",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "stove.fill",
                    description: "Symbol of a stove",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fan.desk.fill",
                    description: "Symbol of a desk fan",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "refrigerator.fill",
                    description: "Symbol of a refrigerator",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "light.beacon.max.fill",
                    description: "Symbol of a beacon light",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "videoprojector.fill",
                    description: "Symbol of a video projector",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "web.camera.fill",
                    description: "Symbol of a web camera",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "air.purifier.fill",
                    description: "Symbol of an air purifier",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "door.left.hand.closed",
                    description: "Symbol of a closed left-hand door",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "cabinet.fill",
                    description: "Symbol of a cabinet",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sprinkler.and.droplets.fill",
                    description: "Symbol of a sprinkler with droplets",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "spigot.fill",
                    description: "Symbol of a spigot",
                    symbolMinimumVersion: 4.0
                )
            ]
        ),
        .init(
            title: "Commerce",
            symbols: [
                .init(
                    symbolName: "creditcard.fill",
                    description: "Symbol of a credit card",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cart.fill",
                    description: "Symbol of a cart",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "basket.fill",
                    description: "Symbol of a basket",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bag.fill",
                    description: "Symbol of a bag",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "giftcard.fill",
                    description: "Symbol of a gift card",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "signature",
                    description: "Symbol of a signature",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "eurosign",
                    description: "Symbol of the Euro sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "centsign",
                    description: "Symbol of the cent sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chineseyuanrenminbisign",
                    description: "Symbol of the Chinese Yuan Renminbi sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "coloncurrencysign",
                    description: "Symbol of the Colon currency sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "dongsign",
                    description: "Symbol of the Dong sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "eurozonesign",
                    description: "Symbol of the Eurozone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "dollarsign",
                    description: "Symbol of the dollar sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bitcoinsign",
                    description: "Symbol of the Bitcoin sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "florinsign",
                    description: "Symbol of the Florin sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "francsign",
                    description: "Symbol of the Franc sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "indianrupeesign",
                    description: "Symbol of the Indian Rupee sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "guaranisign",
                    description: "Symbol of the Guarani sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "danishkronesign",
                    description: "Symbol of the Danish Krone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hryvniasign",
                    description: "Symbol of the Hryvnia sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "kipsign",
                    description: "Symbol of the Kip sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "larisign",
                    description: "Symbol of the Lari sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "peruviansolessign",
                    description: "Symbol of the Peruvian Soles sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "pesetasign",
                    description: "Symbol of the Peseta sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "polishzlotysign",
                    description: "Symbol of the Polish Zloty sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "rublesign",
                    description: "Symbol of the Ruble sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "shekelsign",
                    description: "Symbol of the Shekel sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "singaporedollarsign",
                    description: "Symbol of the Singapore Dollar sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "sterlingsign",
                    description: "Symbol of the Sterling sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tengesign",
                    description: "Symbol of the Tenge sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tugriksign",
                    description: "Symbol of the Tugrik sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "turkishlirasign",
                    description: "Symbol of the Turkish Lira sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "wonsign",
                    description: "Symbol of the Won sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "yensign",
                    description: "Symbol of the Yen sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "nairasign",
                    description: "Symbol of the Naira sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "norwegiankronesign",
                    description: "Symbol of the Norwegian Krone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "malaysianringgitsign",
                    description: "Symbol of the Malaysian Ringgit sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "lirasign",
                    description: "Symbol of the Lira sign",
                    symbolMinimumVersion: 4.0
                )
            ]
        ),
        .init(
            title: "Weather",
            symbols: [
                .init(
                    symbolName: "sun.max.fill",
                    description: "Symbol of a sun",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "sun.horizon.fill",
                    description: "Symbol of a sun on the horizon",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "sun.haze.fill",
                    description: "Symbol of a sun in haze",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "sun.rain.fill",
                    description: "Symbol of a sun with rain",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "sun.snow.fill",
                    description: "Symbol of a sun with snow",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "moon.fill",
                    description: "Symbol of a moon",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "moon.dust.fill",
                    description: "Symbol of a moon with dust",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "cloud.heavyrain.fill",
                    description: "Symbol of a cloud with heavy rain",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "moon.haze.fill",
                    description: "Symbol of a moon in haze",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sparkles",
                    description: "Symbol of sparkles",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "moon.stars.fill",
                    description: "Symbol of a moon with stars",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.fill",
                    description: "Symbol of a cloud",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.rain.fill",
                    description: "Symbol of a cloud with rain",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.hail.fill",
                    description: "Symbol of a cloud with hail",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.snow.fill",
                    description: "Symbol of a cloud with snow",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.bolt.rain.fill",
                    description: "Symbol of a cloud with bolt and rain",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.sun.fill",
                    description: "Symbol of a cloud with sun",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.sun.rain.fill",
                    description: "Symbol of a cloud with sun and rain",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cloud.moon.fill",
                    description: "Symbol of a cloud with moon",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "smoke.fill",
                    description: "Symbol of smoke",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wind",
                    description: "Symbol of wind",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "snowflake",
                    description: "Symbol of a snowflake",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "tornado",
                    description: "Symbol of a tornado",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hurricane",
                    description: "Symbol of a hurricane",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "thermometer.variable",
                    description: "Symbol of a variable thermometer",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "aqi.medium",
                    description: "Symbol of air quality index medium",
                    symbolMinimumVersion: 2.1
                ),
                .init(
                    symbolName: "rainbow",
                    description: "Symbol of a rainbow",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "cloud.rainbow.crop.fill",
                    description: "Symbol of a cloud with a cropped rainbow",
                    symbolMinimumVersion: 6.0
                )
            ]
        ),
        .init(
            title: "Nature",
            symbols: [
                .init(
                    symbolName: "carrot.fill",
                    description: "Symbol of a carrot",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "globe.americas.fill",
                    description: "Symbol of the Americas globe",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "sun.max.fill",
                    description: "Symbol of a sun with maximum brightness",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "bird.fill",
                    description: "Symbol of a bird",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "ant.fill",
                    description: "Symbol of an ant",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "leaf.fill",
                    description: "Symbol of a leaf",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "sun.dust.fill",
                    description: "Symbol of a sun in dust",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tropicalstorm",
                    description: "Symbol of a tropical storm",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lizard.fill",
                    description: "Symbol of a lizard",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "fossil.shell.fill",
                    description: "Symbol of a fossil shell",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "moonphase.waxing.crescent",
                    description: "Symbol of a waxing crescent moon phase",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "cloud.sleet.fill",
                    description: "Symbol of a cloud with sleet",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wind",
                    description: "Symbol of wind",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hurricane",
                    description: "Symbol of a hurricane",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "flame.fill",
                    description: "Symbol of a flame",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "water.waves",
                    description: "Symbol of water waves",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "ladybug.fill",
                    description: "Symbol of a ladybug",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "fish.fill",
                    description: "Symbol of a fish",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "drop.fill",
                    description: "Symbol of a drop",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bolt.fill",
                    description: "Symbol of a bolt",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "mountain.2.fill",
                    description: "Symbol of two mountains",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "dog.fill",
                    description: "Symbol of a dog",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "atom",
                    description: "Symbol of an atom",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "tree.fill",
                    description: "Symbol of a tree",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "cat.fill",
                    description: "Symbol of a cat",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "apple.meditate",
                    description: "Symbol of Apple meditate",
                    symbolMinimumVersion: 5.3
                )
            ]
        ),
        .init(
            title: "Human",
            symbols: [
                .init(
                    symbolName: "person.fill",
                    description: "Symbol of a person",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "shareplay",
                    description: "Symbol of SharePlay",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "person.2.fill",
                    description: "Symbol of two people",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "person.3.fill",
                    description: "Symbol of three people",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "person.bust.fill",
                    description: "Symbol of a person bust",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.stand",
                    description: "Symbol of a standing figure",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "figure.stand.dress",
                    description: "Symbol of a standing figure in a dress",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.arms.open",
                    description: "Symbol of a figure with open arms",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure",
                    description: "Symbol of a figure",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "figure.walk",
                    description: "Symbol of a walking figure",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "figure.fall",
                    description: "Symbol of a falling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.run",
                    description: "Symbol of a running figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "person.wave.2.fill",
                    description: "Symbol of two people waving",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "figure.roll",
                    description: "Symbol of a rolling figure",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "figure.yoga",
                    description: "Symbol of a yoga figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "nose.fill",
                    description: "Symbol of a nose",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "mustache.fill",
                    description: "Symbol of a mustache",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "mouth.fill",
                    description: "Symbol of a mouth",
                    symbolMinimumVersion: 2.0
                )
            ]
        ),
        .init(
            title: "Keyboard",
            symbols: [
                .init(
                    symbolName: "globe",
                    description: "Symbol of a globe",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "keyboard.fill",
                    description: "Symbol of a keyboard",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "command",
                    description: "Symbol of the command key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "control",
                    description: "Symbol of the control key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "eject.fill",
                    description: "Symbol of the eject key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "capslock.fill",
                    description: "Symbol of the caps lock key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "delete.left.fill",
                    description: "Symbol of the delete left key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "power",
                    description: "Symbol of the power key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "option",
                    description: "Symbol of the option key",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "alt",
                    description: "Symbol of the alt key",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Camera & Photos",
            symbols: [
                .init(
                    symbolName: "swirl.circle.righthalf.filled",
                    description: "Symbol of a right half filled swirl circle",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "circle.lefthalf.filled.righthalf.striped.horizontal",
                    description: "Symbol of a left half filled, right half horizontally stripecircle",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "circle.dotted.circle",
                    description: "Symbol of a dotted circle within a circle",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "inset.filled.pano",
                    description: "Symbol of a panorama",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "bolt.fill",
                    description: "Symbol of a bolt",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "camera.filters",
                    description: "Symbol of camera filters",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "livephoto",
                    description: "Symbol of Live Photo",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "spatial.capture",
                    description: "Symbol of a picture",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "camera.shutter.button.fill",
                    description: "Symbol of a camera shutter button",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "camera.fill",
                    description: "Symbol of a camera",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "camera.macro",
                    description: "Symbol of a macro camera",
                    symbolMinimumVersion: 3.3
                ),
                .init(
                    symbolName: "environments",
                    description: "Symbol of a two mountains",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "plus.viewfinder",
                    description: "Symbol of a plus viewfinder",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "camera.viewfinder",
                    description: "Symbol of a camera viewfinder",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "camera.aperture",
                    description: "Symbol of a camera aperture",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "f.cursive",
                    description: "Symbol of a cursive f",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "photo.fill",
                    description: "Symbol of a photo",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Communication",
            symbols: [
                .init(
                    symbolName: "microphone.fill",
                    description: "Symbol of a microphone",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "message.fill",
                    description: "Symbol of a message",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "checkmark.message.fill",
                    description: "Symbol of a checkmark message",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bubble.fill",
                    description: "Symbol of a bubble",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "exclamationmark.bubble.fill",
                    description: "Symbol of an exclamation mark bubble",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "phone.fill",
                    description: "Symbol of a phone",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "phone.down.fill",
                    description: "Symbol of a phone down",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "teletype",
                    description: "Symbol of a teletype",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tray.full.fill",
                    description: "Symbol of a full tray",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tray.2.fill",
                    description: "Symbol of two trays",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "video.fill",
                    description: "Symbol of a video",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "deskview.fill",
                    description: "Symbol of a desk view",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "envelope.front.fill",
                    description: "Symbol of a front envelope",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "envelope.fill",
                    description: "Symbol of an envelope",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "envelope.open.fill",
                    description: "Symbol of an open envelope",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "waveform",
                    description: "Symbol of a waveform",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "recordingtape",
                    description: "Symbol of a recording tape",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Media",
            symbols: [
                .init(
                    symbolName: "play.fill",
                    description: "Symbol of a play button",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "play.rectangle.fill",
                    description: "Symbol of a play rectangle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "pause.fill",
                    description: "Symbol of a pause button",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolNameFilledNotFilled: "apple.classical.pages.fill",
                    description: "Symbol of a violin key on a book cover",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "playpause.fill",
                    description: "Symbol of a play/pause button",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolNameFilledNotFilled: "person.spatialaudio.fill",
                    description: "Symbol demonstrating spatial audio settings",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "backward.fill",
                    description: "Symbol of a backward button",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "forward.fill",
                    description: "Symbol of a forward button",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "shuffle",
                    description: "Symbol of shuffle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "repeat",
                    description: "Symbol of repeat",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "arrow.trianglehead.clockwise",
                    description: "Symbol of a clockwise triangle arrow",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "infinity",
                    description: "Symbol of infinity",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "play.house.fill",
                    description: "Symbol of a play house",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Connectivity",
            symbols: [
                .init(
                    symbolName: "externaldrive.connected.to.line.below.fill",
                    description: "Symbol of an external drive connected to a line below",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "personalhotspot",
                    description: "Symbol of a personal hotspot",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "network",
                    description: "Symbol of a network",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "bolt.horizontal.fill",
                    description: "Symbol of a horizontal bolt",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "icloud.fill",
                    description: "Symbol of iCloud",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wifi",
                    description: "Symbol of WiFi",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "dot.radiowaves.left.and.right",
                    description: "Symbol of dot radiowaves left and right",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "cellularbars",
                    description: "Symbol of cellular bars",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bonjour",
                    description: "Symbol of Bonjour",
                    symbolMinimumVersion: 2.0
                )
            ]
        ),
        .init(
            title: "Fitness",
            symbols: [
                .init(
                    symbolName: "flame.fill",
                    description: "Symbol of a flame",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "dumbbell.fill",
                    description: "Symbol of a dumbbell",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sportscourt.fill",
                    description: "Symbol of a sports court",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "surfboard.fill",
                    description: "Symbol of a surfboard",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "duffle.bag.fill",
                    description: "Symbol of a duffle bag",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "soccerball",
                    description: "Symbol of a soccer ball",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "baseball.fill",
                    description: "Symbol of a baseball",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "trophy.fill",
                    description: "Symbol of a trophy",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "medal.fill",
                    description: "Symbol of a medal",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "basketball.fill",
                    description: "Symbol of a basketball",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "american.football.fill",
                    description: "Symbol of an American football",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "american.football.professional.fill",
                    description: "Symbol of a professional American football",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "rugbyball.fill",
                    description: "Symbol of a rugby ball",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "tennis.racket",
                    description: "Symbol of a tennis racket",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "hockey.puck.fill",
                    description: "Symbol of a hockey puck",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tennisball.fill",
                    description: "Symbol of a tennis ball",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "volleyball.fill",
                    description: "Symbol of a volleyball",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "skateboard.fill",
                    description: "Symbol of a skateboard",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "skis.fill",
                    description: "Symbol of skis",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "snowboard.fill",
                    description: "Symbol of a snowboard",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "figure.walk",
                    description: "Symbol of a walking figure",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "figure.walk.motion",
                    description: "Symbol of a walking figure in motion",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.run",
                    description: "Symbol of a running figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.run.treadmill",
                    description: "Symbol of a running figure on a treadmill",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.walk.treadmill",
                    description: "Symbol of a walking figure on a treadmill",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.roll",
                    description: "Symbol of a rolling figure",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "figure.american.football",
                    description: "Symbol of an American football figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.archery",
                    description: "Symbol of an archery figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.australian.football",
                    description: "Symbol of an Australian football figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.badminton",
                    description: "Symbol of a badminton figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.barre",
                    description: "Symbol of a barre figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.baseball",
                    description: "Symbol of a baseball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.basketball",
                    description: "Symbol of a basketball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.bowling",
                    description: "Symbol of a bowling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.boxing",
                    description: "Symbol of a boxing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.climbing",
                    description: "Symbol of a climbing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.cooldown",
                    description: "Symbol of a cooldown figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.core.training",
                    description: "Symbol of a core training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.cricket",
                    description: "Symbol of a cricket figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.skiing.crosscountry",
                    description: "Symbol of a cross-country skiing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.cross.training",
                    description: "Symbol of a cross-training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.curling",
                    description: "Symbol of a curling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.dance",
                    description: "Symbol of a dance figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.disc.sports",
                    description: "Symbol of a disc sports figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.skiing.downhill",
                    description: "Symbol of a downhill skiing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.elliptical",
                    description: "Symbol of an elliptical figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.equestrian.sports",
                    description: "Symbol of an equestrian sports figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.fencing",
                    description: "Symbol of a fencing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.fishing",
                    description: "Symbol of a fishing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.flexibility",
                    description: "Symbol of a flexibility figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.strengthtraining.functional",
                    description: "Symbol of a functional strength training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.golf",
                    description: "Symbol of a golf figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.gymnastics",
                    description: "Symbol of a gymnastics figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.hand.cycling",
                    description: "Symbol of a hand cycling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.handball",
                    description: "Symbol of a handball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.highintensity.intervaltraining",
                    description: "Symbol of a high-intensity interval training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.hiking",
                    description: "Symbol of a hiking figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.hockey",
                    description: "Symbol of a hockey figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.field.hockey",
                    description: "Symbol of a field hockey figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.ice.hockey",
                    description: "Symbol of an ice hockey figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.hunting",
                    description: "Symbol of a hunting figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.indoor.cycle",
                    description: "Symbol of an indoor cycle figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.jumprope",
                    description: "Symbol of a jump rope figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.kickboxing",
                    description: "Symbol of a kickboxing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.lacrosse",
                    description: "Symbol of a lacrosse figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.martial.arts",
                    description: "Symbol of a martial arts figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.mind.and.body",
                    description: "Symbol of a mind and body figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.mixed.cardio",
                    description: "Symbol of a mixed cardio figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.open.water.swim",
                    description: "Symbol of an open water swim figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.outdoor.cycle",
                    description: "Symbol of an outdoor cycle figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "oar.2.crossed",
                    description: "Symbol of two crossed oars",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.pickleball",
                    description: "Symbol of a pickleball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.pilates",
                    description: "Symbol of a Pilates figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.play",
                    description: "Symbol of a play figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.pool.swim",
                    description: "Symbol of a pool swim figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.racquetball",
                    description: "Symbol of a racquetball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.rolling",
                    description: "Symbol of a rolling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.indoor.rowing",
                    description: "Symbol of an indoor rowing figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.outdoor.rowing",
                    description: "Symbol of an outdoor rowing figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.rugby",
                    description: "Symbol of a rugby figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.sailing",
                    description: "Symbol of a sailing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.skateboarding",
                    description: "Symbol of a skateboarding figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.ice.skating",
                    description: "Symbol of an ice skating figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.snowboarding",
                    description: "Symbol of a snowboarding figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.indoor.soccer",
                    description: "Symbol of an indoor soccer figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.outdoor.soccer",
                    description: "Symbol of an outdoor soccer figure",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "figure.socialdance",
                    description: "Symbol of a social dance figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.softball",
                    description: "Symbol of a softball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.squash",
                    description: "Symbol of a squash figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.stair.stepper",
                    description: "Symbol of a stair stepper figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.stairs",
                    description: "Symbol of a stairs figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.step.training",
                    description: "Symbol of a step training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.surfing",
                    description: "Symbol of a surfing figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.table.tennis",
                    description: "Symbol of a table tennis figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.taichi",
                    description: "Symbol of a Tai Chi figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.tennis",
                    description: "Symbol of a tennis figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.track.and.field",
                    description: "Symbol of a track and field figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.strengthtraining.traditional",
                    description: "Symbol of a traditional strength training figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.volleyball",
                    description: "Symbol of a volleyball figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.water.fitness",
                    description: "Symbol of a water fitness figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.waterpolo",
                    description: "Symbol of a water polo figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.wrestling",
                    description: "Symbol of a wrestling figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.yoga",
                    description: "Symbol of a yoga figure",
                    symbolMinimumVersion: 4.0
                )
            ]
        ),
        .init(
            title: "Accessibility",
            symbols: [
                .init(
                    symbolName: "figure",
                    description: "Symbol of a figure",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hand.tap.fill",
                    description: "Symbol of a hand tap",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "wheelchair",
                    description: "Symbol of a wheelchair",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "apple.meditate",
                    description: "Symbol of Apple meditate",
                    symbolMinimumVersion: 5.3
                ),
                .init(
                    symbolName: "ear.fill",
                    description: "Symbol of an ear",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "quote.bubble.fill",
                    description: "Symbol of a quote bubble",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "plus.magnifyingglass",
                    description: "Symbol of a plus magnifying glass",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "tortoise.fill",
                    description: "Symbol of a tortoise",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "textformat.size",
                    description: "Symbol of text format size",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hand.point.up.fill",
                    description: "Symbol of a hand pointing up",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hearingdevice.ear.fill",
                    description: "Symbol of a hearing device ear",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "minus.magnifyingglass",
                    description: "Symbol of a minus magnifying glass",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "figure.stand.line.dotted.figure.stand",
                    description: "Symbol of a standing figure with a dotted line to another standing figure",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "figure.roll",
                    description: "Symbol of a rolling figure",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "character.magnify",
                    description: "Symbol of a character magnifying glass",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hare.fill",
                    description: "Symbol of a hare",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "pointer.arrow.motionlines",
                    description: "Symbol of a cursor arrow with motion lines",
                    symbolMinimumVersion: 7.0
                )
            ]
        ),
        .init(
            title: "Time",
            symbols: [
                .init(
                    symbolName: "clock.fill",
                    description: "Symbol of a clock",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "deskclock.fill",
                    description: "Symbol of a desk clock",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90",
                    description: "Symbol of a clock arrow counterclockwise rotated 90 degrees",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "alarm.fill",
                    description: "Symbol of an alarm",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "alarm.waves.left.and.right.fill",
                    description: "Symbol of an alarm with waves left and right",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "gauge.with.needle",
                    description: "Symbol of a gauge with a needle",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hourglass",
                    description: "Symbol of an hourglass",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "calendar",
                    description: "Symbol of a calendar",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "stopwatch.fill",
                    description: "Symbol of a stopwatch",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "timer",
                    description: "Symbol of a timer",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Privacy & Security",
            symbols: [
                .init(
                    symbolName: "lock.open.fill",
                    description: "Symbol of an open lock",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "nosign",
                    description: "Symbol of a no sign",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lock.shield.fill",
                    description: "Symbol of a lock shield",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "exclamationmark.shield.fill",
                    description: "Symbol of an exclamation mark shield",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "touchid",
                    description: "Symbol of Touch ID",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hand.raised.fill",
                    description: "Symbol of a raised hand",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "key.2.on.ring.fill",
                    description: "Symbol of two keys on a ring",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "checkmark",
                    description: "Symbol of a checkmark",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "xmark.shield.fill",
                    description: "Symbol of an xmark shield",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "opticid.fill",
                    description: "Symbol of an Optic ID",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "lock.fill",
                    description: "Symbol of a lock",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "key.horizontal.fill",
                    description: "Symbol of a horizontal key",
                    symbolMinimumVersion: 4.1
                ),
                .init(
                    symbolName: "firewall.fill",
                    description: "Symbol of a firewall",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "checkmark.seal.fill",
                    description: "Symbol of a checkmark seal",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "key.fill",
                    description: "Symbol of a key",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "xmark.seal.fill",
                    description: "Symbol of an xmark seal",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "faceid",
                    description: "Symbol of Face ID",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Editing",
            symbols: [
                .init(
                    symbolName: "pencil",
                    description: "Symbol of a pencil",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "eraser.fill",
                    description: "Symbol of an eraser",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "scribble.variable",
                    description: "Symbol of a variable scribble",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "highlighter",
                    description: "Symbol of a highlighter",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "pencil.tip",
                    description: "Symbol of a pencil tip",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lasso",
                    description: "Symbol of a lasso",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "beziercurve",
                    description: "Symbol of a Bezier curve",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "loupe",
                    description: "Symbol of a loupe",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "inset.filled.circle.dashed",
                    description: "Symbol of an inset filled dashed circle",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "scissors",
                    description: "Symbol of scissors",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wand.and.rays",
                    description: "Symbol of a wand and rays",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "wand.and.sparkles",
                    description: "Symbol of a wand and sparkles",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "crop",
                    description: "Symbol of crop",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "paintbrush.fill",
                    description: "Symbol of a paintbrush",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "paintbrush.pointed.fill",
                    description: "Symbol of a pointed paintbrush",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "eyedropper",
                    description: "Symbol of an eyedropper",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "move.3d",
                    description: "Symbol of 3D move",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "rotate.3d.fill",
                    description: "Symbol of 3D rotate",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "bandage.fill",
                    description: "Symbol of a bandage",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "trapezoid.and.line.vertical.fill",
                    description: "Symbol of a trapezoid and vertical line",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "trapezoid.and.line.horizontal.fill",
                    description: "Symbol of a trapezoid and horizontal line",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "camera.filters",
                    description: "Symbol of camera filters",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "skew",
                    description: "Symbol of skew",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "People",
            symbols: [
                .init(
                    symbolName: "hand.thumbsup.fill",
                    description: "Symbol of a thumbs up hand",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hand.thumbsdown.fill",
                    description: "Symbol of a thumbs down hand",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "person.fill",
                    description: "Symbol of a person",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "person.bust.fill",
                    description: "Symbol of a person bust",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "figure.run",
                    description: "Symbol of a running figure",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sunglasses.fill",
                    description: "Symbol of sunglasses",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hand.wave.fill",
                    description: "Symbol of a waving hand",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hand.point.left.fill",
                    description: "Symbol of a hand pointing left",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "hand.point.up.fill",
                    description: "Symbol of a hand pointing up",
                    symbolMinimumVersion: 2.0
                )
            ]
        ),
        .init(
            title: "Symbols",
            symbols: [
                .init(
                    symbolName: "square.2.layers.3d",
                    description: "Symbol of two 3D layered squares",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "barcode",
                    description: "Symbol of a barcode",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "qrcode",
                    description: "Symbol of a QR code",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "siri",
                    description: "Symbol of a Siri",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "finder",
                    description: "Symbol of a Finder",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "inset.filled.rectangle.and.person.filled",
                    description: "Symbol of an inset filled rectangle and filled person",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "square.and.arrow.down.fill",
                    description: "Symbol of a square and arrow down",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "square.and.arrow.up",
                    description: "Symbol of a square and arrow up",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "questionmark",
                    description: "Symbol of a question mark",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "info",
                    description: "Symbol of info",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "swift",
                    description: "Symbol of Swift",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "peacesign",
                    description: "Symbol of a peace sign",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "square.grid.2x2.fill",
                    description: "Symbol of a 2x2 grid square",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "ellipsis",
                    description: "Symbol of ellipsis",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "circle.dotted",
                    description: "Symbol of a dotted circle",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "checklist",
                    description: "Symbol of a checklist",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolNameFilledNotFilled: "square.grid.4x3.fill",
                    description: "Symbol of a 4x3 grid square",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "point.3.filled.connected.trianglepath.dotted",
                    description: "Symbol of three filled points connected by a dotted triangle path",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "rays",
                    description: "Symbol of rays",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "swiftdata",
                    description: "Symbol of SwiftData",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "timelapse",
                    description: "Symbol of timelapse",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "circle.circle",
                    description: "Symbol of a circle within a circle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "airplay.audio",
                    description: "Symbol of AirPlay audio",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "airplay.video",
                    description: "Symbol of AirPlay video",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "music.note",
                    description: "Symbol of a music note",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "music.note.list",
                    description: "Symbol of a music note list",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "qrcode.viewfinder",
                    description: "Symbol of a QR code viewfinder",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "plus.square.on.square.fill",
                    description: "Symbol of a plus square on a square",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "waveform.path",
                    description: "Symbol of a waveform path",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "richtext.page.fill",
                    description: "Symbol of a rich text page",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "text.page.fill",
                    description: "Symbol of a text page",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "append.page.fill",
                    description: "Symbol of an appended page",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "apple.terminal.fill",
                    description: "Symbol of a terminal",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "text.pad.header",
                    description: "Symbol of note text",
                    symbolMinimumVersion: 7.0
                ),
                .init(
                    symbolName: "document.fill",
                    description: "Symbol of a document",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "text.document.fill",
                    description: "Symbol of a text document",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "dock.rectangle",
                    description: "Symbol of a dock rectangle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "menubar.dock.rectangle",
                    description: "Symbol of a menubar dock rectangle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "ecg.text.page.fill",
                    description: "Symbol of an ECG text page",
                    symbolMinimumVersion: 6.1
                ),
                .init(
                    symbolName: "questionmark.text.page.fill",
                    description: "Symbol of a question mark text page",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "zipper.page",
                    description: "Symbol of a zipper page",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "person.text.rectangle.fill",
                    description: "Symbol of a person text rectangle",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "applescript.fill",
                    description: "Symbol of AppleScript",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "building.columns.fill",
                    description: "Symbol of building columns",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "sailboat.fill",
                    description: "Symbol of a sailboat",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "atom",
                    description: "Symbol of an atom",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "cable.connector",
                    description: "Symbol of a cable connector",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "audio.jack.stereo",
                    description: "Symbol of a stereo audio jack",
                    symbolMinimumVersion: 5.3
                ),
                .init(
                    symbolName: "applepencil.adapter.usb.c.fill",
                    description: "Symbol of an Apple Pencil USB-C adapter",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Arrows",
            symbols: [
                .init(
                    symbolName: "arrowshape.left.fill",
                    description: "Symbol of a left arrow shape",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "arrowshape.right.fill",
                    description: "Symbol of a right arrow shape",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "arrowshape.left.arrowshape.right.fill",
                    description: "Symbol of left and right arrow shapes",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "arrowshape.turn.up.left.fill",
                    description: "Symbol of a turn up left arrow shape",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "arrowshape.turn.up.right.fill",
                    description: "Symbol of a turn up right arrow shape",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "arrow.trianglehead.counterclockwise",
                    description: "Symbol of a counterclockwise triangle arrow",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "arrow.trianglehead.2.counterclockwise.rotate.90",
                    description: "Symbol of two counterclockwise triangle arrows rotated 90 degrees",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "arrow.trianglehead.topright.capsulepath.clockwise",
                    description: "Symbol of a clockwise triangle arrow with a capsule path",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "chevron.forward",
                    description: "Symbol of a forward chevron",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "chevron.backward",
                    description: "Symbol of a backward chevron",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "chevron.left.chevron.right",
                    description: "Symbol of left and right chevrons",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "arrow.down.left.arrow.up.right",
                    description: "Symbol of a down left and up right arrow",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left",
                    description: "Symbol of up left and down right, and up right and dowleft arrows",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "arrow.up.and.down.and.arrow.left.and.right",
                    description: "Symbol of up and down, and left and right arrows",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "arrow.3.trianglepath",
                    description: "Symbol of three triangle path arrows",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "arrow.2.squarepath",
                    description: "Symbol of two square path arrows",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "arrow.trianglehead.branch",
                    description: "Symbol of a triangle arrow branch",
                    symbolMinimumVersion: 6.0
                )
            ]
        ),
        .init(
            title: "Shapes",
            symbols: [
                .init(
                    symbolName: "circle.fill",
                    description: "Symbol of a circle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "app.fill",
                    description: "Symbol of an app",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "square.fill",
                    description: "Symbol of a square",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "rectangle.fill",
                    description: "Symbol of a rectangle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "rectangle.portrait.fill",
                    description: "Symbol of a portrait rectangle",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "capsule.fill",
                    description: "Symbol of a capsule",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "capsule.portrait.fill",
                    description: "Symbol of a portrait capsule",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "oval.fill",
                    description: "Symbol of an oval",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "oval.portrait.fill",
                    description: "Symbol of a portrait oval",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "triangle.fill",
                    description: "Symbol of a triangle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "triangleshape.fill",
                    description: "Symbol of a triangle shape",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolNameFilled: "rectangle.fill.on.rectangle.fill",
                    symbolNameNotFilled: "rectangle.on.rectangle",
                    description: "Symbol of a rectangle on a rectangle",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "diamond.fill",
                    description: "Symbol of a diamond",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "octagon.fill",
                    description: "Symbol of an octagon",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "hexagon.fill",
                    description: "Symbol of a hexagon",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "pentagon.fill",
                    description: "Symbol of a pentagon",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "seal.fill",
                    description: "Symbol of a seal",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "rhombus.fill",
                    description: "Symbol of a rhombus",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "shield.fill",
                    description: "Symbol of a shield",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "xmark.triangle.circle.square.fill",
                    description: "Symbol of an xmark, triangle, circle, square",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "viewfinder",
                    description: "Symbol of a viewfinder",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "button.horizontal.fill",
                    description: "Symbol of a horizontal button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.roundedtop.horizontal.fill",
                    description: "Symbol of a rounded top horizontal button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.roundedbottom.horizontal.fill",
                    description: "Symbol of a rounded bottom horizontal button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.angledtop.vertical.left.fill",
                    description: "Symbol of an angled top vertical left button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.angledtop.vertical.right.fill",
                    description: "Symbol of an angled top vertical right button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.angledbottom.horizontal.left.fill",
                    description: "Symbol of an angled bottom horizontal left button",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "button.angledbottom.horizontal.right.fill",
                    description: "Symbol of an angled bottom horizontal right button",
                    symbolMinimumVersion: 5.0
                )
            ]
        ),
        .init(
            title: "Maths",
            symbols: [
                .init(
                    symbolName: "x.squareroot",
                    description: "Symbol of x square root",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "angle",
                    description: "Symbol of an angle",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "compass.drawing",
                    description: "Symbol of a drawing compass",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "sum",
                    description: "Symbol of sum",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "percent",
                    description: "Symbol of percent",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "function",
                    description: "Symbol of function",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "plus",
                    description: "Symbol of plus",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "minus",
                    description: "Symbol of minus",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "plusminus",
                    description: "Symbol of plus minus",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "plus.forwardslash.minus",
                    description: "Symbol of plus forward slash minus",
                    symbolMinimumVersion: 3.0
                ),
                .init(
                    symbolName: "multiply",
                    description: "Symbol of multiply",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "divide",
                    description: "Symbol of divide",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "equal",
                    description: "Symbol of equal",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "notequal",
                    description: "Symbol of not equal",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "lessthan",
                    description: "Symbol of less than",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "lessthanorequalto",
                    description: "Symbol of less than or equal to",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "greaterthan",
                    description: "Symbol of greater than",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "greaterthanorequalto",
                    description: "Symbol of greater than or equal to",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "number",
                    description: "Symbol of number",
                    symbolMinimumVersion: 1.0
                )
            ]
        ),
        .init(
            title: "Indices",
            symbols: [
                .init(
                    symbolName: "eurosign",
                    description: "Symbol of the Euro sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "centsign",
                    description: "Symbol of the cent sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "chineseyuanrenminbisign",
                    description: "Symbol of the Chinese Yuan Renminbi sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "coloncurrencysign",
                    description: "Symbol of the Colon currency sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "dongsign",
                    description: "Symbol of the Dong sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "eurozonesign",
                    description: "Symbol of the Eurozone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "dollarsign",
                    description: "Symbol of the dollar sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "bitcoinsign",
                    description: "Symbol of the Bitcoin sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "florinsign",
                    description: "Symbol of the Florin sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "francsign",
                    description: "Symbol of the Franc sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "indianrupeesign",
                    description: "Symbol of the Indian Rupee sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "guaranisign",
                    description: "Symbol of the Guarani sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "danishkronesign",
                    description: "Symbol of the Danish Krone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "hryvniasign",
                    description: "Symbol of the Hryvnia sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "kipsign",
                    description: "Symbol of the Kip sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "larisign",
                    description: "Symbol of the Lari sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "peruviansolessign",
                    description: "Symbol of the Peruvian Soles sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "pesetasign",
                    description: "Symbol of the Peseta sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "polishzlotysign",
                    description: "Symbol of the Polish Zloty sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "rublesign",
                    description: "Symbol of the Ruble sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "shekelsign",
                    description: "Symbol of the Shekel sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "singaporedollarsign",
                    description: "Symbol of the Singapore Dollar sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "sterlingsign",
                    description: "Symbol of the Sterling sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tengesign",
                    description: "Symbol of the Tenge sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "tugriksign",
                    description: "Symbol of the Tugrik sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "turkishlirasign",
                    description: "Symbol of the Turkish Lira sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "wonsign",
                    description: "Symbol of the Won sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "yensign",
                    description: "Symbol of the Yen sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "nairasign",
                    description: "Symbol of the Naira sign",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "norwegiankronesign",
                    description: "Symbol of the Norwegian Krone sign",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "malaysianringgitsign",
                    description: "Symbol of the Malaysian Ringgit sign",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "lirasign",
                    description: "Symbol of the Lira sign",
                    symbolMinimumVersion: 4.0
                )
            ]
        ),
        .init(
            title: "Text Formatting",
            symbols: [
                .init(
                    symbolName: "fleuron.fill",
                    description: "Symbol of a fleuron",
                    symbolMinimumVersion: 4.0
                ),
                .init(
                    symbolName: "signature",
                    description: "Symbol of a signature",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "list.bullet",
                    description: "Symbol of a bullet list",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "numbers",
                    description: "Symbol of numbers",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "textformat.size",
                    description: "Symbol of text format size",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "textformat",
                    description: "Symbol of text format",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "textformat.superscript",
                    description: "Symbol of text format superscript",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "textformat.subscript",
                    description: "Symbol of text format subscript",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "characters.lowercase",
                    description: "Symbol of lowercase characters",
                    symbolMinimumVersion: 6.0
                ),
                .init(
                    symbolName: "characters.uppercase",
                    description: "Symbol of uppercase characters",
                    symbolMinimumVersion: 160
                ),
                .init(
                    symbolName: "bold.italic.underline",
                    description: "Symbol of bold italic underline",
                    symbolMinimumVersion: 1.0
                ),
                .init(
                    symbolName: "paragraphsign",
                    description: "Symbol of a paragraph sign",
                    symbolMinimumVersion: 2.0
                ),
                .init(
                    symbolName: "character.magnify",
                    description: "Symbol of character magnify",
                    symbolMinimumVersion: 5.0
                ),
                .init(
                    symbolName: "character.phonetic",
                    description: "Symbol of phonetic character",
                    symbolMinimumVersion: 4.0
                )
            ]
        )
    ]
    public static var allSymbols: Set<SymbolModel>{
        Set(symbolSections.reduce([]) { $0 + $1.symbols })
    }
}
