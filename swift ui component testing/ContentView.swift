import SwiftUI
import WebKit
import UIKit
import MapKit

// Enum for demo categories
enum DemoCategory: String, CaseIterable, Identifiable {
    case basics = "Basics"
    case controls = "Controls"
    case containers = "Containers"
    case feedback = "Feedback"
    case system = "System"
    case advanced = "Advanced"
    case technical = "Technical"
    // TODO: Add more categories as needed
    var id: String { rawValue }
}

// Model for a showcase entry
struct ShowcaseDemo: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: DemoCategory
    let description: String
    let demoView: AnyView
    static func == (lhs: ShowcaseDemo, rhs: ShowcaseDemo) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// Demo data (expand as needed)
let demoShowcases: [ShowcaseDemo] = [
    ShowcaseDemo(
        name: "Button",
        category: .controls,
        description: "A control that performs an action when triggered.",
        demoView: AnyView(ButtonDemoView())
    ),
    ShowcaseDemo(
        name: "Text",
        category: .basics,
        description: "A view that displays one or more lines of read-only text.",
        demoView: AnyView(TextDemoView())
    ),
    ShowcaseDemo(
        name: "ColorPicker",
        category: .controls,
        description: "A control for picking colors.",
        demoView: AnyView(ColorPickerDemoView())
    ),
    // Controls
    ShowcaseDemo(
        name: "Toggle",
        category: .controls,
        description: "A switch that toggles between on and off.",
        demoView: AnyView(ToggleDemoView())
    ),
    ShowcaseDemo(
        name: "Slider",
        category: .controls,
        description: "A control for selecting a value from a bounded linear range.",
        demoView: AnyView(SliderDemoView())
    ),
    ShowcaseDemo(
        name: "Stepper",
        category: .controls,
        description: "A control for incrementing or decrementing a value.",
        demoView: AnyView(StepperDemoView())
    ),
    ShowcaseDemo(
        name: "DatePicker",
        category: .controls,
        description: "A control for selecting a date and time.",
        demoView: AnyView(DatePickerDemoView())
    ),
    ShowcaseDemo(
        name: "ProgressView",
        category: .controls,
        description: "A view that shows the progress towards completion of a task.",
        demoView: AnyView(ProgressDemoView())
    ),
    ShowcaseDemo(
        name: "Picker",
        category: .controls,
        description: "A control for selecting from a set of values.",
        demoView: AnyView(PickerDemoView())
    ),
    ShowcaseDemo(
        name: "SecureField",
        category: .controls,
        description: "A control for secure text input.",
        demoView: AnyView(SecureFieldDemoView())
    ),
    ShowcaseDemo(
        name: "TextField",
        category: .controls,
        description: "A control for text input.",
        demoView: AnyView(TextFieldDemoView())
    ),
    ShowcaseDemo(
        name: "TextEditor",
        category: .controls,
        description: "A scrollable text region for user-editable text.",
        demoView: AnyView(TextEditorDemoView())
    ),
    ShowcaseDemo(
        name: "Gauge",
        category: .controls,
        description: "A view that displays a value within a range using a gauge style.",
        demoView: AnyView(GaugeDemoView())
    ),
    ShowcaseDemo(
        name: "Menu",
        category: .controls,
        description: "A view that presents a menu of actions.",
        demoView: AnyView(MenuDemoView())
    ),
    ShowcaseDemo(
        name: "Context Menu",
        category: .controls,
        description: "A menu for secondary actions via long-press or right-click.",
        demoView: AnyView(ContextMenuDemoView())
    ),
    // Containers
    ShowcaseDemo(
        name: "VStack/HStack/ZStack",
        category: .containers,
        description: "Stack views for arranging content vertically, horizontally, or in depth.",
        demoView: AnyView(StackDemoView())
    ),
    ShowcaseDemo(
        name: "Grid",
        category: .containers,
        description: "A flexible grid container.",
        demoView: AnyView(GridDemoView())
    ),
    ShowcaseDemo(
        name: "Form",
        category: .containers,
        description: "A container for grouping controls used for data entry.",
        demoView: AnyView(FormDemoView())
    ),
    ShowcaseDemo(
        name: "ScrollView",
        category: .containers,
        description: "A scrollable container.",
        demoView: AnyView(ScrollDemoView())
    ),
    ShowcaseDemo(
        name: "TabView",
        category: .containers,
        description: "A container that presents multiple child views as tabs.",
        demoView: AnyView(TabDemoView())
    ),
    ShowcaseDemo(
        name: "NavigationStack",
        category: .containers,
        description: "A container that manages a navigation-based interface.",
        demoView: AnyView(NavigationStackDemoView())
    ),
    ShowcaseDemo(
        name: "Popover",
        category: .containers,
        description: "A view modifier that presents a popover.",
        demoView: AnyView(PopoverDemoView())
    ),
    ShowcaseDemo(
        name: "Sheet",
        category: .containers,
        description: "A view modifier that presents a modal sheet.",
        demoView: AnyView(SheetDemoView())
    ),
    ShowcaseDemo(
        name: "Refreshable ScrollView",
        category: .containers,
        description: "A scroll view supporting pull-to-refresh.",
        demoView: AnyView(RefreshableDemoView())
    ),
    ShowcaseDemo(
        name: "GroupBox",
        category: .containers,
        description: "A stylized container for grouping related content.",
        demoView: AnyView(GroupBoxDemoView())
    ),
    ShowcaseDemo(
        name: "DisclosureGroup",
        category: .containers,
        description: "A view that shows or hides children based on expansion state.",
        demoView: AnyView(DisclosureGroupDemoView())
    ),
    ShowcaseDemo(
        name: "List",
        category: .containers,
        description: "A scrollable, single-column list of data.",
        demoView: AnyView(ListDemoView())
    ),
    ShowcaseDemo(
        name: "OutlineGroup",
        category: .containers,
        description: "A list for hierarchical data.",
        demoView: AnyView(OutlineGroupDemoView())
    ),
    // Display
    ShowcaseDemo(
        name: "Image",
        category: .basics,
        description: "A view that displays an image from your asset catalog.",
        demoView: AnyView(ImageDemoView())
    ),
    ShowcaseDemo(
        name: "SF Symbol",
        category: .basics,
        description: "A view that displays an SF Symbol.",
        demoView: AnyView(SFSymbolDemoView())
    ),
    ShowcaseDemo(
        name: "AsyncImage",
        category: .basics,
        description: "A view that asynchronously loads and displays an image from a URL.",
        demoView: AnyView(AsyncImageDemoView())
    ),
    ShowcaseDemo(
        name: "Divider & Spacer",
        category: .basics,
        description: "Views for separating or spacing content.",
        demoView: AnyView(DividerSpacerDemoView())
    ),
    // Feedback
    ShowcaseDemo(
        name: "Alert & ConfirmationDialog",
        category: .feedback,
        description: "System alerts and confirmation dialogs.",
        demoView: AnyView(AlertDialogDemoView())
    ),
    ShowcaseDemo(
        name: "Haptics",
        category: .feedback,
        description: "Trigger haptic feedback.",
        demoView: AnyView(HapticDemoView())
    ),
    ShowcaseDemo(
        name: "Hover Effect",
        category: .feedback,
        description: "Shows hover effect on supported platforms.",
        demoView: AnyView(HoverEffectDemoView())
    ),
    // System
    ShowcaseDemo(
        name: "ShareLink",
        category: .system,
        description: "A control for sharing data using the system share sheet.",
        demoView: AnyView(ShareLinkDemoView())
    ),
    ShowcaseDemo(
        name: "WebView",
        category: .system,
        description: "A SwiftUI view that displays web content.",
        demoView: AnyView(WebViewDemoView())
    ),
    ShowcaseDemo(
        name: "Liquid Glass",
        category: .system,
        description: "Demonstrates the Liquid Glass effect from Apple design.",
        demoView: AnyView(LiquidGlassDemoView())
    ),
    ShowcaseDemo(
        name: "Live Activities/Dynamic Island",
        category: .system,
        description: "Preview of Live Activities and Dynamic Island integration.",
        demoView: AnyView(LiveActivitiesDemoView())
    ),
    ShowcaseDemo(
        name: "AlarmKit (Timer/Alarm)",
        category: .system,
        description: "Custom alarm/timer integration with AlarmKit.",
        demoView: AnyView(AlarmKitDemoView())
    ),
    ShowcaseDemo(
        name: "Assistive Access",
        category: .system,
        description: "Showcase of simplified UI for cognitive accessibility.",
        demoView: AnyView(AssistiveAccessDemoView())
    ),
    ShowcaseDemo(
        name: "Widgets",
        category: .system,
        description: "Widget integration showcase.",
        demoView: AnyView(WidgetsDemoView())
    ),
    ShowcaseDemo(
        name: "Toolbar",
        category: .system,
        description: "A toolbar for hosting app actions.",
        demoView: AnyView(ToolbarDemoView())
    ),
    ShowcaseDemo(
        name: "Searchable",
        category: .system,
        description: "A search interface for lists and content.",
        demoView: AnyView(SearchableDemoView())
    ),
    ShowcaseDemo(
        name: "SceneStorage",
        category: .system,
        description: "Persists view state across app launches.",
        demoView: AnyView(SceneStorageDemoView())
    ),
    ShowcaseDemo(
        name: "Life Cycle (onAppear/onDisappear)",
        category: .system,
        description: "Responds to view appearance and disappearance.",
        demoView: AnyView(LifeCycleDemoView())
    ),
    ShowcaseDemo(
        name: "Accessibility",
        category: .system,
        description: "Demonstration of accessibility features.",
        demoView: AnyView(AccessibilityDemoView())
    ),
    ShowcaseDemo(
        name: "Map",
        category: .basics,
        description: "A view that displays an interactive map.",
        demoView: AnyView(MapDemoView())
    ),
    // Advanced (new)
    ShowcaseDemo(
        name: "Canvas & Shape Drawing",
        category: .advanced,
        description: "Drawing custom shapes and graphics with Canvas.",
        demoView: AnyView(CanvasDemoView())
    ),
    ShowcaseDemo(
        name: "Animation",
        category: .advanced,
        description: "Using TimelineView, withAnimation, transitions, matchedGeometryEffect.",
        demoView: AnyView(AnimationDemoView())
    ),
    ShowcaseDemo(
        name: "Custom Modifier Example",
        category: .advanced,
        description: "Creating and using custom ViewModifiers.",
        demoView: AnyView(CustomModifierDemoView())
    ),
    ShowcaseDemo(
        name: "Drag & Drop",
        category: .advanced,
        description: "Implementing drag and drop interactions.",
        demoView: AnyView(DragDropDemoView())
    ),
    ShowcaseDemo(
        name: "Gestures",
        category: .advanced,
        description: "Magnification, Rotation, and Simultaneous Gestures.",
        demoView: AnyView(GestureDemoView())
    ),
    ShowcaseDemo(
        name: "GeometryReader",
        category: .advanced,
        description: "Using GeometryReader for responsive layouts.",
        demoView: AnyView(GeometryReaderDemoView())
    ),
    // Technical (new)
    ShowcaseDemo(
        name: "FocusState & Text Input",
        category: .technical,
        description: "Managing focus and input fields with FocusState.",
        demoView: AnyView(FocusStateDemoView())
    ),
    ShowcaseDemo(
        name: "AttributedString Rich Text",
        category: .technical,
        description: "Working with AttributedString for rich text display.",
        demoView: AnyView(AttributedStringDemoView())
    ),
    ShowcaseDemo(
        name: "Observable/Bindable Macro Wrappers",
        category: .technical,
        description: "Using macros for ObservableObject/Bindable properties.",
        demoView: AnyView(ObservableBindableDemoView())
    ),
    ShowcaseDemo(
        name: "Custom ButtonStyle",
        category: .technical,
        description: "Creating and applying custom ButtonStyles.",
        demoView: AnyView(CustomButtonStyleDemoView())
    ),
    ShowcaseDemo(
        name: "Conditional View Composition",
        category: .technical,
        description: "Building views conditionally with SwiftUI.",
        demoView: AnyView(ConditionalViewDemoView())
    ),
    ShowcaseDemo(
        name: "Custom Container (FlowLayout)",
        category: .technical,
        description: "Implementing a custom container view like FlowLayout.",
        demoView: AnyView(CustomContainerDemoView())
    ),
]

// MARK: - ContentView

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedCategory: DemoCategory? = nil
    @State private var selectedDemo: ShowcaseDemo? = nil

    var filteredDemos: [ShowcaseDemo] {
        demoShowcases.filter { demo in
            (selectedCategory == nil || demo.category == selectedCategory) &&
            (searchText.isEmpty || demo.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.06), .white.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            NavigationSplitView {
                VStack(alignment: .leading, spacing: 0) {
                    Picker("Category", selection: $selectedCategory) {
                        Text("All").tag(DemoCategory?.none)
                        ForEach(DemoCategory.allCases) { category in
                            Text(category.rawValue).tag(Optional(category))
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(12)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding([.horizontal, .top], 8)

                    SearchBar(text: $searchText)
                        .padding()
                        .background(.ultraThinMaterial, in: Capsule())
                        .padding(.horizontal, 8)
                }
                List(filteredDemos, selection: $selectedDemo) { demo in
                    NavigationLink(value: demo) {
                        VStack(alignment: .leading) {
                            Text(demo.name).font(.headline)
                            Text(demo.description).font(.caption).foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("SwiftUI Showcase")
            } detail: {
                if let demo = selectedDemo {
                    DemoDetailView(demo: demo)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            LinearGradient(
                                colors: [.white.opacity(0.3), .blue.opacity(0.07)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .ignoresSafeArea()
                        )
                } else {
                    Text("Select a component to explore")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

// MARK: - DemoDetailView and SearchBar (beautified)

struct DemoDetailView: View {
    let demo: ShowcaseDemo
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text(demo.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 16)
                Text(demo.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                Divider()
                demo.demoView
                Spacer(minLength: 20)
            }
            .padding(24)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .padding()
        }
        .navigationTitle(demo.name)
    }
}

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        TextField("Search components", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding([.horizontal, .bottom])
    }
}


// MARK: - LiquidGlassDemoView (revamped)

struct LiquidGlassDemoView: View {
    @State private var showSecondGlass = false
    @State private var morphAmount: CGFloat = 0.0
    @State private var dragOffset = CGSize.zero
    @State private var animatePulse = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Liquid Glass Demo")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .shadow(radius: 5)
            
            ZStack {
                // Background image blurred
                Image("exampleImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                    .blur(radius: 24)
                    .overlay(
                        Color.black.opacity(0.15)
                            .blendMode(.overlay)
                            .frame(width: 280, height: 280)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                
                // Primary glass shape morphing and movable
                MorphingGlassShape(morphAmount: morphAmount)
                    .fill(.ultraThinMaterial)
                    .background(
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .strokeBorder(.white.opacity(0.25), lineWidth: 1.5)
                            .blur(radius: 1)
                    )
                    .frame(width: 220, height: 220)
                    .shadow(color: Color.white.opacity(0.25), radius: 10, x: 0, y: 0)
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    dragOffset = .zero
                                }
                            }
                    )
                    .onAppear {
                        withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                            morphAmount = 1.0
                        }
                        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                            animatePulse.toggle()
                        }
                    }
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(animatePulse ? 0.3 : 0), lineWidth: 8)
                            .scaleEffect(animatePulse ? 1.6 : 1)
                            .opacity(animatePulse ? 0 : 1)
                            .animation(.easeOut(duration: 1.2).repeatForever(autoreverses: false), value: animatePulse)
                    )
                
                if showSecondGlass {
                    CapsuleGlass()
                        .glassEffect(.prominent)
                        .frame(width: 160, height: 80)
                        .offset(x: 90, y: 90)
                        .scaleEffect(animatePulse ? 1.05 : 1)
                        .animation(.easeInOut(duration: 1), value: animatePulse)
                }
            }
            .frame(width: 320, height: 320)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .stroke(.white.opacity(0.15), lineWidth: 1)
            )

            Toggle("Show Multiple Glasses", isOn: $showSecondGlass)
                .tint(.blue)
                .padding(.horizontal)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [.black.opacity(0.6), .blue.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

struct MorphingGlassShape: Shape {
    var morphAmount: CGFloat
    
    var animatableData: CGFloat {
        get { morphAmount }
        set { morphAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        // Base shape: rounded rectangle with morphing bulges
        
        let bulge = 30 * morphAmount
        let bulge2 = 15 * morphAmount
        
        path.move(to: CGPoint(x: width * 0.1, y: height * 0.3 + bulge))
        
        path.addCurve(to: CGPoint(x: width * 0.25, y: height * 0.1),
                      control1: CGPoint(x: width * 0.0, y: height * 0.1 + bulge2),
                      control2: CGPoint(x: width * 0.1, y: height * 0.0))
        
        path.addCurve(to: CGPoint(x: width * 0.8, y: height * 0.1 + bulge2),
                      control1: CGPoint(x: width * 0.5, y: height * 0.0),
                      control2: CGPoint(x: width * 0.7, y: height * 0.0 + bulge))
        
        path.addCurve(to: CGPoint(x: width * 0.9, y: height * 0.5),
                      control1: CGPoint(x: width * 0.9, y: height * 0.25),
                      control2: CGPoint(x: width * 1.0, y: height * 0.5))
        
        path.addCurve(to: CGPoint(x: width * 0.6, y: height * 0.85 - bulge),
                      control1: CGPoint(x: width * 0.8, y: height * 0.75),
                      control2: CGPoint(x: width * 0.7, y: height * 0.85))
        
        path.addCurve(to: CGPoint(x: width * 0.2, y: height * 0.8),
                      control1: CGPoint(x: width * 0.5, y: height * 1.0 - bulge2),
                      control2: CGPoint(x: width * 0.3, y: height * 0.95))
        
        path.addCurve(to: CGPoint(x: width * 0.1, y: height * 0.3 + bulge),
                      control1: CGPoint(x: width * 0.0, y: height * 0.65),
                      control2: CGPoint(x: width * 0.0, y: height * 0.45))
        
        path.closeSubpath()
        return path
    }
}

struct CapsuleGlass: View {
    var body: some View {
        Capsule()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.white.opacity(0.35), .white.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .background(
                Capsule()
                    .stroke(Color.white.opacity(0.25), lineWidth: 1)
                    .blur(radius: 1)
                    .offset(x: 0, y: 0)
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.6), lineWidth: 0.7)
                    .blendMode(.overlay)
            )
            .shadow(color: Color.white.opacity(0.25), radius: 6, x: 0, y: 0)
            .glassEffect(.regular)
    }
}


// MARK: - New demo views (Advanced and Technical)

// Canvas & Shape Drawing Demo
struct CanvasDemoView: View {
    var body: some View {
        Canvas { context, size in
            // Draw a circle with gradient fill and shadow
            let circleRect = CGRect(x: size.width * 0.15, y: size.height * 0.15, width: size.width * 0.7, height: size.height * 0.7)
            
            context.fill(
                Path(ellipseIn: circleRect),
                with: .linearGradient(
                    Gradient(colors: [.red, .orange, .yellow]),
                    startPoint: CGPoint(x: circleRect.midX, y: circleRect.minY),
                    endPoint: CGPoint(x: circleRect.midX, y: circleRect.maxY)
                )
            )
            
            context.stroke(
                Path(ellipseIn: circleRect),
                with: .color(.black.opacity(0.3)),
                lineWidth: 5
            )
            
            // Draw some diagonal lines
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.move(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            context.stroke(path, with: .color(.blue.opacity(0.5)), lineWidth: 2)
        }
        .frame(height: 300)
        .padding()
    }
}

// Animation Demo
struct AnimationDemoView: View {
    @Namespace private var boxNamespace
    @State private var isExpanded = false
    @State private var animateOpacity = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Tap the box to animate")
                .font(.headline)
            
            ZStack {
                if !isExpanded {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "box", in: boxNamespace)
                        .frame(width: 100, height: 100)
                        .opacity(animateOpacity ? 1 : 0.3)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateOpacity)
                        .onAppear {
                            animateOpacity.toggle()
                        }
                }
                
                if isExpanded {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.purple)
                        .matchedGeometryEffect(id: "box", in: boxNamespace)
                        .frame(width: 250, height: 250)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                    isExpanded.toggle()
                }
            }
            
            TimelineView(.animation) { timeline in
                let angle = CGFloat(timeline.date.timeIntervalSinceReferenceDate).truncatingRemainder(dividingBy: 2) * .pi
                Circle()
                    .stroke(Color.green, lineWidth: 4)
                    .frame(width: 80, height: 80)
                    .rotationEffect(.radians(Double(angle)))
            }
        }
        .padding()
    }
}

// Custom Modifier Demo
struct CustomModifierDemoView: View {
    @State private var isHighlighted = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Tap to toggle highlight")
                .font(.title2)
                .padding()
                .modifier(HighlightModifier(isHighlighted: isHighlighted))
                .onTapGesture {
                    withAnimation {
                        isHighlighted.toggle()
                    }
                }
            
            Text("This text is always normal.")
        }
        .padding()
    }
}

struct HighlightModifier: ViewModifier {
    var isHighlighted: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(isHighlighted ? Color.yellow.opacity(0.6) : Color.clear)
            .cornerRadius(10)
            .shadow(color: isHighlighted ? .yellow.opacity(0.8) : .clear, radius: 12)
            .scaleEffect(isHighlighted ? 1.06 : 1)
            .animation(.easeInOut(duration: 0.3), value: isHighlighted)
    }
}

// Drag & Drop Demo
struct DragDropDemoView: View {
    @State private var dragMessage = "Drag the circle"
    @State private var droppedText = "Drop Here"
    @State private var circleColor = Color.blue
    
    var body: some View {
        VStack(spacing: 40) {
            Text(dragMessage)
                .font(.headline)
            Circle()
                .fill(circleColor)
                .frame(width: 100, height: 100)
                .onDrag {
                    dragMessage = "Dragging..."
                    return NSItemProvider(object: NSString(string: "Hello from Circle"))
                }
                .onDrop(of: [.text], isTargeted: nil) { providers in
                    if let provider = providers.first {
                        _ = provider.loadObject(ofClass: NSString.self) { object, _ in
                            if let text = object as? String {
                                DispatchQueue.main.async {
                                    droppedText = text
                                    circleColor = .green
                                    dragMessage = "Drop successful!"
                                }
                            }
                        }
                        return true
                    }
                    return false
                }
            Text(droppedText)
                .font(.title3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2)))
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

// Gesture Demo
struct GestureDemoView: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Angle = .zero
    @State private var offset: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Use pinch, rotate, and drag gestures")
                .font(.headline)
            
            Circle()
                .fill(Color.pink)
                .frame(width: 150, height: 150)
                .scaleEffect(scale)
                .rotationEffect(rotation)
                .offset(offset)
                .gesture(
                    SimultaneousGesture(
                        SimultaneousGesture(
                            MagnificationGesture()
                                .onChanged { value in scale = value },
                            RotationGesture()
                                .onChanged { angle in rotation = angle }
                        ),
                        DragGesture()
                            .onChanged { value in offset = value.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    offset = .zero
                                }
                            }
                    )
                )
                .animation(.spring(), value: scale)
                .animation(.spring(), value: rotation)
        }
        .padding()
    }
}

// GeometryReader Demo
struct GeometryReaderDemoView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                Text("GeometryReader Demo")
                    .font(.title2)
                Text("Size: \(Int(geo.size.width)) x \(Int(geo.size.height))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Rectangle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.3)
                    .overlay(Text("60% width, 30% height"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
}

// FocusState Demo
struct FocusStateDemoView: View {
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .username)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .password
                }
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .password)
                .submitLabel(.done)
                .onSubmit {
                    focusedField = nil
                }
            Button("Clear Focus") {
                focusedField = nil
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// AttributedString Demo
struct AttributedStringDemoView: View {
    var body: some View {
        let attributedString = try? AttributedString(markdown: """
        **This** is an *AttributedString* demo with [link](https://apple.com) and `code`.
        - Bold text
        - Italic text
        - Link
        - Inline code
        """)
        
        ScrollView {
            Text(attributedString ?? AttributedString("Invalid markdown"))
                .padding()
        }
    }
}

// Observable/Bindable Macro Demo
struct ObservableBindableDemoView: View {
    @StateObject private var model = CounterModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter: \(model.count)")
                .font(.largeTitle)
            Button("Increment") {
                model.increment()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

class CounterModel: ObservableObject {
    @Published var count = 0
    func increment() {
        count += 1
    }
}

// Custom ButtonStyle Demo
struct CustomButtonStyleDemoView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Custom ButtonStyle Demo")
                .font(.title2)
            Button("Press Me") {}
                .buttonStyle(NeumorphicButtonStyle())
        }
        .padding()
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.25))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    } else {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.15))
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

// Conditional View Composition Demo
struct ConditionalViewDemoView: View {
    @State private var showExtra = false
    
    var body: some View {
        VStack(spacing: 30) {
            Toggle("Show Extra Text", isOn: $showExtra)
                .padding()
            Text("Always visible text")
                .font(.title)
            if showExtra {
                Text("Extra text shown conditionally")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .transition(.slide.combined(with: .opacity))
                    .animation(.default, value: showExtra)
            }
        }
        .padding()
    }
}

// Custom Container Demo (FlowLayout)
struct CustomContainerDemoView: View {
    let items = Array(1...20).map { "Item \($0)" }
    
    var body: some View {
        ScrollView {
            FlowLayout(items: items, spacing: 12) { item in
                Text(item)
                    .padding(10)
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct FlowLayout<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content
    
    init(items: Data, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.items = items
        self.spacing = spacing
        self.content = content
    }
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geo in
            self.generateContent(in: geo.size)
                .frame(height: totalHeight)
        }
    }
    
    private func generateContent(in size: CGSize) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                content(item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > size.width {
                            width = 0
                            height -= d.height + spacing
                        }
                        let result = width
                        if item == items.last {
                            width = 0 // last item
                        } else {
                            width -= d.width + spacing
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if item == items.last {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
        .background(
            GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    totalHeight = -height
                }
                return Color.clear
            }
        )
    }
}


// MARK: - Existing stubs...

struct ButtonDemoView: View {
    @State private var tapCount = 0
    var body: some View {
        VStack(spacing: 20) {
            Button("Tap Me") { tapCount += 1 }
            Text("Taps: \(tapCount)")
            // TODO: Add controls to modify style, color, etc.
        }
        .padding()
    }
}

struct TextDemoView: View {
    @State private var color: Color = .primary
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .foregroundStyle(color)
            ColorPicker("Text Color", selection: $color)
        }
        .padding()
    }
}

struct ColorPickerDemoView: View {
    @State private var pickedColor: Color = .blue
    var body: some View {
        VStack(spacing: 20) {
            ColorPicker("Pick a Color", selection: $pickedColor)
            RoundedRectangle(cornerRadius: 12)
                .fill(pickedColor)
                .frame(height: 60)
        }
        .padding()
    }
}

struct ToggleDemoView: View {
    @State private var isOn = false
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Enable feature", isOn: $isOn)
                .padding()
            Text("Toggle is \(isOn ? "On" : "Off")")
        }
        .padding()
    }
}

struct SliderDemoView: View {
    @State private var value: Double = 0.5
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $value)
            Text(String(format: "Value: %.2f", value))
        }
        .padding()
    }
}

struct StepperDemoView: View {
    @State private var count = 0
    var body: some View {
        VStack(spacing: 20) {
            Stepper("Count: \(count)", value: $count)
        }
        .padding()
    }
}

struct DatePickerDemoView: View {
    @State private var date = Date()
    var body: some View {
        VStack(spacing: 20) {
            DatePicker("Select a date", selection: $date, displayedComponents: .date)
                .datePickerStyle(.compact)
            Text("Selected: \(date.formatted(date: .abbreviated, time: .omitted))")
        }
        .padding()
    }
}

struct ProgressDemoView: View {
    @State private var progress: Double = 0.3
    var body: some View {
        VStack(spacing: 20) {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
            Button("Increment") {
                progress = min(progress + 0.1, 1.0)
            }
        }
        .padding()
    }
}

struct PickerDemoView: View {
    @State private var selection = "One"
    let options = ["One", "Two", "Three"]
    var body: some View {
        VStack(spacing: 20) {
            Picker("Select an option", selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.segmented)
            Text("Selected: \(selection)")
        }
        .padding()
    }
}

struct SecureFieldDemoView: View {
    @State private var password = ""
    var body: some View {
        VStack(spacing: 20) {
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Text("Password length: \(password.count)")
        }
        .padding()
    }
}

struct TextFieldDemoView: View {
    @State private var input = ""
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text", text: $input)
                .textFieldStyle(.roundedBorder)
            Text("You typed: \(input)")
        }
        .padding()
    }
}

struct TextEditorDemoView: View {
    @State private var text = "Type something..."
    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $text)
                .border(Color.gray.opacity(0.5), width: 1)
                .frame(height: 150)
            Text("Text length: \(text.count)")
        }
        .padding()
    }
}

struct StackDemoView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("VStack")
            VStack {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            Divider()
            Text("HStack")
            HStack {
                Text("Item A")
                Text("Item B")
                Text("Item C")
            }
            Divider()
            Text("ZStack")
            ZStack {
                Rectangle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 150, height: 100)
                Text("Overlaid Text")
            }
        }
        .padding()
    }
}

struct GridDemoView: View {
    let items = Array(1...9)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange.opacity(0.7))
                        .frame(height: 80)
                        .overlay(Text("\(item)").font(.title))
                }
            }
            .padding()
        }
    }
}

struct FormDemoView: View {
    @State private var name = ""
    @State private var isSubscribed = false
    var body: some View {
        Form {
            Section(header: Text("User Info")) {
                TextField("Name", text: $name)
                Toggle("Subscribe", isOn: $isSubscribed)
            }
            Section {
                Button("Submit") {}
            }
        }
    }
}

struct ScrollDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(1..<20) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct TabDemoView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            Text("First Tab")
                .tabItem {
                    Label("First", systemImage: "1.circle")
                }
                .tag(0)
            Text("Second Tab")
                .tabItem {
                    Label("Second", systemImage: "2.circle")
                }
                .tag(1)
            Text("Third Tab")
                .tabItem {
                    Label("Third", systemImage: "3.circle")
                }
                .tag(2)
        }
    }
}

struct NavigationStackDemoView: View {
    var body: some View {
        NavigationStack {
            List(1..<6) { i in
                NavigationLink("Item \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { value in
                Text("Detail for Item \(value)")
            }
            .navigationTitle("NavigationStack Demo")
        }
    }
}

struct ImageDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Image("exampleImage")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .border(Color.gray)
            Text("Image from SF Symbols and asset catalog")
        }
        .padding()
    }
}

struct SFSymbolDemoView: View {
    @State private var symbolName = "star"
    let symbols = ["star", "heart", "bell", "bolt", "globe", "leaf"]
    var body: some View {
        VStack(spacing: 20) {
            Picker("Select Symbol", selection: $symbolName) {
                ForEach(symbols, id: \.self) { symbol in
                    Label(symbol, systemImage: symbol)
                        .tag(symbol)
                }
            }
            .pickerStyle(.segmented)
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct AsyncImageDemoView: View {
    let url = URL(string: "https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png")!
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            case .failure:
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
            @unknown default:
                EmptyView()
            }
        }
        .padding()
    }
}

struct DividerSpacerDemoView: View {
    var body: some View {
        VStack {
            Text("Above Divider")
            Divider()
            Text("Below Divider")
            Spacer()
            Text("At Bottom")
        }
        .padding()
        .frame(height: 300)
        .border(Color.gray)
    }
}

struct AlertDialogDemoView: View {
    @State private var showAlert = false
    @State private var showDialog = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Alert") {
                showAlert = true
            }
            .alert("Important Alert", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
                Button("Delete", role: .destructive) { }
            } message: {
                Text("This is an alert dialog.")
            }
            Button("Show Confirmation Dialog") {
                showDialog = true
            }
            .confirmationDialog("Choose an option", isPresented: $showDialog, titleVisibility: .visible) {
                Button("Option 1") { }
                Button("Option 2") { }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}

struct HapticDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Trigger Success Haptic") {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            }
            Button("Trigger Warning Haptic") {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
            }
            Button("Trigger Error Haptic") {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
        }
        .padding()
    }
}

struct ShareLinkDemoView: View {
    let items = [URL(string: "https://developer.apple.com")!]
    var body: some View {
        VStack(spacing: 20) {
            ShareLink(items: items) {
                Label("Share Apple Developer URL", systemImage: "square.and.arrow.up")
            }
            .padding()
            Text("Tap the button to share the link.")
        }
        .padding()
    }
}

struct WebViewDemoView: View {
    var body: some View {
        WebView(url: URL(string: "https://developer.apple.com")!)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}

struct LiveActivitiesDemoView: View {
    @State private var counter = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Live Activities & Dynamic Island Demo")
                .font(.title2)
                .multilineTextAlignment(.center)
            Text("Counter: \(counter)")
                .font(.largeTitle)
            Button("Increment Counter") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
            Text("This is a placeholder for a live activity representation.")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
    }
}

struct AlarmKitDemoView: View {
    @State private var timerRunning = false
    @State private var elapsedSeconds = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("AlarmKit Timer Demo (Placeholder)")
                .font(.title2)
                .multilineTextAlignment(.center)
            Text("Elapsed time: \(elapsedSeconds) seconds")
                .font(.headline)
            HStack {
                Button(timerRunning ? "Stop" : "Start") {
                    if timerRunning {
                        timer?.invalidate()
                        timer = nil
                    } else {
                        elapsedSeconds = 0
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            elapsedSeconds += 1
                        }
                    }
                    timerRunning.toggle()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Reset") {
                    timer?.invalidate()
                    timer = nil
                    elapsedSeconds = 0
                    timerRunning = false
                }
                .buttonStyle(.bordered)
            }
            Text("This is a placeholder for AlarmKit timer/alarm integration.")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
    }
}

struct AssistiveAccessDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Assistive Access Demo")
                .font(.title)
            VStack(spacing: 12) {
                Button("Simple Large Button") { }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .padding()
                    .accessibilityLabel("Simple Large Button")
                Toggle("Enable Accessibility Mode", isOn: .constant(true))
                    .toggleStyle(.switch)
                    .accessibilityHint("Toggle to enable accessibility features")
                Text("Items are simplified for cognitive accessibility.")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(12)
        }
        .padding()
    }
}

struct WidgetsDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Widgets Demo")
                .font(.title2)
            Text("This is a placeholder demonstrating widgets integration.")
                .multilineTextAlignment(.center)
                .padding()
            Text("TODO: Widgets require external widget targets and extensions.")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct GaugeDemoView: View {
    @State private var value = 50.0
    var body: some View {
        VStack(spacing: 20) {
            Gauge(value: value, in: 0...100) {
                Text("Progress")
            } currentValueLabel: {
                Text("\(Int(value))%")
            }
            Slider(value: $value, in: 0...100)
        }
        .padding()
    }
}

struct MenuDemoView: View {
    @State private var selection = "None"
    var body: some View {
        VStack(spacing: 20) {
            Menu("Choose Fruit") {
                Button("Apple") { selection = "Apple" }
                Button("Banana") { selection = "Banana" }
                Button("Cherry") { selection = "Cherry" }
            }
            Text("Selected: \(selection)")
        }
        .padding()
    }
}

struct PopoverDemoView: View {
    @State private var showPopover = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Popover") {
                showPopover = true
            }
            .popover(isPresented: $showPopover) {
                VStack(spacing: 10) {
                    Text("This is a popover!")
                        .font(.headline)
                    Button("Dismiss") {
                        showPopover = false
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                .frame(width: 200, height: 150)
            }
        }
        .padding()
    }
}

struct SheetDemoView: View {
    @State private var showSheet = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Sheet") {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 20) {
                    Text("This is a modal sheet.")
                        .font(.headline)
                    Button("Dismiss") {
                        showSheet = false
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
        .padding()
    }
}

struct HoverEffectDemoView: View {
    @State private var isHovered = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Hover over the circle (on supported platforms).")
            Circle()
                .fill(isHovered ? Color.green : Color.blue)
                .frame(width: 100, height: 100)
                .hoverEffect(.highlight)
                .onHover { hover in
                    isHovered = hover
                }
        }
        .padding()
    }
}

struct ContextMenuDemoView: View {
    @State private var message = "Long press the rectangle"
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .fill(Color.purple)
                .frame(width: 150, height: 150)
                .contextMenu {
                    Button("Option 1") { message = "Option 1 selected" }
                    Button("Option 2") { message = "Option 2 selected" }
                    Button("Reset") { message = "Long press the rectangle" }
                }
            Text(message)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct RefreshableDemoView: View {
    @State private var items = Array(1...5)
    @State private var isRefreshing = false
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Text("Item \(item)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .refreshable {
            isRefreshing = true
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            let next = (items.last ?? 0) + 1
            items.append(next)
            isRefreshing = false
        }
    }
}

struct GroupBoxDemoView: View {
    @State private var toggleOn = false
    var body: some View {
        GroupBox(label: Label("Settings", systemImage: "gearshape")) {
            Toggle("Enable Feature", isOn: $toggleOn)
                .padding(.vertical, 5)
            Text("Use GroupBox to group content.")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct DisclosureGroupDemoView: View {
    @State private var isExpanded = false
    var body: some View {
        DisclosureGroup("Show Details", isExpanded: $isExpanded) {
            Text("Here are more details shown when expanded.")
                .padding()
        }
        .padding()
    }
}

struct ListDemoView: View {
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
    var body: some View {
        List(fruits, id: \.self) { fruit in
            Text(fruit)
        }
        .listStyle(.insetGrouped)
    }
}

struct OutlineGroupDemoView: View {
    struct Node: Identifiable {
        let id = UUID()
        let name: String
        var children: [Node]? = nil
    }
    let data: [Node] = [
        Node(name: "Fruits", children: [
            Node(name: "Apple"),
            Node(name: "Banana"),
            Node(name: "Cherry"),
        ]),
        Node(name: "Vegetables", children: [
            Node(name: "Carrot"),
            Node(name: "Lettuce"),
        ])
    ]
    var body: some View {
        List {
            OutlineGroup(data, children: \.children) { node in
                Text(node.name)
            }
        }
        .listStyle(.sidebar)
    }
}

struct ToolbarDemoView: View {
    @State private var editMode = EditMode.inactive
    var body: some View {
        NavigationStack {
            List {
                Text("Toolbar Demo Item 1")
                Text("Toolbar Demo Item 2")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .environment(\.editMode, $editMode)
            .navigationTitle("Toolbar Demo")
        }
    }
}

struct SearchableDemoView: View {
    @State private var searchText = ""
    let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank"]
    var filtered: [String] {
        if searchText.isEmpty { return names }
        return names.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
    var body: some View {
        List(filtered, id: \.self) { name in
            Text(name)
        }
        .searchable(text: $searchText, prompt: "Search names")
    }
}

struct SceneStorageDemoView: View {
    @SceneStorage("counterValue") private var counter = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Counter (persists across launches): \(counter)")
            Button("Increment") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct LifeCycleDemoView: View {
    @State private var appearCount = 0
    @State private var disappearCount = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("onAppear called: \(appearCount) times")
            Text("onDisappear called: \(disappearCount) times")
        }
        .font(.headline)
        .padding()
        .onAppear {
            appearCount += 1
        }
        .onDisappear {
            disappearCount += 1
        }
    }
}

struct AccessibilityDemoView: View {
    @State private var isOn = false
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Accessibility Toggle", isOn: $isOn)
                .accessibilityLabel("Enable feature toggle")
                .accessibilityHint("Toggles the feature on or off")
                .padding()
            Button("Press Me") { }
                .accessibilityLabel("Press button")
                .accessibilityAddTraits(.isButton)
                .padding()
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .accessibilityLabel("Favorite star icon")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct MapDemoView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.00902), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

