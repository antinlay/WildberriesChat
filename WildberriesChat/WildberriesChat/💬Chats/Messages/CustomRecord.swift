//
//  CustomRecord.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomRecord: View {
    var body: some View {
        RecordWaveformWithButtons(recording: Recording.message4, colorButton: .white, colorButtonBg: .accent, colorWaveform: .white)
    }
}

#Preview {
    CustomMessage(message: Message.message4, positionInGroup: .single)
}

#Preview("Dark") {
    CustomMessage(message: Message.message4, positionInGroup: .single)
        .preferredColorScheme(.dark)
}

struct RecordWaveformWithButtons: View {
    @StateObject var recordPlayer = RecordingPlayer()

    var recording: Recording

    var colorButton: Color
    var colorButtonBg: Color
    var colorWaveform: Color

    var duration: Int {
        max(Int((recordPlayer.secondsLeft != 0 ? recordPlayer.secondsLeft : recording.duration) - 0.5), 0)
    }

    var body: some View {
        HStack(spacing: 4) {
            Group {
                if recordPlayer.playing {
                    Image(systemName: "pause.fill")
                } else {
                    Image(.Chat.play)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(DateFormatter.timeString(duration))
                        .font(.metadataSecond)
                        .monospacedDigit()
                        .foregroundColor(colorWaveform)
                }
                RecordWaveformPlaying(samples: recording.waveformSamples, progress: recordPlayer.progress, color: colorWaveform, addExtraDots: false)
            }
            .foregroundColor(colorButton)
            .viewSize(30)
            .circleBackground(colorButtonBg)
            .onTapGesture {
                recordPlayer.togglePlay(recording)
            }
            
        }
    }
}

struct RecordWaveformPlaying: View {

    var samples: [CGFloat] // 0...1
    var progress: CGFloat
    var color: Color
    var addExtraDots: Bool

    var maxLength: CGFloat {
        max((RecordWaveform.spacing + RecordWaveform.width) * CGFloat(samples.count) - RecordWaveform.spacing, 0)
    }

    var body: some View {
        ZStack {
            let adjusted = adjustedSamples(maxLength)

            RecordWaveform(samples: adjusted, addExtraDots: addExtraDots)
                .foregroundColor(color.opacity(0.4))

            RecordWaveform(samples: adjusted, addExtraDots: addExtraDots)
                .foregroundColor(color)
                .mask(alignment: .leading) {
                    Rectangle()
                        .frame(width: maxLength * progress, height: 2 * RecordWaveform.maxSampleHeight)
                }
        }
        .frame(height: RecordWaveform.maxSampleHeight)
        .frame(maxWidth: maxLength)
        .fixedSize(horizontal: true, vertical: true)
//        GeometryReader { g in
//            ZStack {
//                let adjusted = adjustedSamples(g.size.width)
//                RecordWaveform(samples: adjusted, addExtraDots: addExtraDots)
//                    .foregroundColor(color.opacity(0.4))
//                RecordWaveform(samples: adjusted, addExtraDots: addExtraDots)
//                    .foregroundColor(color)
//                    .mask(alignment: .leading) {
//                        Rectangle()
//                            .frame(width: maxLength * progress, height: 2*RecordWaveform.maxSampleHeight)
//                    }
//            }
//            .frame(height: RecordWaveform.maxSampleHeight)
//        }
//        .frame(height: RecordWaveform.maxSampleHeight)
//        .applyIf(!addExtraDots) {
//            $0.frame(width: maxLength)
//        }
//        .frame(maxWidth: addExtraDots ? .infinity : maxLength)
//        .fixedSize(horizontal: !addExtraDots, vertical: true)
    }

    func adjustedSamples(_ width: CGFloat) -> [CGFloat] {
        let maxWidth = addExtraDots ? width : UIScreen.main.bounds.width
        let maxSamples = Int(maxWidth / (RecordWaveform.width + RecordWaveform.spacing))

        var adjusted = samples
        var temp = [CGFloat]()
        while adjusted.count > maxSamples {
            var i = 0
            while i < adjusted.count {
                if i == adjusted.count - 1 {
                    temp.append(adjusted[i])
                    break
                }

                temp.append((adjusted[i] + adjusted[i+1])/2)
                i+=2
            }
            adjusted = temp
            temp = []
        }
        return adjusted
    }
}

struct RecordWaveform: View {

    var samples: [CGFloat] // 0...1
    var addExtraDots: Bool

    static let spacing: CGFloat = 2
    static let width: CGFloat = 2
    static let maxSampleHeight: CGFloat = 1

    var body: some View {
        HStack(alignment: .center, spacing: RecordWaveform.spacing) {
            ForEach(Array(samples.enumerated()), id: \.offset) { _, s in
                Capsule()
                    .frame(width: RecordWaveform.width, height: RecordWaveform.maxSampleHeight * CGFloat(s))
            }
        }
        .frame(height: RecordWaveform.maxSampleHeight)
//
//        GeometryReader { g in
//            HStack(alignment: .bottom, spacing: RecordWaveform.spacing) {
//                ForEach(Array(samples.enumerated()), id: \.offset) { _, s in
//                    Capsule()
//                        .frame(width: RecordWaveform.width, height: RecordWaveform.maxSampleHeight * CGFloat(s))
//                }
//
//                if addExtraDots {
//                    ForEach(samples.count..<Int(g.size.width / (RecordWaveform.width + RecordWaveform.spacing)), id: \.self) { _ in
//                        Capsule()
//                            .viewSize(RecordWaveform.width)
//                    }
//                }
//            }
//            .frame(height: RecordWaveform.maxSampleHeight)
//        }
//        .frame(height: RecordWaveform.maxSampleHeight)
//        .fixedSize(horizontal: !addExtraDots, vertical: true)
    }
}

extension View {
    func viewSize(_ size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

    func circleBackground(_ color: Color) -> some View {
        self.background {
            Circle().fill(color)
        }
    }

    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
