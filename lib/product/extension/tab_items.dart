enum TabItems{
  campus,
  activity,
  mySpace,
  clubs,
  resource,
}

extension TabItemsExtension on TabItems{
  String getName(){
    switch(this){
      case TabItems.campus:
      case TabItems.activity:
        return _capitalize(name);
      case TabItems.mySpace:
        return _capitalize(name.toString().splitMapJoin(RegExp(r"(?=[A-Z])"), onMatch: (match) => " ${match.group(0)}").trim());
      case TabItems.clubs:
      case TabItems.resource:
        return _capitalize(name);
    }
  }
  String _capitalize(String name) => name.toString().split(".").last[0].toUpperCase() + name.substring(1);
}