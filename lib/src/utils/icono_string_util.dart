import 'package:flutter/material.dart';


final _icons = <String, IconData> {
  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'blur_on'       : Icons.blur_on,
  'input'         : Icons.input,
  'list'          : Icons.list,
  'tune'          : Icons.tune,
};

Icon getIcon (String nombreIcono){

  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}