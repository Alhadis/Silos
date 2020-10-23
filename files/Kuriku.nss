@warmColor: hsl(0.15, 1.0, 1.0);
@hotColor:  hsl(0.0, 1.0, 1.0);
@coolColor: hsl(0.5, 1.0, 1.0);
@coldColor: hsl(0.6, 1.0, 1.0);
@oldColor: hsl(0.09, 0.04, 1.0);
@veryOldColor: hsl(0.09, 0.11, 0.95);
@completedTextColor: rgb(164, 164, 164);
@inactiveTextColor: gray;
@normalFont: AvenirNext-Regular;
@boldFont: AvenirNext-Bold;
@italicFont: AvenirNext-UltraLightItalic;
@timeFontSize: 9;
@timeFont: AvenirNext-Medium;
@coolBlur: 20.0;
@warmBlur: 12.0;

/* Computed styles */

EntryLabelTemperatureLow {
    font-size: 16;
}

EntryLabelTemperatureHigh {
    font-size: 24;
}

EntryCellInactive {
    color: rgb(228, 228, 228);
}

EntryCellActive {
    color: white;
}

EntryCellStalenessVeryOld {
    color: @veryOldColor;
}

EntryCellStalenessOld {
    color: @oldColor;
}

TemperatureCold {
    blur:  @coolBlur;
    color: @coldColor;
}

TemperatureCool {
    blur:  @coolBlur;
    color: @coolColor;
}

TemperatureWarm {
    blur:  @warmBlur;
    color: @warmColor;
}

TemperatureHot {
    blur:  @warmBlur;
    color: @hotColor;
}

/* Normal styles */

JournalSectionHeader {
    font-name: @italicFont;
    font-color: black;
    background-color: white;
}

EntryLabel {
    font-name: @normalFont;
    font-color: black;
}

EntryLabelCool {
    font-name: @normalFont;
    font-color: white;
}

EntryLabelCompleted {
    font-name: @normalFont;
    font-color: @completedTextColor;
    text-decoration: line-through;
}

EntryLabelInactive {
    font-name: @normalFont;
    font-color: @inactiveTextColor;
}

Progress {
    background-color: rgb(0.74, 1.000, 0.811);
}

Time {
    font-name:  @timeFont;
    font-color: rgb(170, 170, 170);
    font-size:  @timeFontSize;
}

TimeInactive {
    font-name:  @timeFont;
    font-color: @inactiveTextColor;
    font-size:  @timeFontSize;
}

TimeCompleted {
    font-name:  @timeFont;
    font-color: @completedTextColor;
    font-size:  @timeFontSize;
}

TimeWarm {
    font-name:  @timeFont;
    font-color: white;
    font-size:  @timeFontSize;
}

TimeCool {
    font-name:  @timeFont;
    font-color: white;
    font-size:  @timeFontSize;
}

DueDate {
    font-name: @timeFont;
    font-color: @hotColor;
    font-size: @timeFontSize;
}

StartDate {
    font-name: @timeFont;
    font-color: @coldColor;
    font-size: @timeFontSize;
}



