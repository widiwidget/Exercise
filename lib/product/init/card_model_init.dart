

import 'package:exercise/core/const/colors.dart';

import '../../feature/my_space/model/card_model.dart';
import '../../feature/my_space/model/note_card_high_model.dart';

class ProjectInit{
  List<CardModel> cardModelList = [
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00"),
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00",isActive: true),
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00"),
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00"),
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00"),
    CardModel(title: "Marketing principles and strategies", roomInform: "Room 204 . UPCOMING", time: "10:00 - 11:00"),
  ];
  List<NoteCardHighModel> noteCardHighModelList = [
    NoteCardHighModel(color: AppColor.turkishBoy.getColor(), note: 9.4, lessonName: "lessonName"),
    NoteCardHighModel(color: AppColor.turkishBoy.getColor(), note: 9.7, lessonName: "lessonName"),
    NoteCardHighModel(color: AppColor.hotCoral.getColor(), note: 6.4, lessonName: "lessonName"),
    NoteCardHighModel(color: AppColor.turkishBoy.getColor(), note: 9.2, lessonName: "lessonName"),
    NoteCardHighModel(color: AppColor.turkishBoy.getColor(), note: 9.0, lessonName: "lessonName"),
    NoteCardHighModel(color: AppColor.turkishBoy.getColor(), note: 8.9, lessonName: "lessonName"),
  ];
}