// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<String>? _$toggleMusicButtonTxtComputed;

  @override
  String get toggleMusicButtonTxt => (_$toggleMusicButtonTxtComputed ??=
          Computed<String>(() => super.toggleMusicButtonTxt,
              name: '_SettingsStore.toggleMusicButtonTxt'))
      .value;

  late final _$isBgMusicPlayingAtom =
      Atom(name: '_SettingsStore.isBgMusicPlaying', context: context);

  @override
  bool get isBgMusicPlaying {
    _$isBgMusicPlayingAtom.reportRead();
    return super.isBgMusicPlaying;
  }

  @override
  set isBgMusicPlaying(bool value) {
    _$isBgMusicPlayingAtom.reportWrite(value, super.isBgMusicPlaying, () {
      super.isBgMusicPlaying = value;
    });
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

  @override
  void initMusic() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.initMusic');
    try {
      return super.initMusic();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseMusic() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.pauseMusic');
    try {
      return super.pauseMusic();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resumeMusic() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.resumeMusic');
    try {
      return super.resumeMusic();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMusic() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.toggleMusic');
    try {
      return super.toggleMusic();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBgMusicPlaying: ${isBgMusicPlaying},
toggleMusicButtonTxt: ${toggleMusicButtonTxt}
    ''';
  }
}
