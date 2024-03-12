//
//  EmergeWidget.swift
//  EmergeWidget
//
//  Created by Jacob Bartlett on 08/03/2024.
//

import EmergeUI
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> Car {
        Car.sample().randomElement()!
    }

    func getSnapshot(in context: Context, completion: @escaping (Car) -> ()) {
        let car = Car.sample().randomElement()
        completion(car!)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Car>) -> ()) {
        let timeline = Timeline(entries: Car.sample(), policy: .atEnd)
        completion(timeline)
    }
}

extension Car: TimelineEntry {
    public var date: Date {
        Date()
    }
}

struct EmergeWidgetCarView : View {
    var car: Provider.Entry

    var body: some View {
        CarView(car: car, contentMode: .fill)
    }
}

struct EmergeWidget: Widget {
    let kind: String = "EmergeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { car in
            EmergeWidgetCarView(car: car)
                .containerBackground(.white, for: .widget)
        }
        .configurationDisplayName("Emerge Widget")
        .description("This is a car image widget.")
    }
}

#Preview(as: .systemSmall) {
    EmergeWidget()
} timeline: {
    Car.sample().first!
}
