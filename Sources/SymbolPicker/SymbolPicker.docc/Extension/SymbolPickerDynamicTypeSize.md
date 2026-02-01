# Dynamic Type Support

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(watchOS, introduced: "7.0")
    @Available(tvOS, introduced: "14.0")
    @Available(swift, introduced: "5.3")
    @Available(Xcode, introduced: "12.0")
}

@Options {
    @AutomaticSeeAlso(disabled)
}

The `SymbolPicker` fully supports Dynamic Type, ensuring that text scales appropriately according to the user's system settings.

## Overview

Accessibility is a core feature of `SymbolPicker`. The component is designed to respect the user's preferred text size settings, adapting its layout and font sizes automatically. This ensures readability and usability across a wide range of Dynamic Type sizes, from Extra Small to Accessibility Extra Extra Extra Large.

## Dynamic Type Sizes

@TabNavigator {
    @Tab("iOS") {
        On iOS, `SymbolPicker` adapts to all Dynamic Type sizes, ensuring legibility and proper layout reflow.
        @TabNavigator {
             @Tab("Extra Small") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xsmall-iOS", alt: "Extra Small Dynamic Type") {
                            Extra Small
                        }
                    }
                }
            }
            @Tab("Small") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Small-iOS", alt: "Small Dynamic Type") {
                            Small
                        }
                    }
                }
            }
            @Tab("Medium") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Medium-iOS", alt: "Medium Dynamic Type") {
                            Medium 
                        }
                    }
                }
            }
             @Tab("Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Large-iOS", alt: "Large Dynamic Type") {
                            Large (Default)
                        }
                    }
                }
            }
             @Tab("Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xlarge-iOS", alt: "Extra Large Dynamic Type") {
                            Extra Large
                        }
                    }
                }
            }
             @Tab("Extra Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xxlarge-iOS", alt: "Extra Extra Large Dynamic Type") {
                            Extra Extra Large
                        }
                    }
                }
            }
             @Tab("Extra Extra Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xxxlarge-iOS", alt: "Extra Extra Extra Large Dynamic Type") {
                            Extra Extra Extra Large
                        }
                    }
                }
            }
            @Tab("Accessibility 1") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility1-iOS", alt: "Accessibility 1 Dynamic Type") {
                            Accessibility 1
                        }
                    }
                }
            }
             @Tab("Accessibility 2") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility2-iOS", alt: "Accessibility 2 Dynamic Type") {
                            Accessibility 2
                        }
                    }
                }
            }
             @Tab("Accessibility 3") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility3-iOS", alt: "Accessibility 3 Dynamic Type") {
                            Accessibility 3
                        }
                    }
                }
            }
             @Tab("Accessibility 4") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility4-iOS", alt: "Accessibility 4 Dynamic Type") {
                            Accessibility 4
                        }
                    }
                }
            }
             @Tab("Accessibility 5") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility5-iOS", alt: "Accessibility 5 Dynamic Type") {
                            Accessibility 5
                        }
                    }
                }
            }
        }
    }
    @Tab("iPadOS") {
        On iPadOS, `SymbolPicker` scales appropriately to maintain readability on larger screens across all Dynamic Type settings.
        @TabNavigator {
             @Tab("Extra Small") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xsmall-iPadOS", alt: "Extra Small Dynamic Type") {
                            Extra Small
                        }
                    }
                }
            }
            @Tab("Small") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Small-iPadOS", alt: "Small Dynamic Type") {
                            Small
                        }
                    }
                }
            }
            @Tab("Medium") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Medium-iPadOS", alt: "Medium Dynamic Type") {
                            Medium 
                        }
                    }
                }
            }
             @Tab("Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Large-iPadOS", alt: "Large Dynamic Type") {
                            Large (Default)
                        }
                    }
                }
            }
             @Tab("Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xlarge-iPadOS", alt: "Extra Large Dynamic Type") {
                            Extra Large
                        }
                    }
                }
            }
             @Tab("Extra Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xxlarge-iPadOS", alt: "Extra Extra Large Dynamic Type") {
                            Extra Extra Large
                        }
                    }
                }
            }
             @Tab("Extra Extra Extra Large") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Xxxlarge-iPadOS", alt: "Extra Extra Extra Large Dynamic Type") {
                            Extra Extra Extra Large
                        }
                    }
                }
            }
            @Tab("Accessibility 1") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility1-iPadOS", alt: "Accessibility 1 Dynamic Type") {
                            Accessibility 1
                        }
                    }
                }
            }
             @Tab("Accessibility 2") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility2-iPadOS", alt: "Accessibility 2 Dynamic Type") {
                            Accessibility 2
                        }
                    }
                }
            }
             @Tab("Accessibility 3") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility3-iPadOS", alt: "Accessibility 3 Dynamic Type") {
                            Accessibility 3
                        }
                    }
                }
            }
             @Tab("Accessibility 4") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility4-iPadOS", alt: "Accessibility 4 Dynamic Type") {
                            Accessibility 4
                        }
                    }
                }
            }
             @Tab("Accessibility 5") {
                @Row(numberOfColumns: 1) {
                    @Column {
                        @Image(source: "Documentation-SymbolPickerDynamicTypeSize-Accessibility5-iPadOS", alt: "Accessibility 5 Dynamic Type") {
                            Accessibility 5
                        }
                    }
                }
            }
        }
    }
}
