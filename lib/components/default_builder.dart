import 'package:flutter/material.dart';

import 'loading_spinnder.dart';

typedef OnSucBuild<T> = Widget Function(T);
FutureBuilder<T> defaultBuilder<T>(
  Future<T> future,
  OnSucBuild<T> onSucses,
) {
  return FutureBuilder(
    future: future,
    builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
      switch (snapshot.connectionState) {
        // if not started or waiting show loading
        case ConnectionState.none:
        case ConnectionState.waiting:
          return getCircularSpinner();
          break;
        //case ConnectionState.active:
        //case ConnectionState.done:
        default:
          if (!snapshot.hasError) {
            //print(onSucses(snapshot.data));
            return onSucses(snapshot.data);
          } else {
            // todo:remove
            print(snapshot.error);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('ERROR:'),
                )
              ],
            );
          }
      }
    },
  );
}
