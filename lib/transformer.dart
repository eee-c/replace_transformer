library replace.transformer;

import 'dart:async';
import 'package:barback/barback.dart';

class ReplaceTransformer extends Transformer {
  String file;
  Pattern match;
  String replace;

  ReplaceTransformer(this.file, this.match, this.replace);

  ReplaceTransformer.fromList(List a): this(a[0], a[1], a[2]);

  ReplaceTransformer.asPlugin(BarbackSettings settings)
    : this.fromList(_parseSettings(settings));

  Future<bool> isPrimary(Asset input) {
    if (file == input.id.path) return new Future.value(true);
    return new Future.value(false);
  }

  Future apply(Transform transform) {
    var input = transform.primaryInput;

    return transform.
      readInputAsString(input.id).
      then((html){
        var fixed = html.replaceAllMapped(
          // new RegExp(match, multiLine: true),
          // (m) => '><div style="display:none">${m[1]}</div><polymer-element'
          match,
          (m) => replace
        );

        // print(fixed);
        transform.addOutput(new Asset.fromString(input.id, fixed));
      });
  }
}

List<String> _parseSettings(BarbackSettings settings) {
  var args = settings.configuration;
  return [
    args['file'],
    args['match'],
    args['replace']
  ];
}
