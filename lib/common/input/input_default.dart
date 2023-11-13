import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/common/color_extension.dart';

class InputDefault extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  const InputDefault({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
  });
  Color? get cursorColor$ => cursorColor ?? AppColorScheme.inkDarkGray;
  InputDecoration? get decoration$ => decoration;
  //  InputDecoration(
  //       contentPadding: const EdgeInsets.all(16),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(
  //           width: 1,
  //           color: AppColorScheme.inkDarkGray,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(
  //           width: 1,
  //           color: AppColorScheme.inkDarkGray,
  //         ),
  //       ),

  //       icon: decoration?.icon,
  //       iconColor: decoration?.iconColor,
  //       label: decoration?.label,
  //       labelText: decoration?.labelText,
  //       labelStyle: decoration?.labelStyle,
  //       floatingLabelStyle: decoration?.floatingLabelStyle,
  //       helperText: decoration?.helperText,
  //       helperStyle: decoration?.helperStyle,
  //       helperMaxLines: decoration?.helperMaxLines,
  //       hintText: decoration?.hintText,
  //       hintStyle: decoration?.hintStyle,
  //       hintTextDirection: decoration?.hintTextDirection,
  //       hintMaxLines: decoration?.hintMaxLines,
  //       errorText: decoration?.errorText,
  //       errorStyle: decoration?.errorStyle,
  //       errorMaxLines: decoration?.errorMaxLines,
  //       floatingLabelBehavior: decoration?.floatingLabelBehavior,
  //       floatingLabelAlignment: decoration?.floatingLabelAlignment,
  //       isCollapsed: decoration?.isCollapsed ?? false,
  //       isDense: decoration?.isDense,
  //       // contentPadding: decoration?.contentPadding,
  //       prefixIcon: decoration?.prefixIcon,
  //       prefixIconConstraints: decoration?.prefixIconConstraints,
  //       prefix: decoration?.prefix,
  //       prefixText: decoration?.prefixText,
  //       prefixStyle: decoration?.prefixStyle,
  //       prefixIconColor: decoration?.prefixIconColor,
  //       suffixIcon: decoration?.suffixIcon,
  //       suffix: decoration?.suffix,
  //       suffixText: decoration?.suffixText,
  //       suffixStyle: decoration?.suffixStyle,
  //       suffixIconColor: decoration?.suffixIconColor,
  //       suffixIconConstraints: decoration?.suffixIconConstraints,
  //       counter: decoration?.counter,
  //       counterText: decoration?.counterText,
  //       counterStyle: decoration?.counterStyle,
  //       filled: decoration?.filled,
  //       fillColor: decoration?.fillColor,
  //       focusColor: decoration?.focusColor,
  //       hoverColor: decoration?.hoverColor,
  //       errorBorder: decoration?.errorBorder,
  //       // focusedBorder: decoration?.focusedBorder,
  //       focusedErrorBorder: decoration?.focusedErrorBorder,
  //       disabledBorder: decoration?.disabledBorder,
  //       enabledBorder: decoration?.enabledBorder,
  //       // border: decoration?.border,
  //       enabled: decoration?.enabled ?? true,
  //       semanticCounterText: decoration?.semanticCounterText,
  //       alignLabelWithHint: decoration?.alignLabelWithHint,
  //       constraints: decoration?.constraints,
  //     );

  TextEditingController? get controller$ => controller;
  String? get initialValue$ => initialValue;
  FocusNode? get focusNode$ => focusNode;

  TextInputType? get keyboardType$ => keyboardType;
  TextCapitalization get textCapitalization$ => textCapitalization;
  TextInputAction? get textInputAction$ => textInputAction;
  TextStyle? get style$ => style;
  StrutStyle? get strutStyle$ => strutStyle;
  TextDirection? get textDirection$ => textDirection;
  TextAlign get textAlign$ => textAlign;
  TextAlignVertical? get textAlignVertical$ => textAlignVertical;
  bool get autofocus$ => autofocus;
  bool get readOnly$ => readOnly;
  ToolbarOptions? get toolbarOptions$ => toolbarOptions;
  bool? get showCursor$ => showCursor;
  String get obscuringCharacter$ => obscuringCharacter;
  bool get obscureText$ => obscureText;
  bool get autocorrect$ => autocorrect;
  SmartDashesType? get smartDashesType$ => smartDashesType;
  SmartQuotesType? get smartQuotesType$ => smartQuotesType;
  bool get enableSuggestions$ => enableSuggestions;
  MaxLengthEnforcement? get maxLengthEnforcement$ => maxLengthEnforcement;
  int? get maxLines$ => maxLines;
  int? get minLines$ => minLines;
  bool get expands$ => expands;
  int? get maxLength$ => maxLength;
  void Function(String)? get onChanged$ => onChanged;
  void Function()? get onTap$ => onTap;
  void Function()? get onEditingComplete$ => onEditingComplete;
  void Function(String)? get onFieldSubmitted$ => onFieldSubmitted;
  void Function(String?)? get onSaved$ => onSaved;
  String? Function(String?)? get validator$ => validator;
  List<TextInputFormatter>? get inputFormatters$ => inputFormatters;
  bool? get enabled$ => enabled;
  double get cursorWidth$ => cursorWidth;
  double? get cursorHeight$ => cursorHeight;
  Radius? get cursorRadius$ => cursorRadius;

  Brightness? get keyboardAppearance$ => keyboardAppearance;
  EdgeInsets get scrollPadding$ => scrollPadding;
  bool? get enableInteractiveSelection$ => enableInteractiveSelection;
  TextSelectionControls? get selectionControls$ => selectionControls;
  Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? get buildCounter$ => buildCounter;
  ScrollPhysics? get scrollPhysics$ => scrollPhysics;
  Iterable<String>? get autofillHints$ => autofillHints;
  AutovalidateMode? get autovalidateMode$ => autovalidateMode;
  ScrollController? get scrollController$ => scrollController;
  String? get restorationId$ => restorationId;
  bool get enableIMEPersonalizedLearning$ => enableIMEPersonalizedLearning;
  MouseCursor? get mouseCursor$ => mouseCursor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller$,
      initialValue: initialValue$,
      focusNode: focusNode$,
      decoration: decoration$,
      keyboardType: keyboardType$,
      textCapitalization: textCapitalization$,
      textInputAction: textInputAction$,
      style: style$,
      strutStyle: strutStyle$,
      textDirection: textDirection$,
      textAlign: textAlign$,
      textAlignVertical: textAlignVertical$,
      autofocus: autofocus$,
      readOnly: readOnly$,
      toolbarOptions: toolbarOptions$,
      showCursor: showCursor$,
      obscuringCharacter: obscuringCharacter$,
      obscureText: obscureText$,
      autocorrect: autocorrect$,
      smartDashesType: smartDashesType$,
      smartQuotesType: smartQuotesType$,
      enableSuggestions: enableSuggestions$,
      maxLengthEnforcement: maxLengthEnforcement$,
      maxLines: maxLines$,
      minLines: minLines$,
      expands: expands$,
      maxLength: maxLength$,
      onChanged: onChanged$,
      onTap: onTap$,
      onEditingComplete: onEditingComplete$,
      onFieldSubmitted: onFieldSubmitted$,
      onSaved: onSaved$,
      validator: validator$,
      inputFormatters: inputFormatters$,
      enabled: enabled$,
      cursorWidth: cursorWidth$,
      cursorHeight: cursorHeight$,
      cursorRadius: cursorRadius$,
      cursorColor: cursorColor$,
      keyboardAppearance: keyboardAppearance$,
      scrollPadding: scrollPadding$,
      enableInteractiveSelection: enableInteractiveSelection$,
      selectionControls: selectionControls$,
      buildCounter: buildCounter$,
      scrollPhysics: scrollPhysics$,
      autofillHints: autofillHints$,
      autovalidateMode: autovalidateMode$,
      scrollController: scrollController,
      restorationId: restorationId$,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning$,
      mouseCursor: mouseCursor$,
    );
  }
}
