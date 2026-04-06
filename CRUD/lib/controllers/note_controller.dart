import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/note.dart';
import '../models/note_database.dart';

class NoteController {
  final BuildContext context;
  final TextEditingController textController = TextEditingController();

  NoteController(this.context);

  void addNote() {
    if (textController.text.isNotEmpty) {
      context.read<NoteDatabase>().addNote(textController.text);
      textController.clear();
    }
  }

  void fetchNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void updateNote(int id) {
    if (textController.text.isNotEmpty) {
      context.read<NoteDatabase>().updateNote(id, textController.text);
      textController.clear();
    }
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }
}
