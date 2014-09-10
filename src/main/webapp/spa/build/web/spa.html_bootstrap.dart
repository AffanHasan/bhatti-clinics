library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_meta.dart' as i0;
import 'package:core_elements/core_iconset.dart' as i1;
import 'package:core_elements/core_icon.dart' as i2;
import 'package:paper_elements/paper_focusable.dart' as i3;
import 'package:paper_elements/paper_ripple.dart' as i4;
import 'package:paper_elements/paper_shadow.dart' as i5;
import 'package:paper_elements/paper_button.dart' as i6;
import 'package:core_elements/core_input.dart' as i7;
import 'package:paper_elements/paper_input.dart' as i8;
import 'package:core_elements/core_transition.dart' as i9;
import 'package:core_elements/core_transition_css.dart' as i10;
import 'package:paper_elements/paper_dialog_transition.dart' as i11;
import 'package:core_elements/core_key_helper.dart' as i12;
import 'package:core_elements/core_overlay_layer.dart' as i13;
import 'package:core_elements/core_overlay.dart' as i14;
import 'package:paper_elements/paper_dialog.dart' as i15;
import 'package:core_elements/core_selection.dart' as i16;
import 'package:core_elements/core_selector.dart' as i17;
import 'package:paper_elements/paper_tab.dart' as i18;
import 'package:paper_elements/paper_tabs.dart' as i19;
import 'engine/web_components/daily-opd-create-log-entry-form/daily-opd-create-log-entry-form.dart' as i20;
import 'engine/web_components/daily-opd/daily-opd.dart' as i21;
import 'engine/init-library/init.dart' as i22;
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'engine/web_components/daily-opd-create-log-entry-form/daily-opd-create-log-entry-form.dart' as smoke_0;
import 'package:polymer/polymer.dart' as smoke_1;
import 'package:observe/src/metadata.dart' as smoke_2;
import 'engine/web_components/daily-opd/daily-opd.dart' as smoke_3;
abstract class _M0 {} // PolymerElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #$: (o) => o.$,
        #addEditLogEntryEH: (o) => o.addEditLogEntryEH,
        #barTransitionEnd: (o) => o.barTransitionEnd,
        #blurAction: (o) => o.blurAction,
        #consultant: (o) => o.consultant,
        #consultants: (o) => o.consultants,
        #consultantsList: (o) => o.consultantsList,
        #container: (o) => o.container,
        #contextMenuAction: (o) => o.contextMenuAction,
        #deleteLogEntryEH: (o) => o.deleteLogEntryEH,
        #disabled: (o) => o.disabled,
        #document: (o) => o.document,
        #downAction: (o) => o.downAction,
        #editLogEntryEH: (o) => o.editLogEntryEH,
        #error: (o) => o.error,
        #focusAction: (o) => o.focusAction,
        #formSubmitEH: (o) => o.formSubmitEH,
        #formType: (o) => o.formType,
        #heading: (o) => o.heading,
        #icon: (o) => o.icon,
        #iconSrc: (o) => o.iconSrc,
        #inputChangeAction: (o) => o.inputChangeAction,
        #inputData: (o) => o.inputData,
        #inputFieldsData: (o) => o.inputFieldsData,
        #inputFieldsEH: (o) => o.inputFieldsEH,
        #inputValue: (o) => o.inputValue,
        #invalid: (o) => o.invalid,
        #label: (o) => o.label,
        #logEntry: (o) => o.logEntry,
        #multi: (o) => o.multi,
        #multiline: (o) => o.multiline,
        #nobar: (o) => o.nobar,
        #opened: (o) => o.opened,
        #placeholder: (o) => o.placeholder,
        #raisedButton: (o) => o.raisedButton,
        #rows: (o) => o.rows,
        #selectionSelect: (o) => o.selectionSelect,
        #submitControl: (o) => o.submitControl,
        #submitControlData: (o) => o.submitControlData,
        #toString: (o) => o.toString,
        #transition: (o) => o.transition,
        #transitionEndAction: (o) => o.transitionEndAction,
        #upAction: (o) => o.upAction,
        #viewData: (o) => o.viewData,
        #z: (o) => o.z,
      },
      setters: {
        #consultants: (o, v) { o.consultants = v; },
        #consultantsList: (o, v) { o.consultantsList = v; },
        #container: (o, v) { o.container = v; },
        #formType: (o, v) { o.formType = v; },
        #icon: (o, v) { o.icon = v; },
        #iconSrc: (o, v) { o.iconSrc = v; },
        #inputFieldsData: (o, v) { o.inputFieldsData = v; },
        #inputValue: (o, v) { o.inputValue = v; },
        #multi: (o, v) { o.multi = v; },
        #opened: (o, v) { o.opened = v; },
        #submitControlData: (o, v) { o.submitControlData = v; },
        #transition: (o, v) { o.transition = v; },
        #z: (o, v) { o.z = v; },
      },
      parents: {
        smoke_0.DailyOPDCreateLogEntryForm: _M0,
        smoke_3.DailyOPD: smoke_1.PolymerElement,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_0.DailyOPDCreateLogEntryForm: {
          #consultantsList: const Declaration(#consultantsList, List, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #formType: const Declaration(#formType, String, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #inputFieldsData: const Declaration(#inputFieldsData, Map, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #submitControlData: const Declaration(#submitControlData, Map, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
        },
        smoke_3.DailyOPD: const {},
      },
      names: {
        #$: r'$',
        #addEditLogEntryEH: r'addEditLogEntryEH',
        #barTransitionEnd: r'barTransitionEnd',
        #blurAction: r'blurAction',
        #consultant: r'consultant',
        #consultants: r'consultants',
        #consultantsList: r'consultantsList',
        #container: r'container',
        #contextMenuAction: r'contextMenuAction',
        #deleteLogEntryEH: r'deleteLogEntryEH',
        #disabled: r'disabled',
        #document: r'document',
        #downAction: r'downAction',
        #editLogEntryEH: r'editLogEntryEH',
        #error: r'error',
        #focusAction: r'focusAction',
        #formSubmitEH: r'formSubmitEH',
        #formType: r'formType',
        #heading: r'heading',
        #icon: r'icon',
        #iconSrc: r'iconSrc',
        #inputChangeAction: r'inputChangeAction',
        #inputData: r'inputData',
        #inputFieldsData: r'inputFieldsData',
        #inputFieldsEH: r'inputFieldsEH',
        #inputValue: r'inputValue',
        #invalid: r'invalid',
        #label: r'label',
        #logEntry: r'logEntry',
        #multi: r'multi',
        #multiline: r'multiline',
        #nobar: r'nobar',
        #opened: r'opened',
        #placeholder: r'placeholder',
        #raisedButton: r'raisedButton',
        #rows: r'rows',
        #selectionSelect: r'selectionSelect',
        #submitControl: r'submitControl',
        #submitControlData: r'submitControlData',
        #toString: r'toString',
        #transition: r'transition',
        #transitionEndAction: r'transitionEndAction',
        #upAction: r'upAction',
        #viewData: r'viewData',
        #z: r'z',
      }));
  configureForDeployment([
      i0.upgradeCoreMeta,
      i1.upgradeCoreIconset,
      i2.upgradeCoreIcon,
      i3.upgradePaperFocusable,
      i4.upgradePaperRipple,
      i5.upgradePaperShadow,
      i6.upgradePaperButton,
      i7.upgradeCoreInput,
      i8.upgradePaperInput,
      i9.upgradeCoreTransition,
      i10.upgradeCoreTransitionCss,
      i11.upgradePaperDialogTransition,
      i12.upgradeCoreKeyHelper,
      i13.upgradeCoreOverlayLayer,
      i14.upgradeCoreOverlay,
      i15.upgradePaperDialog,
      i16.upgradeCoreSelection,
      i17.upgradeCoreSelector,
      i18.upgradePaperTab,
      i19.upgradePaperTabs,
      () => Polymer.register('daily-opd-create-log-entry-form', i20.DailyOPDCreateLogEntryForm),
      () => Polymer.register('daily-opd', i21.DailyOPD),
    ]);
  i22.main();
}
