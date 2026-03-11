//
//  SPImageView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPImageView: View {
    let image: SPImage
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: image.localURL) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.1)
                case .success(let img):
                    let containerSize = geometry.size
                    let imageRatio = image.width > 0 && image.height > 0 ? image.width / image.height : 1.0
                    
                    let renderW = max(containerSize.width, containerSize.height * imageRatio)
                    let renderH = max(containerSize.height, containerSize.width / imageRatio)
                    
                    let scaledW = renderW * image.zoom
                    let scaledH = renderH * image.zoom
                    
                    let limitX = max(0, (scaledW - containerSize.width) / 2)
                    let limitY = max(0, (scaledH - containerSize.height) / 2)
                    
                    img
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(image.zoom)
                        .offset(x: image.offsetX * limitX, y: image.offsetY * limitY)
                        .frame(width: containerSize.width, height: containerSize.height)
                        .clipped()
                case .failure:
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .drawingGroup()
        .id(image.id)
    }
}
