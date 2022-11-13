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

  late final _$initMusicAsyncAction =
      AsyncAction('_SettingsStore.initMusic', context: context);

  @override
  Future<void> initMusic() {
    return _$initMusicAsyncAction.run(() => super.initMusic());
  }

  late final _$pauseMusicAsyncAction =
      AsyncAction('_SettingsStore.pauseMusic', context: context);

  @override
  Future<void> pauseMusic() {
    return _$pauseMusicAsyncAction.run(() => super.pauseMusic());
  }

  late final _$resumeMusicAsyncAction =
      AsyncAction('_SettingsStore.resumeMusic', context: context);

  @override
  Future<void> resumeMusic() {
    return _$resumeMusicAsyncAction.run(() => super.resumeMusic());
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

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
