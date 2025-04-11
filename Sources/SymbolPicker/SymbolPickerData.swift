import SwiftUI

@MainActor
public struct SymbolPickerData {
    public var isPresented: Binding<Bool>
    public var symbolName: Binding<String>
    public var colorValue: Binding<Color>?
    public var dismissOnSymbolChange: Bool
    public var useFilledSymbols: Bool
    public let symbolSections: [SymbolSection] = [
        .init(
            title: "Maps",
            symbols: [
                .init(symbolName: "car.fill", description: "Symbol of a car"),
                .init(symbolName: "bus.fill", description: "Symbol of a bus"),
                .init(symbolName: "bus.doubledecker.fill", description: "Symbol of a double-decker bus"),
                .init(symbolName: "tram.fill", description: "Symbol of a tram"),
                .init(symbolName: "bicycle", description: "Symbol of a bicycle"),
                .init(symbolName: "motorcycle.fill", description: "Symbol of a motorcycle"),
                .init(symbolName: "airplane", description: "Symbol of an airplane"),
                .init(symbolName: "fuelpump.fill", description: "Symbol of a fuel pump"),
                .init(symbolName: "binoculars.fill", description: "Symbol of binoculars"),
                .init(symbolName: "mecca", description: "Symbol of Mecca"),
                .init(symbolName: "map.fill", description: "Symbol of a map"),
                .init(symbolName: "figure.walk", description: "Symbol of a person walking"),
                .init(symbolName: "location.fill", description: "Symbol of a location pin"),
                .init(symbolName: "mappin.and.ellipse", description: "Symbol of a map pin with an ellipse"),
                .init(symbolName: "arrow.up.and.down.and.arrow.left.and.right", description: "Symbol of arrows in all directions"),
                .init(symbolName: "arrow.trianglehead.turn.up.right.diamond.fill", description: "Symbol of a directional arrow with a triangle head"),
                .init(symbolName: "arrow.turn.up.right", description: "Symbol of an upward right turn arrow"),
                .init(symbolName: "figure.wave", description: "Symbol of a person waving")
            ]
        ),
        .init(
            title: "Devices",
            symbols: [
                .init(symbolName: "macpro.gen1.fill", description: "Symbol of a Mac Pro Gen 1"),
                .init(symbolName: "macpro.gen2.fill", description: "Symbol of a Mac Pro Gen 2"),
                .init(symbolName: "macpro.gen3.fill", description: "Symbol of a Mac Pro Gen 3"),
                .init(symbolName: "macmini.fill", description: "Symbol of a Mac mini"),
                .init(symbolName: "macstudio.fill", description: "Symbol of a Mac Studio"),
                .init(symbolName: "applewatch", description: "Symbol of an Apple Watch"),
                .init(symbolName: "macbook", description: "Symbol of a MacBook"),
                .init(symbolName: "keyboard.fill", description: "Symbol of a keyboard"),
                .init(symbolName: "printer.fill", description: "Symbol of a printer"),
                .init(symbolName: "server.rack", description: "Symbol of a server rack"),
                .init(symbolName: "tv", description: "Symbol of a TV"),
                .init(symbolName: "magsafe.batterypack.fill", description: "Symbol of a MagSafe battery pack"),
                .init(symbolName: "cable.connector", description: "Symbol of a cable connector"),
                .init(symbolName: "applepencil.gen2", description: "Symbol of an Apple Pencil Gen 2"),
                .init(symbolName: "magicmouse.fill", description: "Symbol of a Magic Mouse"),
                .init(symbolName: "computermouse.fill", description: "Symbol of a computer mouse"),
                .init(symbolName: "gamecontroller.fill", description: "Symbol of a game controller"),
                .init(symbolName: "headphones", description: "Symbol of headphones"),
                .init(symbolName: "externaldrive.fill", description: "Symbol of an external drive"),
                .init(symbolName: "internaldrive.fill", description: "Symbol of an internal drive"),
                .init(symbolName: "opticaldiscdrive.fill", description: "Symbol of an optical disc drive"),
                .init(symbolName: "hearingdevice.ear.fill", description: "Symbol of a hearing device"),
                .init(symbolName: "hifispeaker.fill", description: "Symbol of a HiFi speaker"),
                .init(symbolNameFilledNotFilled: "tv.and.hifispeaker.fill", description: "Symbol of a TV with a HiFi speaker"),
                .init(symbolName: "earpods", description: "Symbol of earpods"),
                .init(symbolName: "airpods", description: "Symbol of AirPods"),
                .init(symbolName: "airpods.gen3", description: "Symbol of AirPods Gen 3"),
                .init(symbolName: "airpods.max", description: "Symbol of AirPods Max"),
                .init(symbolName: "airpods.pro", description: "Symbol of AirPods Pro"),
                .init(symbolName: "beats.headphones", description: "Symbol of Beats headphones"),
                .init(symbolName: "beats.earphones", description: "Symbol of Beats earphones"),
                .init(symbolName: "beats.powerbeats", description: "Symbol of Powerbeats"),
                .init(symbolName: "beats.powerbeats3", description: "Symbol of Powerbeats 3"),
                .init(symbolName: "beats.studiobuds", description: "Symbol of Beats Studio Buds"),
                .init(symbolName: "beats.fitpro", description: "Symbol of Beats Fit Pro"),
                .init(symbolName: "appletv.fill", description: "Symbol of an Apple TV"),
                .init(symbolName: "homepod.fill", description: "Symbol of a HomePod"),
                .init(symbolName: "homepod.mini.fill", description: "Symbol of a HomePod mini"),
                .init(symbolName: "applewatch.radiowaves.left.and.right", description: "Symbol of Apple Watch with radiowaves"),
                .init(symbolName: "flipphone", description: "Symbol of a flip phone"),
                .init(symbolName: "iphone.gen1", description: "Symbol of an iPhone with Home button"),
                .init(symbolName: "iphone.gen3", description: "Symbol of an iPhone Gen 3"),
                .init(symbolName: "iphone.gen1.radiowaves.left.and.right", description: "Symbol of an iPhone with Home button with radiowaves on sides"),
                .init(symbolName: "iphone.gen3.radiowaves.left.and.right", description: "Symbol of an iPhone with Dynamic Island with radiowaves on sides"),
                .init(symbolName: "apps.iphone", description: "Symbol of iPhone apps"),
                .init(symbolName: "ipad.gen1", description: "Symbol of an iPad with Home button"),
                .init(symbolName: "ipad.gen2", description: "Symbol of an iPad Gen 2"),
                .init(symbolName: "ipad.gen1.landscape", description: "Symbol of an iPad with Home Button in landscape mode"),
                .init(symbolName: "ipad.gen2.landscape", description: "Symbol of an Modern iPad in landscape mode"),
                .init(symbolName: "ipod", description: "Symbol of an iPod"),
                .init(symbolName: "scanner.fill", description: "Symbol of a scanner"),
                .init(symbolName: "applewatch.side.right", description: "Symbol of an Apple Watch on the right side"),
                .init(symbolName: "mediastick", description: "Symbol of a media stick"),
                .init(symbolName: "vision.pro", description: "Symbol of a Vision Pro headset"),
                .init(symbolName: "arcade.stick.console.fill", description: "Symbol of an arcade stick console")
            ]
        ),
        .init(
            title: "Transport",
            symbols: [
                .init(symbolName: "car.fill", description: "Symbol of a car"),
                .init(symbolName: "airplane", description: "Symbol of an airplane"),
                .init(symbolName: "bus.fill", description: "Symbol of a bus"),
                .init(symbolName: "bus.doubledecker.fill", description: "Symbol of a double-decker bus"),
                .init(symbolName: "tram.fill", description: "Symbol of a tram"),
                .init(symbolName: "tram.fill.tunnel", description: "Symbol of a tram in a tunnel"),
                .init(symbolName: "cablecar.fill", description: "Symbol of a cable car"),
                .init(symbolName: "lightrail.fill", description: "Symbol of a light rail"),
                .init(symbolName: "ferry.fill", description: "Symbol of a ferry"),
                .init(symbolName: "car.ferry.fill", description: "Symbol of a car ferry"),
                .init(symbolName: "sailboat.fill", description: "Symbol of a sailboat"),
                .init(symbolName: "figure.walk", description: "Symbol of a person walking"),
                .init(symbolName: "truck.box.fill", description: "Symbol of a box truck"),
                .init(symbolName: "bicycle", description: "Symbol of a bicycle"),
                .init(symbolName: "motorcycle.fill", description: "Symbol of a motorcycle"),
                .init(symbolName: "scooter", description: "Symbol of a scooter"),
                .init(symbolName: "wheelchair", description: "Symbol of a wheelchair"),
                .init(symbolName: "moped.fill", description: "Symbol of a moped"),
                .init(symbolName: "ev.charger.fill", description: "Symbol of an electric vehicle charger")
            ]
        ),
        .init(
            title: "Automotive",
            symbols: [
                .init(symbolName: "car.fill", description: "Symbol of a car"),
                .init(symbolName: "car.side.fill", description: "Symbol of a car from the side"),
                .init(symbolName: "bolt.car.fill", description: "Symbol of a car with a bolt, possibly indicating electric"),
                .init(symbolName: "snowflake", description: "Symbol of a snowflake, often representing cold"),
                .init(symbolName: "gauge.with.dots.needle.50percent", description: "Symbol of a gauge with a needle at 50%"),
                .init(symbolName: "fan.fill", description: "Symbol of a fan"),
                .init(symbolName: "fuelpump.fill", description: "Symbol of a fuel pump"),
                .init(symbolName: "ev.charger.fill", description: "Symbol of an electric vehicle charger"),
                .init(symbolName: "car.rear.fill", description: "Symbol of the rear of a car"),
                .init(symbolName: "engine.combustion.fill", description: "Symbol of a combustion engine"),
                .init(symbolName: "headlight.high.beam.fill", description: "Symbol of high beam headlights"),
                .init(symbolName: "truck.pickup.side.fill", description: "Symbol of a pickup truck from the side"),
                .init(symbolName: "tirepressure", description: "Symbol of tire pressure"),
                .init(symbolName: "glowplug", description: "Symbol of a glow plug, used in diesel engines"),
                .init(symbolName: "suv.side.fill", description: "Symbol of an SUV from the side"),
                .init(symbolName: "windshield.front.and.wiper", description: "Symbol of a front windshield with wipers"),
                .init(symbolName: "oilcan.fill", description: "Symbol of an oil can"),
                .init(symbolName: "figure.seated.seatbelt", description: "Symbol of a person seated with a seatbelt"),
                .init(symbolName: "convertible.side.fill", description: "Symbol of a convertible car from the side"),
                .init(symbolName: "hazardsign", description: "Symbol of a hazard sign"),
                .init(symbolName: "steeringwheel", description: "Symbol of a steering wheel"),
                .init(symbolName: "tire", description: "Symbol of a tire"),
                .init(symbolName: "suspension.shock", description: "Symbol of a suspension shock absorber"),
                .init(symbolName: "batteryblock.fill", description: "Symbol of a battery block"),
                .init(symbolName: "horn.fill", description: "Symbol of a horn")
            ]
        ),
        .init(
            title: "Health",
            symbols: [
                .init(symbolName: "list.bullet.clipboard.fill", description: "Symbol of a clipboard with bullet points"),
                .init(symbolName: "heart.fill", description: "Symbol of a heart"),
                .init(symbolName: "thermometer.variable", description: "Symbol of a variable thermometer"),
                .init(symbolName: "microbe.fill", description: "Symbol of a microbe"),
                .init(symbolName: "cross.case.fill", description: "Symbol of a medical case with a cross"),
                .init(symbolName: "bed.double.fill", description: "Symbol of a double bed"),
                .init(symbolName: "lungs.fill", description: "Symbol of lungs"),
                .init(symbolName: "apple.meditate", description: "Symbol of meditation, possibly related to Apple health"),
                .init(symbolName: "pills.fill", description: "Symbol of pills"),
                .init(symbolName: "brain.fill", description: "Symbol of a brain"),
                .init(symbolName: "allergens.fill", description: "Symbol of allergens"),
                .init(symbolName: "medical.thermometer.fill", description: "Symbol of a medical thermometer"),
                .init(symbolName: "syringe.fill", description: "Symbol of a syringe"),
                .init(symbolName: "stethoscope", description: "Symbol of a stethoscope"),
                .init(symbolName: "inhaler.fill", description: "Symbol of an inhaler"),
                .init(symbolName: "facemask.fill", description: "Symbol of a face mask"),
                .init(symbolName: "pill.fill", description: "Symbol of a pill"),
                .init(symbolName: "ivfluid.bag", description: "Symbol of an IV fluid bag"),
                .init(symbolName: "cross.vial.fill", description: "Symbol of a vial with a cross"),
                .init(symbolName: "staroflife.fill", description: "Symbol of the Star of Life, used in EMS"),
                .init(symbolName: "heart.text.square.fill", description: "Symbol of a heart with text in a square"),
                .init(symbolName: "ivfluid.bag.fill", description: "Symbol of a IV fluid bag"),
                .init(symbolName: "eye.fill", description: "Symbol of an eye"),
                .init(symbolName: "brain.head.profile.fill", description: "Symbol of a brain with a head profile"),
                .init(symbolName: "ear.fill", description: "Symbol of an ear"),
                .init(symbolName: "waveform.path.ecg", description: "Symbol of an ECG waveform")
            ]
        ),
        .init(
            title: "Objects & Tools",
            symbols: [
                .init(symbolName: "pencil", description: "Symbol of a pencil"),
                .init(symbolName: "eraser.fill", description: "Symbol of an eraser"),
                .init(symbolName: "internaldrive", description: "Symbol of an internal drive"),
                .init(symbolName: "square.and.pencil", description: "Symbol of a pencil and square"),
                .init(symbolName: "opticaldiscdrive.fill", description: "Symbol of an optical disc drive"),
                .init(symbolName: "pencil.and.scribble", description: "Symbol of a pencil with a scribble"),
                .init(symbolName: "list.bullet.clipboard.fill", description: "Symbol of a clipboard with bullet points"),
                .init(symbolName: "chart.line.text.clipboard.fill", description: "Symbol of a clipboard with chart and text"),
                .init(symbolName: "note.text", description: "Symbol of a text note"),
                .init(symbolName: "tray.full.fill", description: "Symbol of a full tray"),
                .init(symbolName: "highlighter", description: "Symbol of a highlighter"),
                .init(symbolName: "pencil.and.outline", description: "Symbol of a pencil and outline"),
                .init(symbolName: "internaldrive.fill", description: "Symbol of a internal drive"),
                .init(symbolName: "lasso", description: "Symbol of a lasso"),
                .init(symbolName: "hat.widebrim.fill", description: "Symbol of a wide-brim hat"),
                .init(symbolName: "trash.fill", description: "Symbol of a trash bin"),
                .init(symbolName: "oar.2.crossed", description: "Symbol of two crossed oars"),
                .init(symbolName: "text.document", description: "Symbol of a document"),
                .init(symbolName: "ruler.fill", description: "Symbol of a ruler"),
                .init(symbolName: "folder.fill", description: "Symbol of a folder"),
                .init(symbolName: "paperplane.fill", description: "Symbol of a paper plane"),
                .init(symbolName: "tray.fill", description: "Symbol of a tray"),
                .init(symbolName: "tray.2.fill", description: "Symbol of a double tray"),
                .init(symbolName: "teddybear.fill", description: "Symbol of a teddybear"),
                .init(symbolName: "newspaper.fill", description: "Symbol of a newspaper"),
                .init(symbolName: "externaldrive.fill", description: "Symbol of an external drive"),
                .init(symbolName: "archivebox.fill", description: "Symbol of an archive box"),
                .init(symbolName: "document.fill", description: "Symbol of a document"),
                .init(symbolName: "link", description: "Symbol of a link"),
                .init(symbolName: "text.document.fill", description: "Symbol of a text document"),
                .init(symbolName: "calendar", description: "Symbol of a calendar"),
                .init(symbolName: "photo.artframe", description: "Symbol of a framed photo"),
                .init(symbolName: "book.fill", description: "Symbol of a book"),
                .init(symbolName: "crown.fill", description: "Symbol of a crown"),
                .init(symbolName: "books.vertical.fill", description: "Symbol of vertically stacked books"),
                .init(symbolName: "book.closed.fill", description: "Symbol of a closed book"),
                .init(symbolName: "text.book.closed.fill", description: "Symbol of a closed text book"),
                .init(symbolName: "character.book.closed.fill", description: "Symbol of a closed character book"),
                .init(symbolName: "tshirt.fill", description: "Symbol of a T-shirt"),
                .init(symbolName: "jacket.fill", description: "Symbol of a jacket"),
                .init(symbolName: "shoe.fill", description: "Symbol of a shoe"),
                .init(symbolName: "film.fill", description: "Symbol of a film reel"),
                .init(symbolName: "flask.fill", description: "Symbol of a flask"),
                .init(symbolName: "menucard.fill", description: "Symbol of a menu card"),
                .init(symbolName: "magazine.fill", description: "Symbol of a magazine"),
                .init(symbolName: "bookmark.fill", description: "Symbol of a bookmark"),
                .init(symbolName: "graduationcap.fill", description: "Symbol of a graduation cap"),
                .init(symbolName: "pencil.and.ruler.fill", description: "Symbol of a pencil and ruler"),
                .init(symbolName: "backpack.fill", description: "Symbol of a backpack"),
                .init(symbolName: "studentdesk", description: "Symbol of a student desk"),
                .init(symbolName: "paperclip", description: "Symbol of a paperclip"),
                .init(symbolName: "lanyardcard.fill", description: "Symbol of a lanyard with card"),
                .init(symbolName: "dumbbell.fill", description: "Symbol of a dumbbell"),
                .init(symbolName: "tennis.racket", description: "Symbol of a tennis racket"),
                .init(symbolName: "rosette", description: "Symbol of a rosette"),
                .init(symbolName: "duffle.bag.fill", description: "Symbol of a duffle bag"),
                .init(symbolName: "medal.fill", description: "Symbol of a medal"),
                .init(symbolName: "fire.extinguisher.fill", description: "Symbol of a fire extinguisher"),
                .init(symbolName: "beach.umbrella.fill", description: "Symbol of a beach umbrella"),
                .init(symbolName: "umbrella.fill", description: "Symbol of an umbrella"),
                .init(symbolName: "megaphone.fill", description: "Symbol of a megaphone"),
                .init(symbolName: "speaker.wave.3.fill", description: "Symbol of a speaker with sound waves"),
                .init(symbolName: "music.microphone", description: "Symbol of a microphone"),
                .init(symbolName: "key.card.fill", description: "Symbol of a key card"),
                .init(symbolName: "minus.plus.batteryblock.fill", description: "Symbol of a battery block with plus and minus signs"),
                .init(symbolName: "magnifyingglass", description: "Symbol of a magnifying glass"),
                .init(symbolName: "medal.star.fill", description: "Symbol of a star-shaped medal"),
                .init(symbolName: "shield.fill", description: "Symbol of a shield"),
                .init(symbolName: "staroflife.shield.fill", description: "Symbol of a Star of Life on a shield"),
                .init(symbolName: "flag.pattern.checkered", description: "Symbol of a checkered flag"),
                .init(symbolName: "bell.fill", description: "Symbol of a bell"),
                .init(symbolName: "tag.fill", description: "Symbol of a tag"),
                .init(symbolName: "bolt.shield.fill", description: "Symbol of a shield with a bolt"),
                .init(symbolName: "medical.thermometer.fill", description: "Symbol of a medical thermometer"),
                .init(symbolName: "flashlight.on.fill", description: "Symbol of a flashlight turned on"),
                .init(symbolName: "camera.fill", description: "Symbol of a camera"),
                .init(symbolName: "gear", description: "Symbol of a gear"),
                .init(symbolName: "gearshape.2.fill", description: "Symbol of a second gear shape"),
                .init(symbolName: "frying.pan.fill", description: "Symbol of a frying pan"),
                .init(symbolName: "scissors", description: "Symbol of a pair of scissors"),
                .init(symbolName: "bag.fill", description: "Symbol of a bag"),
                .init(symbolName: "cart.fill", description: "Symbol of a cart"),
                .init(symbolName: "horn.fill", description: "Symbol of a horn"),
                .init(symbolName: "basket.fill", description: "Symbol of a basket"),
                .init(symbolName: "light.beacon.max.fill", description: "Symbol of a maximum intensity light beacon"),
                .init(symbolName: "creditcard.fill", description: "Symbol of a credit card"),
                .init(symbolName: "wallet.pass.fill", description: "Symbol of a pass wallet"),
                .init(symbolName: "wallet.bifold.fill", description: "Symbol of a bifold wallet"),
                .init(symbolName: "wand.and.sparkles", description: "Symbol of a wand with sparkles"),
                .init(symbolName: "faxmachine.fill", description: "Symbol of a fax machine"),
                .init(symbolName: "puzzlepiece.fill", description: "Symbol of a puzzle piece"),
                .init(symbolName: "gyroscope", description: "Symbol of a gyroscope"),
                .init(symbolName: "metronome.fill", description: "Symbol of a metronome"),
                .init(symbolName: "amplifier", description: "Symbol of an amplifier"),
                .init(symbolName: "dice.fill", description: "Symbol of dice"),
                .init(symbolName: "pianokeys", description: "Symbol of piano keys"),
                .init(symbolName: "suitcase.rolling.fill", description: "Symbol of a rolling suitcase"),
                .init(symbolName: "radio.fill", description: "Symbol of a radio"),
                .init(symbolName: "tuningfork", description: "Symbol of a tuning fork"),
                .init(symbolName: "printer.dotmatrix.fill", description: "Symbol of a dot matrix printer"),
                .init(symbolName: "paintbrush.fill", description: "Symbol of a paintbrush"),
                .init(symbolName: "paintbrush.pointed.fill", description: "Symbol of a pointed paintbrush"),
                .init(symbolName: "poweroutlet.strip.fill", description: "Symbol of a power outlet strip"),
                .init(symbolName: "level.fill", description: "Symbol of a level"),
                .init(symbolName: "wrench.adjustable.fill", description: "Symbol of an adjustable wrench"),
                .init(symbolName: "book.and.wrench.fill", description: "Symbol of a book with a wrench"),
                .init(symbolName: "comb.fill", description: "Symbol of a comb"),
                .init(symbolName: "hammer.fill", description: "Symbol of a hammer"),
                .init(symbolName: "screwdriver.fill", description: "Symbol of a screwdriver"),
                .init(symbolName: "fossil.shell.fill", description: "Symbol of a fossil shell"),
                .init(symbolName: "eyedropper.halffull", description: "Symbol of an eyedropper half full"),
                .init(symbolName: "wrench.and.screwdriver.fill", description: "Symbol of a wrench and screwdriver"),
                .init(symbolName: "hifireceiver.fill", description: "Symbol of a HiFi receiver"),
                .init(symbolName: "lifepreserver", description: "Symbol of a life preserver"),
                .init(symbolName: "scroll.fill", description: "Symbol of a scroll"),
                .init(symbolName: "printer.fill", description: "Symbol of a printer"),
                .init(symbolName: "scanner.fill", description: "Symbol of a scanner"),
                .init(symbolName: "handbag.fill", description: "Symbol of a handbag"),
                .init(symbolName: "briefcase.fill", description: "Symbol of a briefcase"),
                .init(symbolName: "balloon.2.fill", description: "Symbol of two balloons"),
                .init(symbolName: "case.fill", description: "Symbol of a case"),
                .init(symbolName: "latch.2.case.fill", description: "Symbol of two latches on a case"),
                .init(symbolName: "globe.desk.fill", description: "Symbol of a globe on a desk"),
                .init(symbolName: "cross.case.fill", description: "Symbol of a case with a cross"),
                .init(symbolName: "guitars.fill", description: "Symbol of guitars"),
                .init(symbolName: "drone.fill", description: "Symbol of a drone"),
                .init(symbolName: "helmet.fill", description: "Symbol of a helmet"),
                .init(symbolName: "stroller.fill", description: "Symbol of a stroller"),
                .init(symbolName: "movieclapper.fill", description: "Symbol of a movie clapper"),
                .init(symbolName: "suitcase.fill", description: "Symbol of a suitcase"),
                .init(symbolName: "theatermasks.fill", description: "Symbol of theater masks"),
                .init(symbolName: "theatermask.and.paintbrush.fill", description: "Symbol of a theater mask with a paintbrush"),
                .init(symbolName: "popcorn.fill", description: "Symbol of popcorn"),
                .init(symbolName: "chair.fill", description: "Symbol of a chair"),
                .init(symbolName: "cabinet.fill", description: "Symbol of a cabinet"),
                .init(symbolName: "tent.fill", description: "Symbol of a tent"),
                .init(symbolName: "gift.fill", description: "Symbol of a gift"),
                .init(symbolName: "house.lodge.fill", description: "Symbol of a house or lodge"),
                .init(symbolName: "house.and.flag.fill", description: "Symbol of a house with a flag"),
                .init(symbolName: "signpost.left.fill", description: "Symbol of a left signpost"),
                .init(symbolName: "signpost.right.fill", description: "Symbol of a right signpost"),
                .init(symbolName: "signpost.right.and.left.fill", description: "Symbol of a signpost pointing right and left"),
                .init(symbolName: "building.2.fill", description: "Symbol of a building"),
                .init(symbolName: "sunglasses.fill", description: "Symbol of sunglasses"),
                .init(symbolName: "binoculars.fill", description: "Symbol of binoculars"),
                .init(symbolName: "lock.fill", description: "Symbol of a lock"),
                .init(symbolName: "key.fill", description: "Symbol of a key"),
                .init(symbolName: "key.2.on.ring.fill", description: "Symbol of two keys on a ring"),
                .init(symbolName: "cpu.fill", description: "Symbol of a CPU"),
                .init(symbolName: "memorychip.fill", description: "Symbol of a memory chip"),
                .init(symbolName: "opticaldisc.fill", description: "Symbol of an optical disc"),
                .init(symbolName: "sensor.tag.radiowaves.forward.fill", description: "Symbol of a sensor with radiowaves"),
                .init(symbolName: "watch.analog", description: "Symbol of an analog watch"),
                .init(symbolName: "shippingbox.fill", description: "Symbol of a shipping box"),
                .init(symbolName: "swatchpalette.fill", description: "Symbol of a swatch palette"),
                .init(symbolName: "mug.fill", description: "Symbol of a mug"),
                .init(symbolName: "wineglass.fill", description: "Symbol of a wineglass"),
                .init(symbolName: "birthday.cake.fill", description: "Symbol of a birthday cake"),
                .init(symbolName: "scalemass.fill", description: "Symbol of a mass scale"),
                .init(symbolName: "simcard.fill", description: "Symbol of a SIM card"),
                .init(symbolName: "sdcard.fill", description: "Symbol of an SD card"),
                .init(symbolName: "waterbottle.fill", description: "Symbol of a water bottle"),
                .init(symbolName: "cup.and.heat.waves.fill", description: "Symbol of a cup with heat waves"),
                .init(symbolName: "esim.fill", description: "Symbol of an eSIM"),
                .init(symbolName: "carrot.fill", description: "Symbol of a carrot"),
                .init(symbolName: "battery.100percent", description: "Symbol of a fully charged battery")
            ]
        ),
        .init(
            title: "Gaming",
            symbols: [
                .init(symbolName: "house.fill", description: "Symbol of a house"),
                .init(symbolName: "gamecontroller.fill", description: "Symbol of a game controller"),
                .init(symbolName: "flag.pattern.checkered", description: "Symbol of a checkered flag"),
                .init(symbolName: "flag.2.crossed.fill", description: "Symbol of two crossed flags"),
                .init(symbolName: "flag.pattern.checkered.2.crossed", description: "Symbol of two crossed checkered flags"),
                .init(symbolName: "xmark", description: "Symbol of an xmark"),
                .init(symbolName: "target", description: "Symbol of a target"),
                .init(symbolName: "scope", description: "Symbol of a scope"),
                .init(symbolName: "playstation.logo", description: "Symbol of the PlayStation logo"),
                .init(symbolName: "xbox.logo", description: "Symbol of the Xbox logo"),
                .init(symbolName: "arcade.stick.console.fill", description: "Symbol of an arcade stick console"),
                .init(symbolName: "formfitting.gamecontroller.fill", description: "Symbol of a form-fitting game controller")
            ]
        ),
        .init(
            title: "Home",
            symbols: [
                .init(symbolName: "house.fill", description: "Symbol of a house"),
                .init(symbolName: "lightbulb.fill", description: "Symbol of a lightbulb"),
                .init(symbolName: "lamp.desk.fill", description: "Symbol of a desk lamp"),
                .init(symbolName: "sink.fill", description: "Symbol of a sink"),
                .init(symbolName: "washer.fill", description: "Symbol of a washer"),
                .init(symbolName: "fan.fill", description: "Symbol of a fan"),
                .init(symbolName: "av.remote.fill", description: "Symbol of an AV remote"),
                .init(symbolName: "humidifier.and.droplets.fill", description: "Symbol of a humidifier with droplets"),
                .init(symbolName: "entry.lever.keypad.fill", description: "Symbol of an entry lever keypad"),
                .init(symbolName: "poweroutlet.strip.fill", description: "Symbol of a power outlet strip"),
                .init(symbolName: "roller.shade.closed", description: "Symbol of a closed roller shade"),
                .init(symbolName: "sensor.fill", description: "Symbol of a sensor"),
                .init(symbolName: "sofa.fill", description: "Symbol of a sofa"),
                .init(symbolName: "robotic.vacuum.fill", description: "Symbol of a robotic vacuum"),
                .init(symbolName: "cooktop.fill", description: "Symbol of a cooktop"),
                .init(symbolName: "chandelier.fill", description: "Symbol of a chandelier"),
                .init(symbolName: "video.doorbell.fill", description: "Symbol of a video doorbell"),
                .init(symbolName: "fan.floor.fill", description: "Symbol of a floor fan"),
                .init(symbolName: "shower.fill", description: "Symbol of a shower"),
                .init(symbolName: "fireplace.fill", description: "Symbol of a fireplace"),
                .init(symbolName: "chair.lounge.fill", description: "Symbol of a lounge chair"),
                .init(symbolName: "fan.ceiling.fill", description: "Symbol of a ceiling fan"),
                .init(symbolName: "lamp.ceiling.inverse", description: "Symbol of an inverse ceiling lamp"),
                .init(symbolName: "homekit", description: "Symbol of HomeKit"),
                .init(symbolName: "dishwasher.fill", description: "Symbol of a dishwasher"),
                .init(symbolName: "dryer.fill", description: "Symbol of a dryer"),
                .init(symbolName: "pedestrian.gate.closed", description: "Symbol of a closed pedestrian gate"),
                .init(symbolName: "shower.handheld.fill", description: "Symbol of a handheld shower"),
                .init(symbolName: "light.cylindrical.ceiling.inverse", description: "Symbol of an inverse cylindrical ceiling light"),
                .init(symbolName: "light.panel.fill", description: "Symbol of a light panel"),
                .init(symbolName: "blinds.vertical.open", description: "Symbol of open vertical blinds"),
                .init(symbolName: "light.recessed.inverse", description: "Symbol of an inverse recessed light"),
                .init(symbolName: "light.recessed.3.inverse", description: "Symbol of three inverse recessed lights"),
                .init(symbolName: "lamp.floor.fill", description: "Symbol of a floor lamp"),
                .init(symbolName: "bathtub.fill", description: "Symbol of a bathtub"),
                .init(symbolName: "oven.fill", description: "Symbol of an oven"),
                .init(symbolName: "door.garage.closed", description: "Symbol of a closed garage door"),
                .init(symbolName: "chair.fill", description: "Symbol of a chair"),
                .init(symbolName: "toilet.fill", description: "Symbol of a toilet"),
                .init(symbolName: "microwave.fill", description: "Symbol of a microwave"),
                .init(symbolName: "blinds.horizontal.open", description: "Symbol of open horizontal blinds"),
                .init(symbolName: "lamp.table.fill", description: "Symbol of a table lamp"),
                .init(symbolName: "fan.and.light.ceiling.fill", description: "Symbol of a ceiling fan and light"),
                .init(symbolName: "hifireceiver.fill", description: "Symbol of a HiFi receiver"),
                .init(symbolName: "light.strip.2.fill", description: "Symbol of two light strips"),
                .init(symbolName: "stove.fill", description: "Symbol of a stove"),
                .init(symbolName: "fan.desk.fill", description: "Symbol of a desk fan"),
                .init(symbolName: "refrigerator.fill", description: "Symbol of a refrigerator"),
                .init(symbolName: "light.beacon.max.fill", description: "Symbol of a beacon light"),
                .init(symbolName: "videoprojector.fill", description: "Symbol of a video projector"),
                .init(symbolName: "web.camera.fill", description: "Symbol of a web camera"),
                .init(symbolName: "air.purifier.fill", description: "Symbol of an air purifier"),
                .init(symbolName: "door.left.hand.closed", description: "Symbol of a closed left-hand door"),
                .init(symbolName: "cabinet.fill", description: "Symbol of a cabinet"),
                .init(symbolName: "sprinkler.and.droplets.fill", description: "Symbol of a sprinkler with droplets"),
                .init(symbolName: "spigot.fill", description: "Symbol of a spigot")
            ]
        ),
        .init(
            title: "Commerce",
            symbols: [
                .init(symbolName: "creditcard.fill", description: "Symbol of a credit card"),
                .init(symbolName: "cart.fill", description: "Symbol of a cart"),
                .init(symbolName: "basket.fill", description: "Symbol of a basket"),
                .init(symbolName: "bag.fill", description: "Symbol of a bag"),
                .init(symbolName: "giftcard.fill", description: "Symbol of a gift card"),
                .init(symbolName: "signature", description: "Symbol of a signature"),
                .init(symbolName: "eurosign", description: "Symbol of the Euro sign"),
                .init(symbolName: "centsign", description: "Symbol of the cent sign"),
                .init(symbolName: "chineseyuanrenminbisign", description: "Symbol of the Chinese Yuan Renminbi sign"),
                .init(symbolName: "coloncurrencysign", description: "Symbol of the Colon currency sign"),
                .init(symbolName: "dongsign", description: "Symbol of the Dong sign"),
                .init(symbolName: "eurozonesign", description: "Symbol of the Eurozone sign"),
                .init(symbolName: "dollarsign", description: "Symbol of the dollar sign"),
                .init(symbolName: "bitcoinsign", description: "Symbol of the Bitcoin sign"),
                .init(symbolName: "florinsign", description: "Symbol of the Florin sign"),
                .init(symbolName: "francsign", description: "Symbol of the Franc sign"),
                .init(symbolName: "indianrupeesign", description: "Symbol of the Indian Rupee sign"),
                .init(symbolName: "guaranisign", description: "Symbol of the Guarani sign"),
                .init(symbolName: "danishkronesign", description: "Symbol of the Danish Krone sign"),
                .init(symbolName: "hryvniasign", description: "Symbol of the Hryvnia sign"),
                .init(symbolName: "kipsign", description: "Symbol of the Kip sign"),
                .init(symbolName: "larisign", description: "Symbol of the Lari sign"),
                .init(symbolName: "peruviansolessign", description: "Symbol of the Peruvian Soles sign"),
                .init(symbolName: "pesetasign", description: "Symbol of the Peseta sign"),
                .init(symbolName: "polishzlotysign", description: "Symbol of the Polish Zloty sign"),
                .init(symbolName: "rublesign", description: "Symbol of the Ruble sign"),
                .init(symbolName: "shekelsign", description: "Symbol of the Shekel sign"),
                .init(symbolName: "singaporedollarsign", description: "Symbol of the Singapore Dollar sign"),
                .init(symbolName: "sterlingsign", description: "Symbol of the Sterling sign"),
                .init(symbolName: "tengesign", description: "Symbol of the Tenge sign"),
                .init(symbolName: "tugriksign", description: "Symbol of the Tugrik sign"),
                .init(symbolName: "turkishlirasign", description: "Symbol of the Turkish Lira sign"),
                .init(symbolName: "wonsign", description: "Symbol of the Won sign"),
                .init(symbolName: "yensign", description: "Symbol of the Yen sign"),
                .init(symbolName: "nairasign", description: "Symbol of the Naira sign"),
                .init(symbolName: "norwegiankronesign", description: "Symbol of the Norwegian Krone sign"),
                .init(symbolName: "malaysianringgitsign", description: "Symbol of the Malaysian Ringgit sign"),
                .init(symbolName: "lirasign", description: "Symbol of the Lira sign")
            ]
        ),
        .init(
            title: "Weather",
            symbols: [
                .init(symbolName: "sun.max.fill", description: "Symbol of a sun"),
                .init(symbolName: "sun.horizon.fill", description: "Symbol of a sun on the horizon"),
                .init(symbolName: "sun.haze.fill", description: "Symbol of a sun in haze"),
                .init(symbolName: "sun.rain.fill", description: "Symbol of a sun with rain"),
                .init(symbolName: "sun.snow.fill", description: "Symbol of a sun with snow"),
                .init(symbolName: "moon.fill", description: "Symbol of a moon"),
                .init(symbolName: "moon.dust.fill", description: "Symbol of a moon with dust"),
                .init(symbolName: "cloud.heavyrain.fill", description: "Symbol of a cloud with heavy rain"),
                .init(symbolName: "moon.haze.fill", description: "Symbol of a moon in haze"),
                .init(symbolName: "sparkles", description: "Symbol of sparkles"),
                .init(symbolName: "moon.stars.fill", description: "Symbol of a moon with stars"),
                .init(symbolName: "cloud.fill", description: "Symbol of a cloud"),
                .init(symbolName: "cloud.rain.fill", description: "Symbol of a cloud with rain"),
                .init(symbolName: "cloud.hail.fill", description: "Symbol of a cloud with hail"),
                .init(symbolName: "cloud.snow.fill", description: "Symbol of a cloud with snow"),
                .init(symbolName: "cloud.bolt.rain.fill", description: "Symbol of a cloud with bolt and rain"),
                .init(symbolName: "cloud.sun.fill", description: "Symbol of a cloud with sun"),
                .init(symbolName: "cloud.sun.rain.fill", description: "Symbol of a cloud with sun and rain"),
                .init(symbolName: "cloud.moon.fill", description: "Symbol of a cloud with moon"),
                .init(symbolName: "smoke.fill", description: "Symbol of smoke"),
                .init(symbolName: "wind", description: "Symbol of wind"),
                .init(symbolName: "snowflake", description: "Symbol of a snowflake"),
                .init(symbolName: "tornado", description: "Symbol of a tornado"),
                .init(symbolName: "hurricane", description: "Symbol of a hurricane"),
                .init(symbolName: "thermometer.variable", description: "Symbol of a variable thermometer"),
                .init(symbolName: "aqi.medium", description: "Symbol of air quality index medium"),
                .init(symbolName: "rainbow", description: "Symbol of a rainbow"),
                .init(symbolName: "cloud.rainbow.crop.fill", description: "Symbol of a cloud with a cropped rainbow")
            ]
        ),
        .init(
            title: "Nature",
            symbols: [
                .init(symbolName: "carrot.fill", description: "Symbol of a carrot"),
                .init(symbolName: "globe.americas.fill", description: "Symbol of the Americas globe"),
                .init(symbolName: "sun.max.fill", description: "Symbol of a sun with maximum brightness"),
                .init(symbolName: "bird.fill", description: "Symbol of a bird"),
                .init(symbolName: "ant.fill", description: "Symbol of an ant"),
                .init(symbolName: "leaf.fill", description: "Symbol of a leaf"),
                .init(symbolName: "sun.dust.fill", description: "Symbol of a sun in dust"),
                .init(symbolName: "tropicalstorm", description: "Symbol of a tropical storm"),
                .init(symbolName: "lizard.fill", description: "Symbol of a lizard"),
                .init(symbolName: "fossil.shell.fill", description: "Symbol of a fossil shell"),
                .init(symbolName: "moonphase.waxing.crescent", description: "Symbol of a waxing crescent moon phase"),
                .init(symbolName: "cloud.sleet.fill", description: "Symbol of a cloud with sleet"),
                .init(symbolName: "wind", description: "Symbol of wind"),
                .init(symbolName: "hurricane", description: "Symbol of a hurricane"),
                .init(symbolName: "flame.fill", description: "Symbol of a flame"),
                .init(symbolName: "water.waves", description: "Symbol of water waves"),
                .init(symbolName: "ladybug.fill", description: "Symbol of a ladybug"),
                .init(symbolName: "fish.fill", description: "Symbol of a fish"),
                .init(symbolName: "drop.fill", description: "Symbol of a drop"),
                .init(symbolName: "bolt.fill", description: "Symbol of a bolt"),
                .init(symbolName: "mountain.2.fill", description: "Symbol of two mountains"),
                .init(symbolName: "dog.fill", description: "Symbol of a dog"),
                .init(symbolName: "atom", description: "Symbol of an atom"),
                .init(symbolName: "tree.fill", description: "Symbol of a tree"),
                .init(symbolName: "cat.fill", description: "Symbol of a cat"),
                .init(symbolName: "apple.meditate", description: "Symbol of Apple meditate")
            ]
        ),
        .init(
            title: "Human",
            symbols: [
                .init(symbolName: "person.fill", description: "Symbol of a person"),
                .init(symbolName: "shareplay", description: "Symbol of SharePlay"),
                .init(symbolName: "person.2.fill", description: "Symbol of two people"),
                .init(symbolName: "person.3.fill", description: "Symbol of three people"),
                .init(symbolName: "person.bust.fill", description: "Symbol of a person bust"),
                .init(symbolName: "figure.stand", description: "Symbol of a standing figure"),
                .init(symbolName: "figure.stand.dress", description: "Symbol of a standing figure in a dress"),
                .init(symbolName: "figure.arms.open", description: "Symbol of a figure with open arms"),
                .init(symbolName: "figure", description: "Symbol of a figure"),
                .init(symbolName: "figure.walk", description: "Symbol of a walking figure"),
                .init(symbolName: "figure.fall", description: "Symbol of a falling figure"),
                .init(symbolName: "figure.run", description: "Symbol of a running figure"),
                .init(symbolName: "person.wave.2.fill", description: "Symbol of two people waving"),
                .init(symbolName: "figure.roll", description: "Symbol of a rolling figure"),
                .init(symbolName: "figure.yoga", description: "Symbol of a yoga figure"),
                .init(symbolName: "nose.fill", description: "Symbol of a nose"),
                .init(symbolName: "mustache.fill", description: "Symbol of a mustache"),
                .init(symbolName: "mouth.fill", description: "Symbol of a mouth")
            ]
        ),
        .init(
            title: "Keyboard",
            symbols: [
                .init(symbolName: "globe", description: "Symbol of a globe"),
                .init(symbolName: "keyboard.fill", description: "Symbol of a keyboard"),
                .init(symbolName: "command", description: "Symbol of the command key"),
                .init(symbolName: "control", description: "Symbol of the control key"),
                .init(symbolName: "eject.fill", description: "Symbol of the eject key"),
                .init(symbolName: "capslock.fill", description: "Symbol of the caps lock key"),
                .init(symbolName: "delete.left.fill", description: "Symbol of the delete left key"),
                .init(symbolName: "power", description: "Symbol of the power key"),
                .init(symbolName: "option", description: "Symbol of the option key"),
                .init(symbolName: "alt", description: "Symbol of the alt key")
            ]
        ),
        .init(
            title: "Camera & Photos",
            symbols: [
                .init(symbolName: "swirl.circle.righthalf.filled", description: "Symbol of a right half filled swirl circle"),
                .init(symbolName: "circle.lefthalf.filled.righthalf.striped.horizontal", description: "Symbol of a left half filled, right half horizontally stripecircle"),
                .init(symbolName: "circle.dotted.circle", description: "Symbol of a dotted circle within a circle"),
                .init(symbolName: "bolt.fill", description: "Symbol of a bolt"),
                .init(symbolName: "camera.filters", description: "Symbol of camera filters"),
                .init(symbolName: "livephoto", description: "Symbol of Live Photo"),
                .init(symbolName: "camera.shutter.button.fill", description: "Symbol of a camera shutter button"),
                .init(symbolName: "camera.fill", description: "Symbol of a camera"),
                .init(symbolName: "camera.macro", description: "Symbol of a macro camera"),
                .init(symbolName: "plus.viewfinder", description: "Symbol of a plus viewfinder"),
                .init(symbolName: "camera.viewfinder", description: "Symbol of a camera viewfinder"),
                .init(symbolName: "camera.aperture", description: "Symbol of a camera aperture"),
                .init(symbolName: "f.cursive", description: "Symbol of a cursive f"),
                .init(symbolName: "photo.fill", description: "Symbol of a photo")
            ]
        ),
        .init(
            title: "Communication",
            symbols: [
                .init(symbolName: "microphone.fill", description: "Symbol of a microphone"),
                .init(symbolName: "message.fill", description: "Symbol of a message"),
                .init(symbolName: "checkmark.message.fill", description: "Symbol of a checkmark message"),
                .init(symbolName: "bubble.fill", description: "Symbol of a bubble"),
                .init(symbolName: "exclamationmark.bubble.fill", description: "Symbol of an exclamation mark bubble"),
                .init(symbolName: "phone.fill", description: "Symbol of a phone"),
                .init(symbolName: "phone.down.fill", description: "Symbol of a phone down"),
                .init(symbolName: "teletype", description: "Symbol of a teletype"),
                .init(symbolName: "tray.full.fill", description: "Symbol of a full tray"),
                .init(symbolName: "tray.2.fill", description: "Symbol of two trays"),
                .init(symbolName: "video.fill", description: "Symbol of a video"),
                .init(symbolName: "deskview.fill", description: "Symbol of a desk view"),
                .init(symbolName: "envelope.front.fill", description: "Symbol of a front envelope"),
                .init(symbolName: "envelope.fill", description: "Symbol of an envelope"),
                .init(symbolName: "envelope.open.fill", description: "Symbol of an open envelope"),
                .init(symbolName: "waveform", description: "Symbol of a waveform"),
                .init(symbolName: "recordingtape", description: "Symbol of a recording tape")
            ]
        ),
        .init(
            title: "Media",
            symbols: [
                .init(symbolName: "play.fill", description: "Symbol of a play button"),
                .init(symbolName: "play.rectangle.fill", description: "Symbol of a play rectangle"),
                .init(symbolName: "pause.fill", description: "Symbol of a pause button"),
                .init(symbolName: "playpause.fill", description: "Symbol of a play/pause button"),
                .init(symbolName: "backward.fill", description: "Symbol of a backward button"),
                .init(symbolName: "forward.fill", description: "Symbol of a forward button"),
                .init(symbolName: "shuffle", description: "Symbol of shuffle"),
                .init(symbolName: "repeat", description: "Symbol of repeat"),
                .init(symbolName: "arrow.trianglehead.clockwise", description: "Symbol of a clockwise triangle arrow"),
                .init(symbolName: "infinity", description: "Symbol of infinity"),
                .init(symbolName: "play.house.fill", description: "Symbol of a play house")
            ]
        ),
        .init(
            title: "Connectivity",
            symbols: [
                .init(symbolName: "externaldrive.connected.to.line.below.fill", description: "Symbol of an external drive connected to a line below"),
                .init(symbolName: "personalhotspot", description: "Symbol of a personal hotspot"),
                .init(symbolName: "network", description: "Symbol of a network"),
                .init(symbolName: "bolt.horizontal.fill", description: "Symbol of a horizontal bolt"),
                .init(symbolName: "icloud.fill", description: "Symbol of iCloud"),
                .init(symbolName: "wifi", description: "Symbol of WiFi"),
                .init(symbolName: "dot.radiowaves.left.and.right", description: "Symbol of dot radiowaves left and right"),
                .init(symbolName: "cellularbars", description: "Symbol of cellular bars"),
                .init(symbolName: "bonjour", description: "Symbol of Bonjour")
            ]
        ),
        .init(
            title: "Fitness",
            symbols: [
                .init(symbolName: "flame.fill", description: "Symbol of a flame"),
                .init(symbolName: "dumbbell.fill", description: "Symbol of a dumbbell"),
                .init(symbolName: "sportscourt.fill", description: "Symbol of a sports court"),
                .init(symbolName: "surfboard.fill", description: "Symbol of a surfboard"),
                .init(symbolName: "duffle.bag.fill", description: "Symbol of a duffle bag"),
                .init(symbolName: "soccerball", description: "Symbol of a soccer ball"),
                .init(symbolName: "baseball.fill", description: "Symbol of a baseball"),
                .init(symbolName: "trophy.fill", description: "Symbol of a trophy"),
                .init(symbolName: "medal.fill", description: "Symbol of a medal"),
                .init(symbolName: "basketball.fill", description: "Symbol of a basketball"),
                .init(symbolName: "american.football.fill", description: "Symbol of an American football"),
                .init(symbolName: "american.football.professional.fill", description: "Symbol of a professional American football"),
                .init(symbolName: "rugbyball.fill", description: "Symbol of a rugby ball"),
                .init(symbolName: "tennis.racket", description: "Symbol of a tennis racket"),
                .init(symbolName: "hockey.puck.fill", description: "Symbol of a hockey puck"),
                .init(symbolName: "tennisball.fill", description: "Symbol of a tennis ball"),
                .init(symbolName: "volleyball.fill", description: "Symbol of a volleyball"),
                .init(symbolName: "skateboard.fill", description: "Symbol of a skateboard"),
                .init(symbolName: "skis.fill", description: "Symbol of skis"),
                .init(symbolName: "snowboard.fill", description: "Symbol of a snowboard"),
                .init(symbolName: "figure.walk", description: "Symbol of a walking figure"),
                .init(symbolName: "figure.walk.motion", description: "Symbol of a walking figure in motion"),
                .init(symbolName: "figure.run", description: "Symbol of a running figure"),
                .init(symbolName: "figure.run.treadmill", description: "Symbol of a running figure on a treadmill"),
                .init(symbolName: "figure.walk.treadmill", description: "Symbol of a walking figure on a treadmill"),
                .init(symbolName: "figure.roll", description: "Symbol of a rolling figure"),
                .init(symbolName: "figure.american.football", description: "Symbol of an American football figure"),
                .init(symbolName: "figure.archery", description: "Symbol of an archery figure"),
                .init(symbolName: "figure.australian.football", description: "Symbol of an Australian football figure"),
                .init(symbolName: "figure.badminton", description: "Symbol of a badminton figure"),
                .init(symbolName: "figure.barre", description: "Symbol of a barre figure"),
                .init(symbolName: "figure.baseball", description: "Symbol of a baseball figure"),
                .init(symbolName: "figure.basketball", description: "Symbol of a basketball figure"),
                .init(symbolName: "figure.bowling", description: "Symbol of a bowling figure"),
                .init(symbolName: "figure.boxing", description: "Symbol of a boxing figure"),
                .init(symbolName: "figure.climbing", description: "Symbol of a climbing figure"),
                .init(symbolName: "figure.cooldown", description: "Symbol of a cooldown figure"),
                .init(symbolName: "figure.core.training", description: "Symbol of a core training figure"),
                .init(symbolName: "figure.cricket", description: "Symbol of a cricket figure"),
                .init(symbolName: "figure.skiing.crosscountry", description: "Symbol of a cross-country skiing figure"),
                .init(symbolName: "figure.cross.training", description: "Symbol of a cross-training figure"),
                .init(symbolName: "figure.curling", description: "Symbol of a curling figure"),
                .init(symbolName: "figure.dance", description: "Symbol of a dance figure"),
                .init(symbolName: "figure.disc.sports", description: "Symbol of a disc sports figure"),
                .init(symbolName: "figure.skiing.downhill", description: "Symbol of a downhill skiing figure"),
                .init(symbolName: "figure.elliptical", description: "Symbol of an elliptical figure"),
                .init(symbolName: "figure.equestrian.sports", description: "Symbol of an equestrian sports figure"),
                .init(symbolName: "figure.fencing", description: "Symbol of a fencing figure"),
                .init(symbolName: "figure.fishing", description: "Symbol of a fishing figure"),
                .init(symbolName: "figure.flexibility", description: "Symbol of a flexibility figure"),
                .init(symbolName: "figure.strengthtraining.functional", description: "Symbol of a functional strength training figure"),
                .init(symbolName: "figure.golf", description: "Symbol of a golf figure"),
                .init(symbolName: "figure.gymnastics", description: "Symbol of a gymnastics figure"),
                .init(symbolName: "figure.hand.cycling", description: "Symbol of a hand cycling figure"),
                .init(symbolName: "figure.handball", description: "Symbol of a handball figure"),
                .init(symbolName: "figure.highintensity.intervaltraining", description: "Symbol of a high-intensity interval training figure"),
                .init(symbolName: "figure.hiking", description: "Symbol of a hiking figure"),
                .init(symbolName: "figure.hockey", description: "Symbol of a hockey figure"),
                .init(symbolName: "figure.field.hockey", description: "Symbol of a field hockey figure"),
                .init(symbolName: "figure.ice.hockey", description: "Symbol of an ice hockey figure"),
                .init(symbolName: "figure.hunting", description: "Symbol of a hunting figure"),
                .init(symbolName: "figure.indoor.cycle", description: "Symbol of an indoor cycle figure"),
                .init(symbolName: "figure.jumprope", description: "Symbol of a jump rope figure"),
                .init(symbolName: "figure.kickboxing", description: "Symbol of a kickboxing figure"),
                .init(symbolName: "figure.lacrosse", description: "Symbol of a lacrosse figure"),
                .init(symbolName: "figure.martial.arts", description: "Symbol of a martial arts figure"),
                .init(symbolName: "figure.mind.and.body", description: "Symbol of a mind and body figure"),
                .init(symbolName: "figure.mixed.cardio", description: "Symbol of a mixed cardio figure"),
                .init(symbolName: "figure.open.water.swim", description: "Symbol of an open water swim figure"),
                .init(symbolName: "figure.outdoor.cycle", description: "Symbol of an outdoor cycle figure"),
                .init(symbolName: "oar.2.crossed", description: "Symbol of two crossed oars"),
                .init(symbolName: "figure.pickleball", description: "Symbol of a pickleball figure"),
                .init(symbolName: "figure.pilates", description: "Symbol of a Pilates figure"),
                .init(symbolName: "figure.play", description: "Symbol of a play figure"),
                .init(symbolName: "figure.pool.swim", description: "Symbol of a pool swim figure"),
                .init(symbolName: "figure.racquetball", description: "Symbol of a racquetball figure"),
                .init(symbolName: "figure.rolling", description: "Symbol of a rolling figure"),
                .init(symbolName: "figure.indoor.rowing", description: "Symbol of an indoor rowing figure"),
                .init(symbolName: "figure.outdoor.rowing", description: "Symbol of an outdoor rowing figure"),
                .init(symbolName: "figure.rugby", description: "Symbol of a rugby figure"),
                .init(symbolName: "figure.sailing", description: "Symbol of a sailing figure"),
                .init(symbolName: "figure.skateboarding", description: "Symbol of a skateboarding figure"),
                .init(symbolName: "figure.ice.skating", description: "Symbol of an ice skating figure"),
                .init(symbolName: "figure.snowboarding", description: "Symbol of a snowboarding figure"),
                .init(symbolName: "figure.indoor.soccer", description: "Symbol of an indoor soccer figure"),
                .init(symbolName: "figure.outdoor.soccer", description: "Symbol of an outdoor soccer figure"),
                .init(symbolName: "figure.socialdance", description: "Symbol of a social dance figure"),
                .init(symbolName: "figure.softball", description: "Symbol of a softball figure"),
                .init(symbolName: "figure.squash", description: "Symbol of a squash figure"),
                .init(symbolName: "figure.stair.stepper", description: "Symbol of a stair stepper figure"),
                .init(symbolName: "figure.stairs", description: "Symbol of a stairs figure"),
                .init(symbolName: "figure.step.training", description: "Symbol of a step training figure"),
                .init(symbolName: "figure.surfing", description: "Symbol of a surfing figure"),
                .init(symbolName: "figure.table.tennis", description: "Symbol of a table tennis figure"),
                .init(symbolName: "figure.taichi", description: "Symbol of a Tai Chi figure"),
                .init(symbolName: "figure.tennis", description: "Symbol of a tennis figure"),
                .init(symbolName: "figure.track.and.field", description: "Symbol of a track and field figure"),
                .init(symbolName: "figure.strengthtraining.traditional", description: "Symbol of a traditional strength training figure"),
                .init(symbolName: "figure.volleyball", description: "Symbol of a volleyball figure"),
                .init(symbolName: "figure.water.fitness", description: "Symbol of a water fitness figure"),
                .init(symbolName: "figure.waterpolo", description: "Symbol of a water polo figure"),
                .init(symbolName: "figure.wrestling", description: "Symbol of a wrestling figure"),
                .init(symbolName: "figure.yoga", description: "Symbol of a yoga figure")
            ]
        ),
        .init(
            title: "Accessibility",
            symbols: [
                .init(symbolName: "figure", description: "Symbol of a figure"),
                .init(symbolName: "hand.tap.fill", description: "Symbol of a hand tap"),
                .init(symbolName: "wheelchair", description: "Symbol of a wheelchair"),
                .init(symbolName: "apple.meditate", description: "Symbol of Apple meditate"),
                .init(symbolName: "ear.fill", description: "Symbol of an ear"),
                .init(symbolName: "quote.bubble.fill", description: "Symbol of a quote bubble"),
                .init(symbolName: "plus.magnifyingglass", description: "Symbol of a plus magnifying glass"),
                .init(symbolName: "tortoise.fill", description: "Symbol of a tortoise"),
                .init(symbolName: "textformat.size", description: "Symbol of text format size"),
                .init(symbolName: "hand.point.up.fill", description: "Symbol of a hand pointing up"),
                .init(symbolName: "hearingdevice.ear.fill", description: "Symbol of a hearing device ear"),
                .init(symbolName: "minus.magnifyingglass", description: "Symbol of a minus magnifying glass"),
                .init(symbolName: "figure.stand.line.dotted.figure.stand", description: "Symbol of a standing figure with a dotted line to another standing figure"),
                .init(symbolName: "figure.roll", description: "Symbol of a rolling figure"),
                .init(symbolName: "character.magnify", description: "Symbol of a character magnifying glass"),
                .init(symbolName: "hare.fill", description: "Symbol of a hare"),
                .init(symbolName: "cursorarrow.motionlines", description: "Symbol of a cursor arrow with motion lines")
            ]
        ),
        .init(
            title: "Time",
            symbols: [
                .init(symbolName: "clock.fill", description: "Symbol of a clock"),
                .init(symbolName: "deskclock.fill", description: "Symbol of a desk clock"),
                .init(symbolName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90", description: "Symbol of a clock arrow counterclockwise rotated 90 degrees"),
                .init(symbolName: "alarm.fill", description: "Symbol of an alarm"),
                .init(symbolName: "alarm.waves.left.and.right.fill", description: "Symbol of an alarm with waves left and right"),
                .init(symbolName: "gauge.with.needle", description: "Symbol of a gauge with a needle"),
                .init(symbolName: "hourglass", description: "Symbol of an hourglass"),
                .init(symbolName: "calendar", description: "Symbol of a calendar"),
                .init(symbolName: "stopwatch.fill", description: "Symbol of a stopwatch"),
                .init(symbolName: "timer", description: "Symbol of a timer")
            ]
        ),
        .init(
            title: "Privacy & Security",
            symbols: [
                .init(symbolName: "lock.open.fill", description: "Symbol of an open lock"),
                .init(symbolName: "nosign", description: "Symbol of a no sign"),
                .init(symbolName: "lock.shield.fill", description: "Symbol of a lock shield"),
                .init(symbolName: "exclamationmark.shield.fill", description: "Symbol of an exclamation mark shield"),
                .init(symbolName: "touchid", description: "Symbol of Touch ID"),
                .init(symbolName: "hand.raised.fill", description: "Symbol of a raised hand"),
                .init(symbolName: "key.2.on.ring.fill", description: "Symbol of two keys on a ring"),
                .init(symbolName: "checkmark", description: "Symbol of a checkmark"),
                .init(symbolName: "xmark.shield.fill", description: "Symbol of an xmark shield"),
                .init(symbolName: "eye.fill", description: "Symbol of an eye"),
                .init(symbolName: "eye.slash.fill", description: "Symbol of an eye slash"),
                .init(symbolName: "lock.fill", description: "Symbol of a lock"),
                .init(symbolName: "key.horizontal.fill", description: "Symbol of a horizontal key"),
                .init(symbolName: "firewall.fill", description: "Symbol of a firewall"),
                .init(symbolName: "checkmark.seal.fill", description: "Symbol of a checkmark seal"),
                .init(symbolName: "key.fill", description: "Symbol of a key"),
                .init(symbolName: "xmark.seal.fill", description: "Symbol of an xmark seal"),
                .init(symbolName: "faceid", description: "Symbol of Face ID")
            ]
        ),
        .init(
            title: "Editing",
            symbols: [
                .init(symbolName: "pencil", description: "Symbol of a pencil"),
                .init(symbolName: "eraser.fill", description: "Symbol of an eraser"),
                .init(symbolName: "scribble.variable", description: "Symbol of a variable scribble"),
                .init(symbolName: "highlighter", description: "Symbol of a highlighter"),
                .init(symbolName: "pencil.tip", description: "Symbol of a pencil tip"),
                .init(symbolName: "lasso", description: "Symbol of a lasso"),
                .init(symbolName: "beziercurve", description: "Symbol of a Bezier curve"),
                .init(symbolName: "loupe", description: "Symbol of a loupe"),
                .init(symbolName: "inset.filled.circle.dashed", description: "Symbol of an inset filled dashed circle"),
                .init(symbolName: "scissors", description: "Symbol of scissors"),
                .init(symbolName: "wand.and.rays", description: "Symbol of a wand and rays"),
                .init(symbolName: "wand.and.sparkles", description: "Symbol of a wand and sparkles"),
                .init(symbolName: "crop", description: "Symbol of crop"),
                .init(symbolName: "paintbrush.fill", description: "Symbol of a paintbrush"),
                .init(symbolName: "paintbrush.pointed.fill", description: "Symbol of a pointed paintbrush"),
                .init(symbolName: "eyedropper", description: "Symbol of an eyedropper"),
                .init(symbolName: "move.3d", description: "Symbol of 3D move"),
                .init(symbolName: "rotate.3d.fill", description: "Symbol of 3D rotate"),
                .init(symbolName: "bandage.fill", description: "Symbol of a bandage"),
                .init(symbolName: "trapezoid.and.line.vertical.fill", description: "Symbol of a trapezoid and vertical line"),
                .init(symbolName: "trapezoid.and.line.horizontal.fill", description: "Symbol of a trapezoid and horizontal line"),
                .init(symbolName: "camera.filters", description: "Symbol of camera filters"),
                .init(symbolName: "skew", description: "Symbol of skew")
            ]
        ),
        .init(
            title: "People",
            symbols: [
                .init(symbolName: "hand.thumbsup.fill", description: "Symbol of a thumbs up hand"),
                .init(symbolName: "hand.thumbsdown.fill", description: "Symbol of a thumbs down hand"),
                .init(symbolName: "person.fill", description: "Symbol of a person"),
                .init(symbolName: "person.bust.fill", description: "Symbol of a person bust"),
                .init(symbolName: "figure.run", description: "Symbol of a running figure"),
                .init(symbolName: "sunglasses.fill", description: "Symbol of sunglasses"),
                .init(symbolName: "hand.wave.fill", description: "Symbol of a waving hand"),
                .init(symbolName: "hand.point.left.fill", description: "Symbol of a hand pointing left"),
                .init(symbolName: "hand.point.up.fill", description: "Symbol of a hand pointing up")
            ]
        ),
        .init(
            title: "Symbols",
            symbols: [
                .init(symbolName: "square.2.layers.3d", description: "Symbol of two 3D layered squares"),
                .init(symbolName: "barcode", description: "Symbol of a barcode"),
                .init(symbolName: "qrcode", description: "Symbol of a QR code"),
                .init(symbolName: "inset.filled.rectangle.and.person.filled", description: "Symbol of an inset filled rectangle and filled person"),
                .init(symbolName: "square.and.arrow.down.fill", description: "Symbol of a square and arrow down"),
                .init(symbolName: "square.and.arrow.up", description: "Symbol of a square and arrow up"),
                .init(symbolName: "questionmark", description: "Symbol of a question mark"),
                .init(symbolName: "info", description: "Symbol of info"),
                .init(symbolName: "swift", description: "Symbol of Swift"),
                .init(symbolName: "peacesign", description: "Symbol of a peace sign"),
                .init(symbolName: "square.grid.2x2.fill", description: "Symbol of a 2x2 grid square"),
                .init(symbolName: "ellipsis", description: "Symbol of ellipsis"),
                .init(symbolName: "circle.dotted", description: "Symbol of a dotted circle"),
                .init(symbolName: "checklist", description: "Symbol of a checklist"),
                .init(symbolName: "square.grid.4x3.fill", description: "Symbol of a 4x3 grid square"),
                .init(symbolName: "point.3.filled.connected.trianglepath.dotted", description: "Symbol of three filled points connected by a dotted triangle path"),
                .init(symbolName: "rays", description: "Symbol of rays"),
                .init(symbolName: "swiftdata", description: "Symbol of SwiftData"),
                .init(symbolName: "timelapse", description: "Symbol of timelapse"),
                .init(symbolName: "circle.circle", description: "Symbol of a circle within a circle"),
                .init(symbolName: "airplay.audio", description: "Symbol of AirPlay audio"),
                .init(symbolName: "airplay.video", description: "Symbol of AirPlay video"),
                .init(symbolName: "music.note", description: "Symbol of a music note"),
                .init(symbolName: "music.note.list", description: "Symbol of a music note list"),
                .init(symbolName: "qrcode.viewfinder", description: "Symbol of a QR code viewfinder"),
                .init(symbolName: "plus.square.on.square.fill", description: "Symbol of a plus square on a square"),
                .init(symbolName: "waveform.path", description: "Symbol of a waveform path"),
                .init(symbolName: "richtext.page.fill", description: "Symbol of a rich text page"),
                .init(symbolName: "text.page.fill", description: "Symbol of a text page"),
                .init(symbolName: "append.page.fill", description: "Symbol of an appended page"),
                .init(symbolName: "terminal.fill", description: "Symbol of a terminal"),
                .init(symbolName: "note.text", description: "Symbol of note text"),
                .init(symbolName: "document.fill", description: "Symbol of a document"),
                .init(symbolName: "text.document.fill", description: "Symbol of a text document"),
                .init(symbolName: "dock.rectangle", description: "Symbol of a dock rectangle"),
                .init(symbolName: "menubar.dock.rectangle", description: "Symbol of a menubar dock rectangle"),
                .init(symbolName: "ecg.text.page.fill", description: "Symbol of an ECG text page"),
                .init(symbolName: "questionmark.text.page.fill", description: "Symbol of a question mark text page"),
                .init(symbolName: "zipper.page", description: "Symbol of a zipper page"),
                .init(symbolName: "person.text.rectangle.fill", description: "Symbol of a person text rectangle"),
                .init(symbolName: "applescript.fill", description: "Symbol of AppleScript"),
                .init(symbolName: "building.columns.fill", description: "Symbol of building columns"),
                .init(symbolName: "sailboat.fill", description: "Symbol of a sailboat"),
                .init(symbolName: "atom", description: "Symbol of an atom"),
                .init(symbolName: "cable.connector", description: "Symbol of a cable connector"),
                .init(symbolName: "audio.jack.stereo", description: "Symbol of a stereo audio jack"),
                .init(symbolName: "applepencil.adapter.usb.c.fill", description: "Symbol of an Apple Pencil USB-C adapter")
            ]
        ),
        .init(
            title: "Arrows",
            symbols: [
                .init(symbolName: "arrowshape.left.fill", description: "Symbol of a left arrow shape"),
                .init(symbolName: "arrowshape.right.fill", description: "Symbol of a right arrow shape"),
                .init(symbolName: "arrowshape.left.arrowshape.right.fill", description: "Symbol of left and right arrow shapes"),
                .init(symbolName: "arrowshape.turn.up.left.fill", description: "Symbol of a turn up left arrow shape"),
                .init(symbolName: "arrowshape.turn.up.right.fill", description: "Symbol of a turn up right arrow shape"),
                .init(symbolName: "arrow.trianglehead.counterclockwise", description: "Symbol of a counterclockwise triangle arrow"),
                .init(symbolName: "arrow.trianglehead.2.counterclockwise.rotate.90", description: "Symbol of two counterclockwise triangle arrows rotated 90 degrees"),
                .init(symbolName: "arrow.trianglehead.topright.capsulepath.clockwise", description: "Symbol of a clockwise triangle arrow with a capsule path"),
                .init(symbolName: "chevron.forward", description: "Symbol of a forward chevron"),
                .init(symbolName: "chevron.backward", description: "Symbol of a backward chevron"),
                .init(symbolName: "chevron.left.chevron.right", description: "Symbol of left and right chevrons"),
                .init(symbolName: "arrow.down.left.arrow.up.right", description: "Symbol of a down left and up right arrow"),
                .init(symbolName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left", description: "Symbol of up left and down right, and up right and dowleft arrows"),
                .init(symbolName: "arrow.up.and.down.and.arrow.left.and.right", description: "Symbol of up and down, and left and right arrows"),
                .init(symbolName: "arrow.3.trianglepath", description: "Symbol of three triangle path arrows"),
                .init(symbolName: "arrow.2.squarepath", description: "Symbol of two square path arrows"),
                .init(symbolName: "arrow.trianglehead.branch", description: "Symbol of a triangle arrow branch")
            ]
        ),
        .init(
            title: "Shapes",
            symbols: [
                .init(symbolName: "circle.fill", description: "Symbol of a circle"),
                .init(symbolName: "app.fill", description: "Symbol of an app"),
                .init(symbolName: "square.fill", description: "Symbol of a square"),
                .init(symbolName: "rectangle.fill", description: "Symbol of a rectangle"),
                .init(symbolName: "rectangle.portrait.fill", description: "Symbol of a portrait rectangle"),
                .init(symbolName: "capsule.fill", description: "Symbol of a capsule"),
                .init(symbolName: "capsule.portrait.fill", description: "Symbol of a portrait capsule"),
                .init(symbolName: "oval.fill", description: "Symbol of an oval"),
                .init(symbolName: "oval.portrait.fill", description: "Symbol of a portrait oval"),
                .init(symbolName: "triangle.fill", description: "Symbol of a triangle"),
                .init(symbolName: "triangleshape.fill", description: "Symbol of a triangle shape"),
                .init(symbolNameFilled: "rectangle.fill.on.rectangle.fill", symbolNameNotFilled: "rectangle.on.rectangle", description: "Symbol of a rectangle on a rectangle"),
                .init(symbolName: "diamond.fill", description: "Symbol of a diamond"),
                .init(symbolName: "octagon.fill", description: "Symbol of an octagon"),
                .init(symbolName: "hexagon.fill", description: "Symbol of a hexagon"),
                .init(symbolName: "pentagon.fill", description: "Symbol of a pentagon"),
                .init(symbolName: "seal.fill", description: "Symbol of a seal"),
                .init(symbolName: "rhombus.fill", description: "Symbol of a rhombus"),
                .init(symbolName: "shield.fill", description: "Symbol of a shield"),
                .init(symbolName: "xmark.triangle.circle.square.fill", description: "Symbol of an xmark, triangle, circle, square"),
                .init(symbolName: "viewfinder", description: "Symbol of a viewfinder"),
                .init(symbolName: "button.horizontal.fill", description: "Symbol of a horizontal button"),
                .init(symbolName: "button.roundedtop.horizontal.fill", description: "Symbol of a rounded top horizontal button"),
                .init(symbolName: "button.roundedbottom.horizontal.fill", description: "Symbol of a rounded bottom horizontal button"),
                .init(symbolName: "button.angledtop.vertical.left.fill", description: "Symbol of an angled top vertical left button"),
                .init(symbolName: "button.angledtop.vertical.right.fill", description: "Symbol of an angled top vertical right button"),
                .init(symbolName: "button.angledbottom.horizontal.left.fill", description: "Symbol of an angled bottom horizontal left button"),
                .init(symbolName: "button.angledbottom.horizontal.right.fill", description: "Symbol of an angled bottom horizontal right button")
            ]
        ),
        .init(
            title: "Maths",
            symbols: [
                .init(symbolName: "x.squareroot", description: "Symbol of x square root"),
                .init(symbolName: "angle", description: "Symbol of an angle"),
                .init(symbolName: "compass.drawing", description: "Symbol of a drawing compass"),
                .init(symbolName: "sum", description: "Symbol of sum"),
                .init(symbolName: "percent", description: "Symbol of percent"),
                .init(symbolName: "function", description: "Symbol of function"),
                .init(symbolName: "plus", description: "Symbol of plus"),
                .init(symbolName: "minus", description: "Symbol of minus"),
                .init(symbolName: "plusminus", description: "Symbol of plus minus"),
                .init(symbolName: "plus.forwardslash.minus", description: "Symbol of plus forward slash minus"),
                .init(symbolName: "multiply", description: "Symbol of multiply"),
                .init(symbolName: "divide", description: "Symbol of divide"),
                .init(symbolName: "equal", description: "Symbol of equal"),
                .init(symbolName: "notequal", description: "Symbol of not equal"),
                .init(symbolName: "lessthan", description: "Symbol of less than"),
                .init(symbolName: "lessthanorequalto", description: "Symbol of less than or equal to"),
                .init(symbolName: "greaterthan", description: "Symbol of greater than"),
                .init(symbolName: "greaterthanorequalto", description: "Symbol of greater than or equal to"),
                .init(symbolName: "number", description: "Symbol of number")
            ]
        ),
        .init(
            title: "Indices",
            symbols: [
                .init(symbolName: "eurosign", description: "Symbol of the Euro sign"),
                .init(symbolName: "centsign", description: "Symbol of the cent sign"),
                .init(symbolName: "chineseyuanrenminbisign", description: "Symbol of the Chinese Yuan Renminbi sign"),
                .init(symbolName: "coloncurrencysign", description: "Symbol of the Colon currency sign"),
                .init(symbolName: "dongsign", description: "Symbol of the Dong sign"),
                .init(symbolName: "eurozonesign", description: "Symbol of the Eurozone sign"),
                .init(symbolName: "dollarsign", description: "Symbol of the dollar sign"),
                .init(symbolName: "bitcoinsign", description: "Symbol of the Bitcoin sign"),
                .init(symbolName: "florinsign", description: "Symbol of the Florin sign"),
                .init(symbolName: "francsign", description: "Symbol of the Franc sign"),
                .init(symbolName: "indianrupeesign", description: "Symbol of the Indian Rupee sign"),
                .init(symbolName: "guaranisign", description: "Symbol of the Guarani sign"),
                .init(symbolName: "danishkronesign", description: "Symbol of the Danish Krone sign"),
                .init(symbolName: "hryvniasign", description: "Symbol of the Hryvnia sign"),
                .init(symbolName: "kipsign", description: "Symbol of the Kip sign"),
                .init(symbolName: "larisign", description: "Symbol of the Lari sign"),
                .init(symbolName: "peruviansolessign", description: "Symbol of the Peruvian Soles sign"),
                .init(symbolName: "pesetasign", description: "Symbol of the Peseta sign"),
                .init(symbolName: "polishzlotysign", description: "Symbol of the Polish Zloty sign"),
                .init(symbolName: "rublesign", description: "Symbol of the Ruble sign"),
                .init(symbolName: "shekelsign", description: "Symbol of the Shekel sign"),
                .init(symbolName: "singaporedollarsign", description: "Symbol of the Singapore Dollar sign"),
                .init(symbolName: "sterlingsign", description: "Symbol of the Sterling sign"),
                .init(symbolName: "tengesign", description: "Symbol of the Tenge sign"),
                .init(symbolName: "tugriksign", description: "Symbol of the Tugrik sign"),
                .init(symbolName: "turkishlirasign", description: "Symbol of the Turkish Lira sign"),
                .init(symbolName: "wonsign", description: "Symbol of the Won sign"),
                .init(symbolName: "yensign", description: "Symbol of the Yen sign"),
                .init(symbolName: "nairasign", description: "Symbol of the Naira sign"),
                .init(symbolName: "norwegiankronesign", description: "Symbol of the Norwegian Krone sign"),
                .init(symbolName: "malaysianringgitsign", description: "Symbol of the Malaysian Ringgit sign"),
                .init(symbolName: "lirasign", description: "Symbol of the Lira sign")
            ]
        ),
        .init(
            title: "Text Formatting",
            symbols: [
                .init(symbolName: "fleuron.fill", description: "Symbol of a fleuron"),
                .init(symbolName: "signature", description: "Symbol of a signature"),
                .init(symbolName: "list.bullet", description: "Symbol of a bullet list"),
                .init(symbolName: "numbers", description: "Symbol of numbers"),
                .init(symbolName: "textformat.size", description: "Symbol of text format size"),
                .init(symbolName: "textformat", description: "Symbol of text format"),
                .init(symbolName: "textformat.superscript", description: "Symbol of text format superscript"),
                .init(symbolName: "textformat.subscript", description: "Symbol of text format subscript"),
                .init(symbolName: "characters.lowercase", description: "Symbol of lowercase characters"),
                .init(symbolName: "characters.uppercase", description: "Symbol of uppercase characters"),
                .init(symbolName: "bold.italic.underline", description: "Symbol of bold italic underline"),
                .init(symbolName: "paragraphsign", description: "Symbol of a paragraph sign"),
                .init(symbolName: "character.magnify", description: "Symbol of character magnify"),
                .init(symbolName: "character.phonetic", description: "Symbol of phonetic character")
            ]
        )
    ]
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        self.useFilledSymbols = useFilledSymbols
        
        if let color {
            self.colorValue = color
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.symbolName = symbolName
        self.isPresented = isPresented
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.useFilledSymbols = useFilledSymbols
        
        if let color {
            self.colorValue = .init(get: {
                color.wrappedValue.color
            }, set: { newValue in
                if let newColor = SymbolColor.allCases.first(where: { $0.color == newValue }) {
                    color.wrappedValue = newColor
                }
            })
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    func loadAllSymbols(for loadedSymbols: Binding<[SymbolSection]>){
        loadedSymbols.wrappedValue = [symbolSections[0], symbolSections[1]]
        Task{
            loadedSymbols.wrappedValue = symbolSections
        }
    }
    public func handleSearchText(for searchText: String, loadedSymbols: Binding<[SymbolSection]>) {
        Task {
            if searchText == "" {
                loadAllSymbols(for: loadedSymbols)
            } else {
                var uniqueSymbols = Set<SymbolModel>()
                print(searchText)
                for sectionSymbols in symbolSections {
                    for symbol in sectionSymbols.symbols {
                        if symbol.description.localizedStandardContains(searchText) && !uniqueSymbols.contains(symbol) {
                            uniqueSymbols.insert(symbol)
                        }
                    }
                }
                loadedSymbols.wrappedValue = [.init(title: "", symbols: Array(uniqueSymbols).sorted())]
            }
        }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        self.useFilledSymbols = useFilledSymbols
        
        if let colorOption = color {
            self.colorValue = Binding(get: {
                Color(red: colorOption.wrappedValue[0], green: colorOption.wrappedValue[1], blue: colorOption.wrappedValue[2])
            }, set: { newValue in
#if canImport(UIKit)
                typealias NativeColor = UIColor
#elseif canImport(AppKit)
                typealias NativeColor = NSColor
#endif
                
                var r: CGFloat = 0
                var g: CGFloat = 0
                var b: CGFloat = 0
                var o: CGFloat = 1
                
#if !os(macOS)
                guard NativeColor(newValue).getRed(&r, green: &g, blue: &b, alpha: &o) else {
                    colorOption.wrappedValue = [0, 0, 0, 1]
                    return
                }
#else
                NativeColor(newValue).usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &o)
#endif
                
                colorOption.wrappedValue = [r, g, b, o]
            })
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        self.useFilledSymbols = useFilledSymbols
        self.colorValue = .constant(.clear)
    }
    
}


public struct SymbolSection: Identifiable, Equatable, Comparable, Hashable{
    public var id: String{ title }
    var title: String
    var symbols: [SymbolModel]
    
    public static func <(lhs: SymbolSection, rhs: SymbolSection) -> Bool {
        return lhs.title < rhs.title
    }
    public static func ==(lhs: SymbolSection, rhs: SymbolSection) -> Bool {
        return lhs.id == rhs.id && lhs.symbols == rhs.symbols
    }
}

public struct SymbolModel: Identifiable, Equatable, Hashable, Comparable{
    public let id: String
    public let filledSymbolName: String
    public let notFilledSymbolName: String
    public let description: String
    public init(symbolName: String, description: String) {
        self.id = symbolName
        self.filledSymbolName = symbolName
        var components = filledSymbolName.components(separatedBy: ".")
        if components.last == "fill"{
            components.removeLast()
        }
        notFilledSymbolName = components.joined(separator: ".")
        self.description = description
    }
    
    public init(symbolNameFilled: String, symbolNameNotFilled: String, description: String) {
        self.id = symbolNameFilled
        self.filledSymbolName = symbolNameFilled
        notFilledSymbolName = symbolNameNotFilled
        self.description = description
    }
    public init(symbolNameFilledNotFilled: String, description: String) {
        self.id = symbolNameFilledNotFilled
        self.filledSymbolName = symbolNameFilledNotFilled
        notFilledSymbolName = symbolNameFilledNotFilled
        self.description = description
    }
    
    
    public static func <(lhs: SymbolModel, rhs: SymbolModel) -> Bool {
        return lhs.filledSymbolName < rhs.filledSymbolName
    }
    public static func ==(lhs: SymbolModel, rhs: SymbolModel) -> Bool {
        return lhs.notFilledSymbolName == rhs.notFilledSymbolName || lhs.filledSymbolName == rhs.filledSymbolName
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(id)-\(notFilledSymbolName)")
    }
}
