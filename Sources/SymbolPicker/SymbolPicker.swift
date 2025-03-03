//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI

public struct SymbolPicker: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding public var symbolName: String
    @Binding public var colorValue: Color
    @State private var searchText = ""

    public var symbolDictionary: [String: [String:String]] = [
        "1_Maps": [
          "car.fill": "Symbol of a car",
          "bus.fill": "Symbol of a bus",
          "bus.doubledecker.fill": "Symbol of a double-decker bus",
          "tram.fill": "Symbol of a tram",
          "bicycle": "Symbol of a bicycle",
          "motorcycle.fill": "Symbol of a motorcycle",
          "airplane": "Symbol of an airplane",
          "fuelpump.fill": "Symbol of a fuel pump",
          "binoculars.fill": "Symbol of binoculars",
          "mecca": "Symbol of Mecca",
          "map.fill": "Symbol of a map",
          "figure.walk": "Symbol of a person walking",
          "location.fill": "Symbol of a location pin",
          "mappin.and.ellipse": "Symbol of a map pin with an ellipse",
          "arrow.up.and.down.and.arrow.left.and.right": "Symbol of arrows in all directions",
          "arrow.trianglehead.turn.up.right.diamond.fill": "Symbol of a directional arrow with a triangle head",
          "arrow.turn.up.right": "Symbol of an upward right turn arrow",
          "figure.wave": "Symbol of a person waving"
        ],
        "2_Devices": [
          "macpro.gen1.fill": "Symbol of a Mac Pro Gen 1",
          "macpro.gen2.fill": "Symbol of a Mac Pro Gen 2",
          "macpro.gen3.fill": "Symbol of a Mac Pro Gen 3",
          "macmini.fill": "Symbol of a Mac mini",
          "macstudio.fill": "Symbol of a Mac Studio",
          "applewatch": "Symbol of an Apple Watch",
          "macbook": "Symbol of a MacBook",
          "keyboard.fill": "Symbol of a keyboard",
          "printer.fill": "Symbol of a printer",
          "server.rack": "Symbol of a server rack",
          "tv": "Symbol of a TV",
          "magsafe.batterypack.fill": "Symbol of a MagSafe battery pack",
          "cable.connector": "Symbol of a cable connector",
          "applepencil.gen2": "Symbol of an Apple Pencil Gen 2",
          "magicmouse.fill": "Symbol of a Magic Mouse",
          "computermouse.fill": "Symbol of a computer mouse",
          "gamecontroller.fill": "Symbol of a game controller",
          "headphones": "Symbol of headphones",
          "externaldrive.fill": "Symbol of an external drive",
          "internaldrive.fill": "Symbol of an internal drive",
          "opticaldiscdrive.fill": "Symbol of an optical disc drive",
          "hearingdevice.ear.fill": "Symbol of a hearing device",
          "hifispeaker.fill": "Symbol of a HiFi speaker",
          "tv.and.hifispeaker.fill": "Symbol of a TV with a HiFi speaker",
          "earpods": "Symbol of earpods",
          "airpods": "Symbol of AirPods",
          "airpods.gen3": "Symbol of AirPods Gen 3",
          "airpods.max": "Symbol of AirPods Max",
          "airpods.pro": "Symbol of AirPods Pro",
          "beats.headphones": "Symbol of Beats headphones",
          "beats.earphones": "Symbol of Beats earphones",
          "beats.powerbeats": "Symbol of Powerbeats",
          "beats.powerbeats3": "Symbol of Powerbeats 3",
          "beats.studiobuds": "Symbol of Beats Studio Buds",
          "beats.fitpro": "Symbol of Beats Fit Pro",
          "appletv.fill": "Symbol of an Apple TV",
          "homepod.fill": "Symbol of a HomePod",
          "homepod.mini.fill": "Symbol of a HomePod mini",
          "applewatch.radiowaves.left.and.right": "Symbol of Apple Watch with radiowaves",
          "flipphone": "Symbol of a flip phone",
          "iphone.gen1": "Symbol of an iPhone with Home button",
          "iphone.gen3": "Symbol of an iPhone Gen 3",
          "iphone.gen1.radiowaves.left.and.right": "Symbol of an iPhone with Home button with radiowaves on sides",
          "iphone.gen3.radiowaves.left.and.right": "Symbol of an iPhone with Dynamic Island with radiowaves on sides",
          "apps.iphone": "Symbol of iPhone apps",
          "ipad.gen1": "Symbol of an iPad with Home button",
          "ipad.gen2": "Symbol of an iPad Gen 2",
          "ipad.gen1.landscape": "Symbol of an iPad with Home Button in landscape mode",
          "ipad.gen2.landscape": "Symbol of an Modern iPad in landscape mode",
          "ipod": "Symbol of an iPod",
          "scanner.fill": "Symbol of a scanner",
          "applewatch.side.right": "Symbol of an Apple Watch on the right side",
          "mediastick": "Symbol of a media stick",
          "vision.pro": "Symbol of a Vision Pro headset",
          "arcade.stick.console.fill": "Symbol of an arcade stick console"
        ],
        "3_Transport": [
          "car.fill": "Symbol of a car",
          "airplane": "Symbol of an airplane",
          "bus.fill": "Symbol of a bus",
          "bus.doubledecker.fill": "Symbol of a double-decker bus",
          "tram.fill": "Symbol of a tram",
          "tram.fill.tunnel": "Symbol of a tram in a tunnel",
          "cablecar.fill": "Symbol of a cable car",
          "lightrail.fill": "Symbol of a light rail",
          "ferry.fill": "Symbol of a ferry",
          "car.ferry.fill": "Symbol of a car ferry",
          "sailboat.fill": "Symbol of a sailboat",
          "figure.walk": "Symbol of a person walking",
          "truck.box.fill": "Symbol of a box truck",
          "bicycle": "Symbol of a bicycle",
          "motorcycle.fill": "Symbol of a motorcycle",
          "scooter": "Symbol of a scooter",
          "wheelchair": "Symbol of a wheelchair",
          "moped.fill": "Symbol of a moped",
          "ev.charger.fill": "Symbol of an electric vehicle charger"
        ],
        "4_Automotive": [
          "car.fill": "Symbol of a car",
          "car.side.fill": "Symbol of a car from the side",
          "bolt.car.fill": "Symbol of a car with a bolt, possibly indicating electric",
          "snowflake": "Symbol of a snowflake, often representing cold",
          "gauge.with.dots.needle.50percent": "Symbol of a gauge with a needle at 50%",
          "fan.fill": "Symbol of a fan",
          "fuelpump.fill": "Symbol of a fuel pump",
          "ev.charger.fill": "Symbol of an electric vehicle charger",
          "car.rear.fill": "Symbol of the rear of a car",
          "engine.combustion.fill": "Symbol of a combustion engine",
          "headlight.high.beam.fill": "Symbol of high beam headlights",
          "truck.pickup.side.fill": "Symbol of a pickup truck from the side",
          "tirepressure": "Symbol of tire pressure",
          "glowplug": "Symbol of a glow plug, used in diesel engines",
          "suv.side.fill": "Symbol of an SUV from the side",
          "windshield.front.and.wiper": "Symbol of a front windshield with wipers",
          "oilcan.fill": "Symbol of an oil can",
          "figure.seated.seatbelt": "Symbol of a person seated with a seatbelt",
          "convertible.side.fill": "Symbol of a convertible car from the side",
          "hazardsign": "Symbol of a hazard sign",
          "steeringwheel": "Symbol of a steering wheel",
          "tire": "Symbol of a tire",
          "suspension.shock": "Symbol of a suspension shock absorber",
          "batteryblock.fill": "Symbol of a battery block",
          "horn.fill": "Symbol of a horn"
        ],
        "5_Health": [
          "list.bullet.clipboard.fill": "Symbol of a clipboard with bullet points",
          "heart.fill": "Symbol of a heart",
          "thermometer.variable": "Symbol of a variable thermometer",
          "microbe.fill": "Symbol of a microbe",
          "cross.case.fill": "Symbol of a medical case with a cross",
          "bed.double.fill": "Symbol of a double bed",
          "lungs.fill": "Symbol of lungs",
          "apple.meditate": "Symbol of meditation, possibly related to Apple health",
          "pills.fill": "Symbol of pills",
          "brain.fill": "Symbol of a brain",
          "allergens.fill": "Symbol of allergens",
          "medical.thermometer.fill": "Symbol of a medical thermometer",
          "syringe.fill": "Symbol of a syringe",
          "stethoscope": "Symbol of a stethoscope",
          "inhaler.fill": "Symbol of an inhaler",
          "facemask.fill": "Symbol of a face mask",
          "pill.fill": "Symbol of a pill",
          "ivfluid.bag": "Symbol of an IV fluid bag",
          "cross.vial.fill": "Symbol of a vial with a cross",
          "staroflife.fill": "Symbol of the Star of Life, used in EMS",
          "heart.text.square.fill": "Symbol of a heart with text in a square",
          "ivfluid.bag.fill": "Symbol of a IV fluid bag",
          "eye.fill": "Symbol of an eye",
          "brain.head.profile.fill": "Symbol of a brain with a head profile",
          "ear.fill": "Symbol of an ear",
          "waveform.path.ecg": "Symbol of an ECG waveform"
        ],
        "6_Objects & Tools": [
          "pencil": "Symbol of a pencil",
          "eraser.fill": "Symbol of an eraser",
          "internaldrive": "Symbol of an internal drive",
          "square.and.pencil": "Symbol of a pencil and square",
          "opticaldiscdrive.fill": "Symbol of an optical disc drive",
          "pencil.and.scribble": "Symbol of a pencil with a scribble",
          "list.bullet.clipboard.fill": "Symbol of a clipboard with bullet points",
          "chart.line.text.clipboard.fill": "Symbol of a clipboard with chart and text",
          "note.text": "Symbol of a text note",
          "tray.full.fill": "Symbol of a full tray",
          "highlighter": "Symbol of a highlighter",
          "pencil.and.outline": "Symbol of a pencil and outline",
          "internaldrive.fill": "Symbol of a internal drive",
          "lasso": "Symbol of a lasso",
          "hat.widebrim.fill": "Symbol of a wide-brim hat",
          "trash.fill": "Symbol of a trash bin",
          "oar.2.crossed": "Symbol of two crossed oars",
          "text.document": "Symbol of a document",
          "ruler.fill": "Symbol of a ruler",
          "folder.fill": "Symbol of a folder",
          "paperplane.fill": "Symbol of a paper plane",
          "tray.fill": "Symbol of a tray",
          "tray.2.fill": "Symbol of a double tray",
          "teddybear.fill": "Symbol of a teddybear",
          "newspaper.fill": "Symbol of a newspaper",
          "externaldrive.fill": "Symbol of an external drive",
          "archivebox.fill": "Symbol of an archive box",
          "document.fill": "Symbol of a document",
          "link": "Symbol of a link",
          "text.document.fill": "Symbol of a text document",
          "calendar": "Symbol of a calendar",
          "photo.artframe": "Symbol of a framed photo",
          "book.fill": "Symbol of a book",
          "crown.fill": "Symbol of a crown",
          "books.vertical.fill": "Symbol of vertically stacked books",
          "book.closed.fill": "Symbol of a closed book",
          "text.book.closed.fill": "Symbol of a closed text book",
          "character.book.closed.fill": "Symbol of a closed character book",
          "tshirt.fill": "Symbol of a T-shirt",
          "jacket.fill": "Symbol of a jacket",
          "shoe.fill": "Symbol of a shoe",
          "film.fill": "Symbol of a film reel",
          "flask.fill": "Symbol of a flask",
          "menucard.fill": "Symbol of a menu card",
          "magazine.fill": "Symbol of a magazine",
          "bookmark.fill": "Symbol of a bookmark",
          "graduationcap.fill": "Symbol of a graduation cap",
          "pencil.and.ruler.fill": "Symbol of a pencil and ruler",
          "backpack.fill": "Symbol of a backpack",
          "studentdesk": "Symbol of a student desk",
          "paperclip": "Symbol of a paperclip",
          "lanyardcard.fill": "Symbol of a lanyard with card",
          "dumbbell.fill": "Symbol of a dumbbell",
          "tennis.racket": "Symbol of a tennis racket",
          "rosette": "Symbol of a rosette",
          "duffle.bag.fill": "Symbol of a duffle bag",
          "medal.fill": "Symbol of a medal",
          "fire.extinguisher.fill": "Symbol of a fire extinguisher",
          "beach.umbrella.fill": "Symbol of a beach umbrella",
          "umbrella.fill": "Symbol of an umbrella",
          "megaphone.fill": "Symbol of a megaphone",
          "speaker.wave.3.fill": "Symbol of a speaker with sound waves",
          "music.microphone": "Symbol of a microphone",
          "key.card.fill": "Symbol of a key card",
          "minus.plus.batteryblock.fill": "Symbol of a battery block with plus and minus signs",
          "magnifyingglass": "Symbol of a magnifying glass",
          "medal.star.fill": "Symbol of a star-shaped medal",
          "shield.fill": "Symbol of a shield",
          "staroflife.shield.fill": "Symbol of a Star of Life on a shield",
          "flag.pattern.checkered": "Symbol of a checkered flag",
          "bell.fill": "Symbol of a bell",
          "tag.fill": "Symbol of a tag",
          "bolt.shield.fill": "Symbol of a shield with a bolt",
          "medical.thermometer.fill": "Symbol of a medical thermometer",
          "flashlight.on.fill": "Symbol of a flashlight turned on",
          "camera.fill": "Symbol of a camera",
          "gear": "Symbol of a gear",
          "gearshape.2.fill": "Symbol of a second gear shape",
          "frying.pan.fill": "Symbol of a frying pan",
          "scissors": "Symbol of a pair of scissors",
          "bag.fill": "Symbol of a bag",
          "cart.fill": "Symbol of a cart",
          "horn.fill": "Symbol of a horn",
          "basket.fill": "Symbol of a basket",
          "light.beacon.max.fill": "Symbol of a maximum intensity light beacon",
          "creditcard.fill": "Symbol of a credit card",
          "wallet.pass.fill": "Symbol of a pass wallet",
          "wallet.bifold.fill": "Symbol of a bifold wallet",
          "wand.and.sparkles": "Symbol of a wand with sparkles",
          "faxmachine.fill": "Symbol of a fax machine",
          "puzzlepiece.fill": "Symbol of a puzzle piece",
          "gyroscope": "Symbol of a gyroscope",
          "metronome.fill": "Symbol of a metronome",
          "amplifier": "Symbol of an amplifier",
          "dice.fill": "Symbol of dice",
          "pianokeys": "Symbol of piano keys",
          "suitcase.rolling.fill": "Symbol of a rolling suitcase",
          "radio.fill": "Symbol of a radio",
          "tuningfork": "Symbol of a tuning fork",
          "printer.dotmatrix.fill": "Symbol of a dot matrix printer",
          "paintbrush.fill": "Symbol of a paintbrush",
          "paintbrush.pointed.fill": "Symbol of a pointed paintbrush",
          "poweroutlet.strip.fill": "Symbol of a power outlet strip",
          "level.fill": "Symbol of a level",
          "wrench.adjustable.fill": "Symbol of an adjustable wrench",
          "book.and.wrench.fill": "Symbol of a book with a wrench",
          "comb.fill": "Symbol of a comb",
          "hammer.fill": "Symbol of a hammer",
          "screwdriver.fill": "Symbol of a screwdriver",
          "fossil.shell.fill": "Symbol of a fossil shell",
          "eyedropper.halffull": "Symbol of an eyedropper half full",
          "wrench.and.screwdriver.fill": "Symbol of a wrench and screwdriver",
          "hifireceiver.fill": "Symbol of a HiFi receiver",
          "lifepreserver": "Symbol of a life preserver",
          "scroll.fill": "Symbol of a scroll",
          "printer.fill": "Symbol of a printer",
          "scanner.fill": "Symbol of a scanner",
          "handbag.fill": "Symbol of a handbag",
          "briefcase.fill": "Symbol of a briefcase",
          "balloon.2.fill": "Symbol of two balloons",
          "case.fill": "Symbol of a case",
          "latch.2.case.fill": "Symbol of two latches on a case",
          "globe.desk.fill": "Symbol of a globe on a desk",
          "cross.case.fill": "Symbol of a case with a cross",
          "guitars.fill": "Symbol of guitars",
          "drone.fill": "Symbol of a drone",
          "helmet.fill": "Symbol of a helmet",
          "stroller.fill": "Symbol of a stroller",
          "movieclapper.fill": "Symbol of a movie clapper",
          "suitcase.fill": "Symbol of a suitcase",
          "theatermasks.fill": "Symbol of theater masks",
          "theatermask.and.paintbrush.fill": "Symbol of a theater mask with a paintbrush",
          "popcorn.fill": "Symbol of popcorn",
          "chair.fill": "Symbol of a chair",
          "cabinet.fill": "Symbol of a cabinet",
          "tent.fill": "Symbol of a tent",
          "gift.fill": "Symbol of a gift",
          "house.lodge.fill": "Symbol of a house or lodge",
          "house.and.flag.fill": "Symbol of a house with a flag",
          "signpost.left.fill": "Symbol of a left signpost",
          "signpost.right.fill": "Symbol of a right signpost",
          "signpost.right.and.left.fill": "Symbol of a signpost pointing right and left",
          "building.2.fill": "Symbol of a building",
          "sunglasses.fill": "Symbol of sunglasses",
          "binoculars.fill": "Symbol of binoculars",
          "lock.fill": "Symbol of a lock",
          "key.fill": "Symbol of a key",
          "key.2.on.ring.fill": "Symbol of two keys on a ring",
          "cpu.fill": "Symbol of a CPU",
          "memorychip.fill": "Symbol of a memory chip",
          "opticaldisc.fill": "Symbol of an optical disc",
          "sensor.tag.radiowaves.forward.fill": "Symbol of a sensor with radiowaves",
          "watch.analog": "Symbol of an analog watch",
          "shippingbox.fill": "Symbol of a shipping box",
          "swatchpalette.fill": "Symbol of a swatch palette",
          "mug.fill": "Symbol of a mug",
          "wineglass.fill": "Symbol of a wineglass",
          "birthday.cake.fill": "Symbol of a birthday cake",
          "scalemass.fill": "Symbol of a mass scale",
          "simcard.fill": "Symbol of a SIM card",
          "sdcard.fill": "Symbol of an SD card",
          "waterbottle.fill": "Symbol of a water bottle",
          "cup.and.heat.waves.fill": "Symbol of a cup with heat waves",
          "esim.fill": "Symbol of an eSIM",
          "carrot.fill": "Symbol of a carrot",
          "battery.100percent": "Symbol of a fully charged battery"
        ],
        "7_Gaming": [
            "house.fill": "Symbol of a house",
            "gamecontroller.fill": "Symbol of a game controller",
            "flag.pattern.checkered": "Symbol of a checkered flag",
            "flag.2.crossed.fill": "Symbol of two crossed flags",
            "flag.pattern.checkered.2.crossed": "Symbol of two crossed checkered flags",
            "xmark": "Symbol of an xmark",
            "target": "Symbol of a target",
            "scope": "Symbol of a scope",
            "playstation.logo": "Symbol of the PlayStation logo",
            "xbox.logo": "Symbol of the Xbox logo",
            "arcade.stick.console.fill": "Symbol of an arcade stick console",
            "formfitting.gamecontroller.fill": "Symbol of a form-fitting game controller"
        ],
        "8_Home": [
            "house.fill": "Symbol of a house",
            "lightbulb.fill": "Symbol of a lightbulb",
            "lamp.desk.fill": "Symbol of a desk lamp",
            "sink.fill": "Symbol of a sink",
            "washer.fill": "Symbol of a washer",
            "fan.fill": "Symbol of a fan",
            "av.remote.fill": "Symbol of an AV remote",
            "humidifier.and.droplets.fill": "Symbol of a humidifier with droplets",
            "entry.lever.keypad.fill": "Symbol of an entry lever keypad",
            "poweroutlet.strip.fill": "Symbol of a power outlet strip",
            "roller.shade.closed": "Symbol of a closed roller shade",
            "sensor.fill": "Symbol of a sensor",
            "sofa.fill": "Symbol of a sofa",
            "robotic.vacuum.fill": "Symbol of a robotic vacuum",
            "cooktop.fill": "Symbol of a cooktop",
            "chandelier.fill": "Symbol of a chandelier",
            "video.doorbell.fill": "Symbol of a video doorbell",
            "fan.floor.fill": "Symbol of a floor fan",
            "shower.fill": "Symbol of a shower",
            "fireplace.fill": "Symbol of a fireplace",
            "chair.lounge.fill": "Symbol of a lounge chair",
            "fan.ceiling.fill": "Symbol of a ceiling fan",
            "lamp.ceiling.inverse": "Symbol of an inverse ceiling lamp",
            "homekit": "Symbol of HomeKit",
            "dishwasher.fill": "Symbol of a dishwasher",
            "dryer.fill": "Symbol of a dryer",
            "pedestrian.gate.closed": "Symbol of a closed pedestrian gate",
            "shower.handheld.fill": "Symbol of a handheld shower",
            "light.cylindrical.ceiling.inverse": "Symbol of an inverse cylindrical ceiling light",
            "light.panel.fill": "Symbol of a light panel",
            "blinds.vertical.open": "Symbol of open vertical blinds",
            "light.recessed.inverse": "Symbol of an inverse recessed light",
            "light.recessed.3.inverse": "Symbol of three inverse recessed lights",
            "lamp.floor.fill": "Symbol of a floor lamp",
            "bathtub.fill": "Symbol of a bathtub",
            "oven.fill": "Symbol of an oven",
            "door.garage.closed": "Symbol of a closed garage door",
            "chair.fill": "Symbol of a chair",
            "toilet.fill": "Symbol of a toilet",
            "microwave.fill": "Symbol of a microwave",
            "blinds.horizontal.open": "Symbol of open horizontal blinds",
            "lamp.table.fill": "Symbol of a table lamp",
            "fan.and.light.ceiling.fill": "Symbol of a ceiling fan and light",
            "hifireceiver.fill": "Symbol of a HiFi receiver",
            "light.strip.2.fill": "Symbol of two light strips",
            "stove.fill": "Symbol of a stove",
            "fan.desk.fill": "Symbol of a desk fan",
            "refrigerator.fill": "Symbol of a refrigerator",
            "light.beacon.max.fill": "Symbol of a beacon light",
            "videoprojector.fill": "Symbol of a video projector",
            "web.camera.fill": "Symbol of a web camera",
            "air.purifier.fill": "Symbol of an air purifier",
            "door.left.hand.closed": "Symbol of a closed left-hand door",
            "cabinet.fill": "Symbol of a cabinet",
            "sprinkler.and.droplets.fill": "Symbol of a sprinkler with droplets",
            "spigot.fill": "Symbol of a spigot"
        ],
        "9_Commerce": [
            "creditcard.fill": "Symbol of a credit card",
            "cart.fill": "Symbol of a cart",
            "basket.fill": "Symbol of a basket",
            "bag.fill": "Symbol of a bag",
            "giftcard.fill": "Symbol of a gift card",
            "signature": "Symbol of a signature",
            "eurosign": "Symbol of the Euro sign",
            "centsign": "Symbol of the cent sign",
            "chineseyuanrenminbisign": "Symbol of the Chinese Yuan Renminbi sign",
            "coloncurrencysign": "Symbol of the Colon currency sign",
            "dongsign": "Symbol of the Dong sign",
            "eurozonesign": "Symbol of the Eurozone sign",
            "dollarsign": "Symbol of the dollar sign",
            "bitcoinsign": "Symbol of the Bitcoin sign",
            "florinsign": "Symbol of the Florin sign",
            "francsign": "Symbol of the Franc sign",
            "indianrupeesign": "Symbol of the Indian Rupee sign",
            "guaranisign": "Symbol of the Guarani sign",
            "danishkronesign": "Symbol of the Danish Krone sign",
            "hryvniasign": "Symbol of the Hryvnia sign",
            "kipsign": "Symbol of the Kip sign",
            "larisign": "Symbol of the Lari sign",
            "peruviansolessign": "Symbol of the Peruvian Soles sign",
            "pesetasign": "Symbol of the Peseta sign",
            "polishzlotysign": "Symbol of the Polish Zloty sign",
            "rublesign": "Symbol of the Ruble sign",
            "shekelsign": "Symbol of the Shekel sign",
            "singaporedollarsign": "Symbol of the Singapore Dollar sign",
            "sterlingsign": "Symbol of the Sterling sign",
            "tengesign": "Symbol of the Tenge sign",
            "tugriksign": "Symbol of the Tugrik sign",
            "turkishlirasign": "Symbol of the Turkish Lira sign",
            "wonsign": "Symbol of the Won sign",
            "yensign": "Symbol of the Yen sign",
            "nairasign": "Symbol of the Naira sign",
            "norwegiankronesign": "Symbol of the Norwegian Krone sign",
            "malaysianringgitsign": "Symbol of the Malaysian Ringgit sign",
            "lirasign": "Symbol of the Lira sign"
        ],
        "10_Weather": [
            "sun.max.fill": "Symbol of a sun",
            "sun.horizon.fill": "Symbol of a sun on the horizon",
            "sun.haze.fill": "Symbol of a sun in haze",
            "sun.rain.fill": "Symbol of a sun with rain",
            "sun.snow.fill": "Symbol of a sun with snow",
            "moon.fill": "Symbol of a moon",
            "moon.dust.fill": "Symbol of a moon with dust",
            "cloud.heavyrain.fill": "Symbol of a cloud with heavy rain",
            "moon.haze.fill": "Symbol of a moon in haze",
            "sparkles": "Symbol of sparkles",
            "moon.stars.fill": "Symbol of a moon with stars",
            "cloud.fill": "Symbol of a cloud",
            "cloud.rain.fill": "Symbol of a cloud with rain",
            "cloud.hail.fill": "Symbol of a cloud with hail",
            "cloud.snow.fill": "Symbol of a cloud with snow",
            "cloud.bolt.rain.fill": "Symbol of a cloud with bolt and rain",
            "cloud.sun.fill": "Symbol of a cloud with sun",
            "cloud.sun.rain.fill": "Symbol of a cloud with sun and rain",
            "cloud.moon.fill": "Symbol of a cloud with moon",
            "smoke.fill": "Symbol of smoke",
            "wind": "Symbol of wind",
            "snowflake": "Symbol of a snowflake",
            "tornado": "Symbol of a tornado",
            "hurricane": "Symbol of a hurricane",
            "thermometer.variable": "Symbol of a variable thermometer",
            "aqi.medium": "Symbol of air quality index medium",
            "rainbow": "Symbol of a rainbow",
            "cloud.rainbow.crop.fill": "Symbol of a cloud with a cropped rainbow"
        ],
        "11_Nature": [
            "carrot.fill": "Symbol of a carrot",
            "globe.americas.fill": "Symbol of the Americas globe",
            "sun.max.fill": "Symbol of a sun with maximum brightness",
            "bird.fill": "Symbol of a bird",
            "ant.fill": "Symbol of an ant",
            "leaf.fill": "Symbol of a leaf",
            "sun.dust.fill": "Symbol of a sun in dust",
            "tropicalstorm": "Symbol of a tropical storm",
            "lizard.fill": "Symbol of a lizard",
            "fossil.shell.fill": "Symbol of a fossil shell",
            "moonphase.waxing.crescent": "Symbol of a waxing crescent moon phase",
            "cloud.sleet.fill": "Symbol of a cloud with sleet",
            "wind": "Symbol of wind",
            "hurricane": "Symbol of a hurricane",
            "flame.fill": "Symbol of a flame",
            "water.waves": "Symbol of water waves",
            "ladybug.fill": "Symbol of a ladybug",
            "fish.fill": "Symbol of a fish",
            "drop.fill": "Symbol of a drop",
            "bolt.fill": "Symbol of a bolt",
            "mountain.2.fill": "Symbol of two mountains",
            "dog.fill": "Symbol of a dog",
            "atom": "Symbol of an atom",
            "tree.fill": "Symbol of a tree",
            "cat.fill": "Symbol of a cat",
            "apple.meditate": "Symbol of Apple meditate"
        ],
        "12_Human": [
            "person.fill": "Symbol of a person",
            "shareplay": "Symbol of SharePlay",
            "person.2.fill": "Symbol of two people",
            "person.3.fill": "Symbol of three people",
            "person.bust.fill": "Symbol of a person bust",
            "figure.stand": "Symbol of a standing figure",
            "figure.stand.dress": "Symbol of a standing figure in a dress",
            "figure.arms.open": "Symbol of a figure with open arms",
            "figure": "Symbol of a figure",
            "figure.walk": "Symbol of a walking figure",
            "figure.fall": "Symbol of a falling figure",
            "figure.run": "Symbol of a running figure",
            "person.wave.2.fill": "Symbol of two people waving",
            "figure.roll": "Symbol of a rolling figure",
            "figure.yoga": "Symbol of a yoga figure",
            "nose.fill": "Symbol of a nose",
            "mustache.fill": "Symbol of a mustache",
            "mouth.fill": "Symbol of a mouth"
        ],
        "13_Keyboard": [
            "globe": "Symbol of a globe",
            "keyboard.fill": "Symbol of a keyboard",
            "command": "Symbol of the command key",
            "control": "Symbol of the control key",
            "eject.fill": "Symbol of the eject key",
            "capslock.fill": "Symbol of the caps lock key",
            "delete.left.fill": "Symbol of the delete left key",
            "power": "Symbol of the power key",
            "option": "Symbol of the option key",
            "alt": "Symbol of the alt key"
        ],
        "14_Camera & Photos": [
            "swirl.circle.righthalf.filled": "Symbol of a right half filled swirl circle",
            "circle.lefthalf.filled.righthalf.striped.horizontal": "Symbol of a left half filled, right half horizontally stripecircle",
            "circle.dotted.circle": "Symbol of a dotted circle within a circle",
            "bolt.fill": "Symbol of a bolt",
            "camera.filters": "Symbol of camera filters",
            "livephoto": "Symbol of Live Photo",
            "camera.shutter.button.fill": "Symbol of a camera shutter button",
            "camera.fill": "Symbol of a camera",
            "camera.macro": "Symbol of a macro camera",
            "plus.viewfinder": "Symbol of a plus viewfinder",
            "camera.viewfinder": "Symbol of a camera viewfinder",
            "camera.aperture": "Symbol of a camera aperture",
            "f.cursive": "Symbol of a cursive f",
            "photo.fill": "Symbol of a photo"
        ],
        "15_Communication": [
            "microphone.fill": "Symbol of a microphone",
            "message.fill": "Symbol of a message",
            "checkmark.message.fill": "Symbol of a checkmark message",
            "bubble.fill": "Symbol of a bubble",
            "exclamationmark.bubble.fill": "Symbol of an exclamation mark bubble",
            "phone.fill": "Symbol of a phone",
            "phone.down.fill": "Symbol of a phone down",
            "teletype": "Symbol of a teletype",
            "tray.full.fill": "Symbol of a full tray",
            "tray.2.fill": "Symbol of two trays",
            "video.fill": "Symbol of a video",
            "deskview.fill": "Symbol of a desk view",
            "envelope.front.fill": "Symbol of a front envelope",
            "envelope.fill": "Symbol of an envelope",
            "envelope.open.fill": "Symbol of an open envelope",
            "waveform": "Symbol of a waveform",
            "recordingtape": "Symbol of a recording tape"
        ],
        "16_Media": [
            "play.fill": "Symbol of a play button",
            "play.rectangle.fill": "Symbol of a play rectangle",
            "pause.fill": "Symbol of a pause button",
            "playpause.fill": "Symbol of a play/pause button",
            "backward.fill": "Symbol of a backward button",
            "forward.fill": "Symbol of a forward button",
            "shuffle": "Symbol of shuffle",
            "repeat": "Symbol of repeat",
            "arrow.trianglehead.clockwise": "Symbol of a clockwise triangle arrow",
            "infinity": "Symbol of infinity",
            "play.house.fill": "Symbol of a play house"
        ],
        "17_Connectivity": [
            "externaldrive.connected.to.line.below.fill": "Symbol of an external drive connected to a line below",
            "personalhotspot": "Symbol of a personal hotspot",
            "network": "Symbol of a network",
            "bolt.horizontal.fill": "Symbol of a horizontal bolt",
            "icloud.fill": "Symbol of iCloud",
            "wifi": "Symbol of WiFi",
            "dot.radiowaves.left.and.right": "Symbol of dot radiowaves left and right",
            "cellularbars": "Symbol of cellular bars",
            "bonjour": "Symbol of Bonjour"
        ],
        "18_Fitness": [
            "flame.fill": "Symbol of a flame",
            "dumbbell.fill": "Symbol of a dumbbell",
            "sportscourt.fill": "Symbol of a sports court",
            "surfboard.fill": "Symbol of a surfboard",
            "duffle.bag.fill": "Symbol of a duffle bag",
            "soccerball": "Symbol of a soccer ball",
            "baseball.fill": "Symbol of a baseball",
            "trophy.fill": "Symbol of a trophy",
            "medal.fill": "Symbol of a medal",
            "basketball.fill": "Symbol of a basketball",
            "american.football.fill": "Symbol of an American football",
            "american.football.professional.fill": "Symbol of a professional American football",
            "rugbyball.fill": "Symbol of a rugby ball",
            "tennis.racket": "Symbol of a tennis racket",
            "hockey.puck.fill": "Symbol of a hockey puck",
            "tennisball.fill": "Symbol of a tennis ball",
            "volleyball.fill": "Symbol of a volleyball",
            "skateboard.fill": "Symbol of a skateboard",
            "skis.fill": "Symbol of skis",
            "snowboard.fill": "Symbol of a snowboard",
            "figure.walk": "Symbol of a walking figure",
            "figure.walk.motion": "Symbol of a walking figure in motion",
            "figure.run": "Symbol of a running figure",
            "figure.run.treadmill": "Symbol of a running figure on a treadmill",
            "figure.walk.treadmill": "Symbol of a walking figure on a treadmill",
            "figure.roll": "Symbol of a rolling figure",
            "figure.american.football": "Symbol of an American football figure",
            "figure.archery": "Symbol of an archery figure",
            "figure.australian.football": "Symbol of an Australian football figure",
            "figure.badminton": "Symbol of a badminton figure",
            "figure.barre": "Symbol of a barre figure",
            "figure.baseball": "Symbol of a baseball figure",
            "figure.basketball": "Symbol of a basketball figure",
            "figure.bowling": "Symbol of a bowling figure",
            "figure.boxing": "Symbol of a boxing figure",
            "figure.climbing": "Symbol of a climbing figure",
            "figure.cooldown": "Symbol of a cooldown figure",
            "figure.core.training": "Symbol of a core training figure",
            "figure.cricket": "Symbol of a cricket figure",
            "figure.skiing.crosscountry": "Symbol of a cross-country skiing figure",
            "figure.cross.training": "Symbol of a cross-training figure",
            "figure.curling": "Symbol of a curling figure",
            "figure.dance": "Symbol of a dance figure",
            "figure.disc.sports": "Symbol of a disc sports figure",
            "figure.skiing.downhill": "Symbol of a downhill skiing figure",
            "figure.elliptical": "Symbol of an elliptical figure",
            "figure.equestrian.sports": "Symbol of an equestrian sports figure",
            "figure.fencing": "Symbol of a fencing figure",
            "figure.fishing": "Symbol of a fishing figure",
            "figure.flexibility": "Symbol of a flexibility figure",
            "figure.strengthtraining.functional": "Symbol of a functional strength training figure",
            "figure.golf": "Symbol of a golf figure",
            "figure.gymnastics": "Symbol of a gymnastics figure",
            "figure.hand.cycling": "Symbol of a hand cycling figure",
            "figure.handball": "Symbol of a handball figure",
            "figure.highintensity.intervaltraining": "Symbol of a high-intensity interval training figure",
            "figure.hiking": "Symbol of a hiking figure",
            "figure.hockey": "Symbol of a hockey figure",
            "figure.field.hockey": "Symbol of a field hockey figure",
            "figure.ice.hockey": "Symbol of an ice hockey figure",
            "figure.hunting": "Symbol of a hunting figure",
            "figure.indoor.cycle": "Symbol of an indoor cycle figure",
            "figure.jumprope": "Symbol of a jump rope figure",
            "figure.kickboxing": "Symbol of a kickboxing figure",
            "figure.lacrosse": "Symbol of a lacrosse figure",
            "figure.martial.arts": "Symbol of a martial arts figure",
            "figure.mind.and.body": "Symbol of a mind and body figure",
            "figure.mixed.cardio": "Symbol of a mixed cardio figure",
            "figure.open.water.swim": "Symbol of an open water swim figure",
            "figure.outdoor.cycle": "Symbol of an outdoor cycle figure",
            "oar.2.crossed": "Symbol of two crossed oars",
            "figure.pickleball": "Symbol of a pickleball figure",
            "figure.pilates": "Symbol of a Pilates figure",
            "figure.play": "Symbol of a play figure",
            "figure.pool.swim": "Symbol of a pool swim figure",
            "figure.racquetball": "Symbol of a racquetball figure",
            "figure.rolling": "Symbol of a rolling figure",
            "figure.indoor.rowing": "Symbol of an indoor rowing figure",
            "figure.outdoor.rowing": "Symbol of an outdoor rowing figure",
            "figure.rugby": "Symbol of a rugby figure",
            "figure.sailing": "Symbol of a sailing figure",
            "figure.skateboarding": "Symbol of a skateboarding figure",
            "figure.ice.skating": "Symbol of an ice skating figure",
            "figure.snowboarding": "Symbol of a snowboarding figure",
            "figure.indoor.soccer": "Symbol of an indoor soccer figure",
            "figure.outdoor.soccer": "Symbol of an outdoor soccer figure",
            "figure.socialdance": "Symbol of a social dance figure",
            "figure.softball": "Symbol of a softball figure",
            "figure.squash": "Symbol of a squash figure",
            "figure.stair.stepper": "Symbol of a stair stepper figure",
            "figure.stairs": "Symbol of a stairs figure",
            "figure.step.training": "Symbol of a step training figure",
            "figure.surfing": "Symbol of a surfing figure",
            "figure.table.tennis": "Symbol of a table tennis figure",
            "figure.taichi": "Symbol of a Tai Chi figure",
            "figure.tennis": "Symbol of a tennis figure",
            "figure.track.and.field": "Symbol of a track and field figure",
            "figure.strengthtraining.traditional": "Symbol of a traditional strength training figure",
            "figure.volleyball": "Symbol of a volleyball figure",
            "figure.water.fitness": "Symbol of a water fitness figure",
            "figure.waterpolo": "Symbol of a water polo figure",
            "figure.wrestling": "Symbol of a wrestling figure",
            "figure.yoga": "Symbol of a yoga figure"
        ],
        "19_Accessibility": [
            "figure": "Symbol of a figure",
            "hand.tap.fill": "Symbol of a hand tap",
            "wheelchair": "Symbol of a wheelchair",
            "apple.meditate": "Symbol of Apple meditate",
            "ear.fill": "Symbol of an ear",
            "quote.bubble.fill": "Symbol of a quote bubble",
            "plus.magnifyingglass": "Symbol of a plus magnifying glass",
            "tortoise.fill": "Symbol of a tortoise",
            "textformat.size": "Symbol of text format size",
            "hand.point.up.fill": "Symbol of a hand pointing up",
            "hearingdevice.ear.fill": "Symbol of a hearing device ear",
            "minus.magnifyingglass": "Symbol of a minus magnifying glass",
            "figure.stand.line.dotted.figure.stand": "Symbol of a standing figure with a dotted line to another standing figure",
            "figure.roll": "Symbol of a rolling figure",
            "character.magnify": "Symbol of a character magnifying glass",
            "hare.fill": "Symbol of a hare",
            "cursorarrow.motionlines": "Symbol of a cursor arrow with motion lines"
        ],
        "20_Time": [
            "clock.fill": "Symbol of a clock",
            "deskclock.fill": "Symbol of a desk clock",
            "clock.arrow.trianglehead.2.counterclockwise.rotate.90": "Symbol of a clock arrow counterclockwise rotated 90 degrees",
            "alarm.fill": "Symbol of an alarm",
            "alarm.waves.left.and.right.fill": "Symbol of an alarm with waves left and right",
            "gauge.with.needle": "Symbol of a gauge with a needle",
            "hourglass": "Symbol of an hourglass",
            "calendar": "Symbol of a calendar",
            "stopwatch.fill": "Symbol of a stopwatch",
            "timer": "Symbol of a timer"
        ],
        "21_Privacy & Security": [
            "lock.open.fill": "Symbol of an open lock",
            "nosign": "Symbol of a no sign",
            "lock.shield.fill": "Symbol of a lock shield",
            "exclamationmark.shield.fill": "Symbol of an exclamation mark shield",
            "touchid": "Symbol of Touch ID",
            "hand.raised.fill": "Symbol of a raised hand",
            "key.2.on.ring.fill": "Symbol of two keys on a ring",
            "checkmark": "Symbol of a checkmark",
            "xmark.shield.fill": "Symbol of an xmark shield",
            "eye.fill": "Symbol of an eye",
            "eye.slash.fill": "Symbol of an eye slash",
            "lock.fill": "Symbol of a lock",
            "key.horizontal.fill": "Symbol of a horizontal key",
            "firewall.fill": "Symbol of a firewall",
            "checkmark.seal.fill": "Symbol of a checkmark seal",
            "key.fill": "Symbol of a key",
            "xmark.seal.fill": "Symbol of an xmark seal",
            "faceid": "Symbol of Face ID"
        ],
        "22_Editing": [
            "pencil": "Symbol of a pencil",
            "eraser.fill": "Symbol of an eraser",
            "scribble.variable": "Symbol of a variable scribble",
            "highlighter": "Symbol of a highlighter",
            "pencil.tip": "Symbol of a pencil tip",
            "lasso": "Symbol of a lasso",
            "beziercurve": "Symbol of a Bezier curve",
            "loupe": "Symbol of a loupe",
            "inset.filled.circle.dashed": "Symbol of an inset filled dashed circle",
            "scissors": "Symbol of scissors",
            "wand.and.rays": "Symbol of a wand and rays",
            "wand.and.sparkles": "Symbol of a wand and sparkles",
            "crop": "Symbol of crop",
            "paintbrush.fill": "Symbol of a paintbrush",
            "paintbrush.pointed.fill": "Symbol of a pointed paintbrush",
            "eyedropper": "Symbol of an eyedropper",
            "move.3d": "Symbol of 3D move",
            "rotate.3d.fill": "Symbol of 3D rotate",
            "bandage.fill": "Symbol of a bandage",
            "trapezoid.and.line.vertical.fill": "Symbol of a trapezoid and vertical line",
            "trapezoid.and.line.horizontal.fill": "Symbol of a trapezoid and horizontal line",
            "camera.filters": "Symbol of camera filters",
            "skew": "Symbol of skew"
        ],
        "23_People": [
            "hand.thumbsup.fill": "Symbol of a thumbs up hand",
            "hand.thumbsdown.fill": "Symbol of a thumbs down hand",
            "person.fill": "Symbol of a person",
            "person.bust.fill": "Symbol of a person bust",
            "figure.run": "Symbol of a running figure",
            "sunglasses.fill": "Symbol of sunglasses",
            "hand.wave.fill": "Symbol of a waving hand",
            "hand.point.left.fill": "Symbol of a hand pointing left",
            "hand.point.up.fill": "Symbol of a hand pointing up"
        ],
        "24_Symbols": [
            "square.2.layers.3d": "Symbol of two 3D layered squares",
            "barcode": "Symbol of a barcode",
            "qrcode": "Symbol of a QR code",
            "inset.filled.rectangle.and.person.filled": "Symbol of an inset filled rectangle and filled person",
            "square.and.arrow.down.fill": "Symbol of a square and arrow down",
            "square.and.arrow.up": "Symbol of a square and arrow up",
            "questionmark": "Symbol of a question mark",
            "info": "Symbol of info",
            "swift": "Symbol of Swift",
            "peacesign": "Symbol of a peace sign",
            "square.grid.2x2.fill": "Symbol of a 2x2 grid square",
            "ellipsis": "Symbol of ellipsis",
            "circle.dotted": "Symbol of a dotted circle",
            "checklist": "Symbol of a checklist",
            "square.grid.4x3.fill": "Symbol of a 4x3 grid square",
            "point.3.filled.connected.trianglepath.dotted": "Symbol of three filled points connected by a dotted triangle path",
            "rays": "Symbol of rays",
            "swiftdata": "Symbol of SwiftData",
            "timelapse": "Symbol of timelapse",
            "circle.circle": "Symbol of a circle within a circle",
            "airplay.audio": "Symbol of AirPlay audio",
            "airplay.video": "Symbol of AirPlay video",
            "music.note": "Symbol of a music note",
            "music.note.list": "Symbol of a music note list",
            "qrcode.viewfinder": "Symbol of a QR code viewfinder",
            "plus.square.on.square.fill": "Symbol of a plus square on a square",
            "waveform.path": "Symbol of a waveform path",
            "richtext.page.fill": "Symbol of a rich text page",
            "text.page.fill": "Symbol of a text page",
            "append.page.fill": "Symbol of an appended page",
            "terminal.fill": "Symbol of a terminal",
            "note.text": "Symbol of note text",
            "document.fill": "Symbol of a document",
            "text.document.fill": "Symbol of a text document",
            "dock.rectangle": "Symbol of a dock rectangle",
            "menubar.dock.rectangle": "Symbol of a menubar dock rectangle",
            "ecg.text.page.fill": "Symbol of an ECG text page",
            "questionmark.text.page.fill": "Symbol of a question mark text page",
            "zipper.page": "Symbol of a zipper page",
            "person.text.rectangle.fill": "Symbol of a person text rectangle",
            "applescript.fill": "Symbol of AppleScript",
            "building.columns.fill": "Symbol of building columns",
            "sailboat.fill": "Symbol of a sailboat",
            "atom": "Symbol of an atom",
            "cable.connector": "Symbol of a cable connector",
            "audio.jack.stereo": "Symbol of a stereo audio jack",
            "applepencil.adapter.usb.c.fill": "Symbol of an Apple Pencil USB-C adapter"
        ],
        "25_Arrows": [
            "arrowshape.left.fill": "Symbol of a left arrow shape",
            "arrowshape.right.fill": "Symbol of a right arrow shape",
            "arrowshape.left.arrowshape.right.fill": "Symbol of left and right arrow shapes",
            "arrowshape.turn.up.left.fill": "Symbol of a turn up left arrow shape",
            "arrowshape.turn.up.right.fill": "Symbol of a turn up right arrow shape",
            "arrow.trianglehead.counterclockwise": "Symbol of a counterclockwise triangle arrow",
            "arrow.trianglehead.2.counterclockwise.rotate.90": "Symbol of two counterclockwise triangle arrows rotated 90 degrees",
            "arrow.trianglehead.topright.capsulepath.clockwise": "Symbol of a clockwise triangle arrow with a capsule path",
            "chevron.forward": "Symbol of a forward chevron",
            "chevron.backward": "Symbol of a backward chevron",
            "chevron.left.chevron.right": "Symbol of left and right chevrons",
            "arrow.down.left.arrow.up.right": "Symbol of a down left and up right arrow",
            "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left": "Symbol of up left and down right, and up right and dowleft arrows",
            "arrow.up.and.down.and.arrow.left.and.right": "Symbol of up and down, and left and right arrows",
            "arrow.3.trianglepath": "Symbol of three triangle path arrows",
            "arrow.2.squarepath": "Symbol of two square path arrows",
            "arrow.trianglehead.branch": "Symbol of a triangle arrow branch"
        ],
        "26_Shapes": [
            "circle.fill": "Symbol of a circle",
            "app.fill": "Symbol of an app",
            "square.fill": "Symbol of a square",
            "rectangle.fill": "Symbol of a rectangle",
            "rectangle.portrait.fill": "Symbol of a portrait rectangle",
            "capsule.fill": "Symbol of a capsule",
            "capsule.portrait.fill": "Symbol of a portrait capsule",
            "oval.fill": "Symbol of an oval",
            "oval.portrait.fill": "Symbol of a portrait oval",
            "triangle.fill": "Symbol of a triangle",
            "triangleshape.fill": "Symbol of a triangle shape",
            "rectangle.fill.on.rectangle.fill": "Symbol of a rectangle on a rectangle",
            "diamond.fill": "Symbol of a diamond",
            "octagon.fill": "Symbol of an octagon",
            "hexagon.fill": "Symbol of a hexagon",
            "pentagon.fill": "Symbol of a pentagon",
            "seal.fill": "Symbol of a seal",
            "rhombus.fill": "Symbol of a rhombus",
            "shield.fill": "Symbol of a shield",
            "xmark.triangle.circle.square.fill": "Symbol of an xmark, triangle, circle, square",
            "viewfinder": "Symbol of a viewfinder",
            "button.horizontal.fill": "Symbol of a horizontal button",
            "button.roundedtop.horizontal.fill": "Symbol of a rounded top horizontal button",
            "button.roundedbottom.horizontal.fill": "Symbol of a rounded bottom horizontal button",
            "button.angledtop.vertical.left.fill": "Symbol of an angled top vertical left button",
            "button.angledtop.vertical.right.fill": "Symbol of an angled top vertical right button",
            "button.angledbottom.horizontal.left.fill": "Symbol of an angled bottom horizontal left button",
            "button.angledbottom.horizontal.right.fill": "Symbol of an angled bottom horizontal right button"
        ],
        "27_Maths": [
            "x.squareroot": "Symbol of x square root",
            "angle": "Symbol of an angle",
            "compass.drawing": "Symbol of a drawing compass",
            "sum": "Symbol of sum",
            "percent": "Symbol of percent",
            "function": "Symbol of function",
            "plus": "Symbol of plus",
            "minus": "Symbol of minus",
            "plusminus": "Symbol of plus minus",
            "plus.forwardslash.minus": "Symbol of plus forward slash minus",
            "multiply": "Symbol of multiply",
            "divide": "Symbol of divide",
            "equal": "Symbol of equal",
            "notequal": "Symbol of not equal",
            "lessthan": "Symbol of less than",
            "lessthanorequalto": "Symbol of less than or equal to",
            "greaterthan": "Symbol of greater than",
            "greaterthanorequalto": "Symbol of greater than or equal to",
            "number": "Symbol of number"
        ],
        "28_Indices": [
            "eurosign": "Symbol of the Euro sign",
            "centsign": "Symbol of the cent sign",
            "chineseyuanrenminbisign": "Symbol of the Chinese Yuan Renminbi sign",
            "coloncurrencysign": "Symbol of the Colon currency sign",
            "dongsign": "Symbol of the Dong sign",
            "eurozonesign": "Symbol of the Eurozone sign",
            "dollarsign": "Symbol of the dollar sign",
            "bitcoinsign": "Symbol of the Bitcoin sign",
            "florinsign": "Symbol of the Florin sign",
            "francsign": "Symbol of the Franc sign",
            "indianrupeesign": "Symbol of the Indian Rupee sign",
            "guaranisign": "Symbol of the Guarani sign",
            "danishkronesign": "Symbol of the Danish Krone sign",
            "hryvniasign": "Symbol of the Hryvnia sign",
            "kipsign": "Symbol of the Kip sign",
            "larisign": "Symbol of the Lari sign",
            "peruviansolessign": "Symbol of the Peruvian Soles sign",
            "pesetasign": "Symbol of the Peseta sign",
            "polishzlotysign": "Symbol of the Polish Zloty sign",
            "rublesign": "Symbol of the Ruble sign",
            "shekelsign": "Symbol of the Shekel sign",
            "singaporedollarsign": "Symbol of the Singapore Dollar sign",
            "sterlingsign": "Symbol of the Sterling sign",
            "tengesign": "Symbol of the Tenge sign",
            "tugriksign": "Symbol of the Tugrik sign",
            "turkishlirasign": "Symbol of the Turkish Lira sign",
            "wonsign": "Symbol of the Won sign",
            "yensign": "Symbol of the Yen sign",
            "nairasign": "Symbol of the Naira sign",
            "norwegiankronesign": "Symbol of the Norwegian Krone sign",
            "malaysianringgitsign": "Symbol of the Malaysian Ringgit sign",
            "lirasign": "Symbol of the Lira sign"
        ],
        "29_Text Formatting": [
            "fleuron.fill": "Symbol of a fleuron",
            "signature": "Symbol of a signature",
            "list.bullet": "Symbol of a bullet list",
            "numbers": "Symbol of numbers",
            "textformat.size": "Symbol of text format size",
            "textformat": "Symbol of text format",
            "textformat.superscript": "Symbol of text format superscript",
            "textformat.subscript": "Symbol of text format subscript",
            "characters.lowercase": "Symbol of lowercase characters",
            "characters.uppercase": "Symbol of uppercase characters",
            "bold.italic.underline": "Symbol of bold italic underline",
            "paragraphsign": "Symbol of a paragraph sign",
            "character.magnify": "Symbol of character magnify",
            "character.phonetic": "Symbol of phonetic character"
        ],
    ]

    public var body: some View {
        VStack{
            colorPicker
            searchField
            symbolsList
            Spacer()
        }
        .frame(width: 310, height: 430)
    }


    @ViewBuilder public var searchField: some View{
        List{}
            .offset(y: -10)
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search Symbols")
            .scrollDisabled(true)
            .frame(height: 41)
    }
    
    @ViewBuilder public var colorPicker: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 21, maximum: 21))]){
            ForEach(SymbolColor.allCases){
                colorOption(for: $0)
            }
        }
        .padding(.top, 12)
        .padding(.horizontal, 7)
        
        Divider()
    }
    
    @ViewBuilder public var symbolsList: some View {
        ScrollView(.vertical) {
            if searchText.isEmpty {
                let keys = symbolDictionary.keys.sorted { Int($0.components(separatedBy: "_")[0]) ?? 0 < Int($1.components(separatedBy: "_")[0]) ?? 0 }
                ForEach(keys, id: \.self) { key in
                    Section {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 28, maximum: 28))]) {
                            ForEach(symbolDictionary[key]?.keys.sorted() ?? [], id: \.self) { symbolName in
                                if let symbolDescription = symbolDictionary[key]?[symbolName] {
                                    symbolButton(for: symbolName, description: symbolDescription)
                                }
                            }
                        }
                        .offset(y: -3)
                    } header: {
                        HStack {
                            Text(key.components(separatedBy: "_").last ?? "")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.primary.opacity(0.4))
                                .padding(.horizontal, 5)
                            Spacer()
                        }
                    }
                }
                .drawingGroup()
                .padding(.horizontal, 12)
            } else {
                let filteredSymbols = symbolDictionary.flatMap { sectionKey, sectionSymbols in
                    sectionSymbols.filter { symbolName, symbolDescription in
                        symbolName.localizedStandardContains(searchText) || symbolDescription.localizedStandardContains(searchText)
                    }
                }

                let items = filteredSymbols.sorted { $0.key < $1.key }

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 28, maximum: 28))]) {
                    ForEach(items, id: \.key) { (symbolName, symbolDescription) in
                        symbolButton(for: symbolName, description: symbolDescription)
                    }
                }
                .drawingGroup()
                .offset(y: -3)
                .padding(.horizontal, 12)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .offset(y: -17)
        .padding(.top, 5)
    }
    
    public func colorOption(for color: SymbolColor) -> some View{
        Button{
            colorValue = color.color
        }label:{
            Image(systemName: colorValue == color.color ? "checkmark.circle.fill" : "circle.fill")
                .resizable()
                .scaledToFit()
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 3)
                )
                .clipShape(.circle)
                .padding(2)
        }
        .accessibilityElement()
        .accessibilityLabel(color.name)
        .accessibilityAddTraits(.isButton)
        .foregroundStyle(color.color)
        .buttonStyle(.plain)
    }
    
    @ViewBuilder func symbolButton(for systemImage: String, description: String) -> some View {
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        Button{
            symbolName = systemImage
        }label:{
            Image(systemName: systemImage)
                .imageScale(.large)
                .frame(width: 22, height: 22)
                .fontWeight(.medium)
                .padding(.vertical, 5)
                .padding(.horizontal, 5)
                .background(primaryColor.opacity(symbolName == systemImage ? 0.25 : 0))
                .foregroundStyle(symbolName == systemImage ? invertedColor : primaryColor.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                .padding(.vertical, 4)
                .padding(.horizontal, 4)
                .background(.gray.opacity(0.001))
                .accessibilityElement()
                .accessibilityLabel(description)
                .accessibilityAddTraits([.isButton, .isImage])
        }
        .buttonStyle(.plain)
    }
    
    public init(symbolName: Binding<String>, colorValues: Binding<[Double]>){
        self._symbolName = symbolName
        self._colorValue = Binding(get: {
            Color(red: colorValues.wrappedValue[0], green: colorValues.wrappedValue[1], blue: colorValues.wrappedValue[2])
        }, set: { newValue in
            #if canImport(UIKit)
            // Use UIColor on iOS and tvOS
            typealias NativeColor = UIColor
            #elseif canImport(AppKit)
            // Use NSColor on macOS
            typealias NativeColor = NSColor
            #endif
            
            // Variables to store the individual color components
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var o: CGFloat = 1
            
            #if !os(macOS)
            // For iOS and tvOS, safely extract the color components
            guard NativeColor(newValue).getRed(&r, green: &g, blue: &b, alpha: &o) else {
                // Return default black color with full opacity if conversion fails
                colorValues = [0,0,0,1]
                return
            }
            #else
            // On macOS, convert the color to the sRGB color space and extract the RGB components; getRed(_:green:blue:alpha:) returns Void, so no guard               needed
            NativeColor(newValue).usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &o)
            #endif
            colorValues.wrappedValue = [r,g,b,o]
        })
        
    }
    
    public init(symbolName: Binding<String>, color: Binding<Color>){
        self._symbolName = symbolName
        self._colorValue = color
    }
    
    public init(symbolName: Binding<String>, symbolColor: Binding<SymbolColor>){
        self._symbolName = symbolName
        self._colorValue = .init(get: {
            symbolColor.wrappedValue.color
        }, set: { newValue in
            if let color = SymbolColor.allCases.first(where: { $0.color == newValue}){
                symbolColor.wrappedValue = color
            }
            
        })
    }
}

